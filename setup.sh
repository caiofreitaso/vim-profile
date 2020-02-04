#!/bin/bash

git submodule init
git submodule update

cd bundle/vimcaps/autoload
make
cd ../../..
