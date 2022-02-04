#!/bin/sh
git submodule update --init --recursive
cd lib/lua/lua-language-server/3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
