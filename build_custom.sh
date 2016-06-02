#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Need a temporary path for git clone"
    echo -e "\nUsage: $0 [build_path] [tag]\n"
    exit 1
fi

. /erlang/17.5/activate

git clone https://github.com/leo-project/leofs.git $1
cd $1

if [ $# -ge 2 ]; then
    git checkout $2
fi

make
make release
