chmod +x llvm_configure.sh

sudo cp llvm_configure.sh /usr/local/bin

llvm_configure.sh -B Awiwi -S palindromo.ll
llvm_configure.sh -B test -S test.ll

cd awiwi

make

./test
