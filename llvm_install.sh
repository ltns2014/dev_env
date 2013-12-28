#!/usr/bin/env bash

wget http://llvm.org/releases/3.3/llvm-3.3.src.tar.gz
wget http://llvm.org/releases/3.3/cfe-3.3.src.tar.gz
wget http://llvm.org/releases/3.3/clang-tools-extra-3.3.src.tar.gz
wget http://llvm.org/releases/3.3/compiler-rt-3.3.src.tar.gz
wget http://llvm.org/releases/3.3/libcxx-3.3.src.tar.gz

for file in $(ls *.tar.gz); do
    tar zxvf $file
done

mv cfe-3.3.src clang
mv clang-tools-extra-3.3.src extra
mv compiler-rt-3.3.src compiler-rt
mv llvm-3.3.src llvm

mv extra clang/tools/
mv clang llvm/tools/
mv compiler-rt llvm/projects/

mkdir -pv build && cd build
../llvm/configure --enable-optimized --enable-targets=host-only && make -j4
