#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Need a temporary path for git clone"
    echo -e "\nUsage: $0 [build_path] [tag] [erlang]\n"
    exit 1
fi

if [ $# -ge 3 ]; then
    . /erlang/$3/activate
else
    . /erlang/17.5/activate
fi

git clone https://github.com/leo-project/leofs.git $1
cd $1

if [ $# -ge 2 ]; then
    git checkout $2
fi

make
make release
