#!/bin/bash

set -e


# Color codes
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

function find_llvm_tools() {
    FOUND_LLVM_AS=false
    FOUND_LLC=false
    FOUND_LLD=false

    for version in {20..10}; do

        if [[ $FOUND_LLVM_AS == false ]]; then
            LLVM_AS="llvm-as-$version"

            if command -v "$LLVM_AS" &>/dev/null; then
                FOUND_LLVM_AS=true
                echo "Found llvm assembler at ${CYAN}$(command -v "$LLVM_AS")${RESET}"
            fi
        fi

        if [[ $FOUND_LLC == false ]]; then
            LLC="llc-$version"

            if command -v "$LLC" &>/dev/null; then
                FOUND_LLC=true
                echo "Found llvm compiler at ${CYAN}$(command -v "$LLC")${RESET}"
            fi
        fi

        if [[ $FOUND_LLD -eq false ]]; then
            LLD="lld-$version"

            if command -v "$LLD" &>/dev/null; then
                FOUND_LLD=true
                echo "Found llvm linker at ${CYAN}$(command -v "$LLD")${RESET}"
            fi
        fi

        if [[ $FOUND_LLVM_AS == true && $FOUND_LLC == true && $FOUND_LLD == true ]]; then
            break
        fi
    done
}

function find_gnu_libc() {
    local crti_path=$(find /usr -name "crti.o" 2>/dev/null | grep -v musl)

    if [[ -n "$crti_path" ]]; then
        dirname "$crti_path"
    else
        echo -n
    fi
}

function find_musl_libc() {
    local crti_path=$(find /usr -name "crti.o" 2>/dev/null | grep musl)

    if [[ -n "$crti_path" ]]; then
        dirname "$crti_path"
    else
        echo -n
    fi
}

function check_object_files() {
    local lic_path="$1"
    local obj_files="crt1.o crti.o crtn.o"

    for obj in $obj_files; do
        if [ ! -f "$lic_path/$obj" ]; then
            echo "${RED}Error:${RESET} Object file ${CYAN}$obj${RESET} not found."
            return 1
        fi
    done

    return 0
}

function build_makefile() {
    local use_musl=$1
    local ld_flags="$1"

    if [[ $use_musl == 1 ]]; then
        local ld_flags="-static -nostdlib"
    else
        local ld_flags="-dynamic-linker \$(DYNAMIC_LINKER)"
    fi

cat << EOF > $BUILD_FOLDER/Makefile
# LLVM tools and filenames
LLVM_AS := $LLVM_AS
LLC     := $LLC
LLD     := $LLD

SRC      := $ASM_FILE
BITCODE  := $BC_FILE
OBJ      := $OBJ_FILE
EXE      := $EXE_FILE

# System dynamic linker
DYNAMIC_LINKER := $DYN_LINKER_PATH
LIBC_DIR := $LIBC_DIR

.PHONY: all clean

all: \$(EXE)

# Step 1: Generate bitcode from the LLVM IR file
\$(BITCODE): \$(SRC)
	\$(LLVM_AS) \$(SRC) -o \$(BITCODE)

# Step 2: Generate an object file from the bitcode
\$(OBJ): \$(BITCODE)
	\$(LLC) \$(BITCODE) -filetype=obj -o \$(OBJ)

# Step 3: Link the object file into an executable with the dynamic linker and libc
\$(EXE): \$(OBJ)
	\$(LLD) -flavor gnu \\
		-o \$(EXE) \\
		$ld_flags \\
		-L \$(LIBC_DIR) \\
		\$(LIBC_DIR)/crt1.o \\
		\$(LIBC_DIR)/crti.o \\
		\$(OBJ) -lc \\
		\$(LIBC_DIR)/crtn.o

clean:
	rm -f \$(BITCODE) \$(OBJ) \$(EXE)
EOF
}

#================================================================

VERSION="0.2.0"
echo "${BLUE}llv_configure${RESET} version ${CYAN}$VERSION${RESET}"
echo "----------------------------"

# CLI Arguments
BUILD_FOLDER=""
SRC_FILENAME=""
WITH_MUSL=0

while [ $# -gt 0 ]; do
    case "$1" in
        -B) shift; BUILD_FOLDER="$1" ;;
        -S) shift; SRC_FILENAME="$1" ;;
        --with-musl) WITH_MUSL=1 ;;
        ?) echo "Usage: $0 [--with-musl] -B <folder> -S <filename>"
           exit 1 ;;
    esac
    shift
done

# Ensure both flags were provided
if [[ -z "$BUILD_FOLDER" || -z "$SRC_FILENAME" ]]; then
    echo "${RED}Error:${RESET} Both -B <folder> and -S <filename> are required."
    echo echo "Usage: $0 [--with-musl] -B <folder> -S <filename>"
    exit 1
fi

ABORT_CONFIGURE=false

if [[ $WITH_MUSL == 1 ]]; then
    LIBC_DIR=$(find_musl_libc)

    if [[ -z $LIBC_DIR ]]; then
        echo "${RED}Error:${RESET} Cannot find MUSL C library"
        ABORT_CONFIGURE=true
    else
        echo "Found MUSL C library at ${CYAN}$LIBC_DIR${RESET}"
    fi
else
    LIBC_DIR=$(find_gnu_libc)

    if [[ -z $LIBC_DIR ]]; then
        echo "${RED}Error:${RESET} Cannot find standard C library"
        ABORT_CONFIGURE=true
    else
        echo "Found standard C library at ${CYAN}$LIBC_DIR${RESET}"
    fi

    DYN_LINKER_PATH=$(ldd /bin/sh | awk '/ld-linux-x86-64\.so\.2/ { print $1 }')

    if [[ -z $DYN_LINKER_PATH ]]; then
        echo "${RED}Error:${RESET} Cannot find linux dynamic linker"
        ABORT_CONFIGURE=true
    else
        echo "Found Linux dynamic linker at ${CYAN}$DYN_LINKER_PATH${RESET}"
    fi
fi

if ! check_object_files $LIBC_DIR; then
    exit 1
fi

find_llvm_tools

if [[ $FOUND_LLVM_AS == false ]]; then
    echo "${RED}Error:${RESET} LLVM assembler not found."
    ABORT_CONFIGURE=true
fi

if [[ $FOUND_LLC == false ]]; then
    echo "${RED}Error:${RESET} LLVM compiler not found."
    ABORT_CONFIGURE=true
fi

if [[ $FOUND_LLD == false ]]; then
    echo "${RED}Error:${RESET} LLVM linker not found."
    ABORT_CONFIGURE=true
fi

if [[ $ABORT_CONFIGURE == true ]]; then
    exit 1
fi

if [ -d $BUILD_FOLDER ]; then
    echo "${RED}Error:${RESET} Target directory ${BLUE}$BUILD_FOLDER${RESET} already exists"
    exit 1
fi

mkdir -p $BUILD_FOLDER


ASM_FILE=$(realpath $SRC_FILENAME)
EXE_FILE=$(basename -s .ll "$ASM_FILE")
OBJ_FILE="${EXE_FILE}.o"
BC_FILE="${EXE_FILE}.bc"

echo -n "Generating Makefile in folder ${CYAN}$BUILD_FOLDER${RESET} "

build_makefile $WITH_MUSL

echo "${GREEN}done${RESET} ..."


