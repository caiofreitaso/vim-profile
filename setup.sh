#!/bin/bash

git submodules --init --recursive

cd bundle/vimcaps/autoload
make
cd ../../..
