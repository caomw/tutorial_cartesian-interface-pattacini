#!/bin/bash

# Copyright: (C) 2016 iCub Facility - Istituto Italiano di Tecnologia
# Authors: Ugo Pattacini <ugo.pattacini@iit.it>
# CopyPolicy: Released under the terms of the GNU GPL v3.0.

# color codes
red='\033[1;31m'
green='\033[1;32m'
nc='\033[0m'

code_dir=$(pwd)/../
test_dir=$(pwd)

if [ -d build ]; then
    rm build -rf
fi
mkdir build && cd build
build_dir=$(pwd)

git clone https://github.com/vvv-school/vvv-school.github.io.git
if [ $? -eq 0 ]; then        
    ./vvv-school.github.io/scripts/smoke-test.sh $build_dir $code_dir $test_dir
    ret=$?
else
    echo -e "${red}GitHub seems unreachable${nc}"
    ret=4
fi

exit $ret
    
