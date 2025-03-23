# LLVM tools and filenames
LLVM_AS := llvm-as-19
LLC     := llc-19
LLD     := lld-19

SRC      := /mnt/c/Users/josue/Downloads/llvm/llvm/minimum/minimum.ll
BITCODE  := minimum.bc
OBJ      := minimum.o
EXE      := minimum

# System dynamic linker
DYNAMIC_LINKER := /lib64/ld-linux-x86-64.so.2
LIBC_DIR := /usr/lib/x86_64-linux-gnu

.PHONY: all clean

all: $(EXE)

# Step 1: Generate bitcode from the LLVM IR file
$(BITCODE): $(SRC)
	$(LLVM_AS) $(SRC) -o $(BITCODE)

# Step 2: Generate an object file from the bitcode
$(OBJ): $(BITCODE)
	$(LLC) $(BITCODE) -filetype=obj -o $(OBJ)

# Step 3: Link the object file into an executable with the dynamic linker and libc
$(EXE): $(OBJ)
	$(LLD) -flavor gnu \
		-o $(EXE) \
		-dynamic-linker $(DYNAMIC_LINKER) \
		-L $(LIBC_DIR) \
		$(LIBC_DIR)/crt1.o \
		$(LIBC_DIR)/crti.o \
		$(OBJ) -lc \
		$(LIBC_DIR)/crtn.o

clean:
	rm -f $(BITCODE) $(OBJ) $(EXE)
