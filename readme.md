chmod +x llvm_configure.sh

sudo cp llvm_configure.sh /usr/local/bin

llvm_configure.sh -B Awiwi -S palindromo.ll

cd awiwi

make

./palindromo
