#!/usr/bin/env bash

cd engine
make clean-all BUILD_DC=1
cd ..

rm -f ../bin/*
