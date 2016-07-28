#!/bin/sh

export PATH=$PATH:/usr/local/bin

ROOT=`pwd`
TEST_GIT=https://github.com/Z3Prover/z3test.git
TEST_DIR=z3test
Z3_GIT=https://github.com/Z3Prover/z3.git
Z3_DIR=$HOME/z3
BRANCH=master
export Z3DIR=$Z3_DIR
export MAKEJOBS=4

LAST_Z3TEST_HASH=
LAST_Z3_HASH=
CURRENT_Z3TEST_HASH=
CURRENT_Z3_HASH=

if [ -f last_z3test_hash ]; then
    LAST_Z3TEST_HASH=`cat $ROOT/last_z3test_hash` ;
fi 

if [ -f last_z3_hash ]; then
    LAST_Z3_HASH=`cat $ROOT/last_z3_hash` ;
fi

if [ -d $TEST_DIR ]; then
    cd $TEST_DIR ; 
    if [ "$?" != "0" ]; then echo "cd failed." && exit 1; fi
    git pull ;
    if [ "$?" != "0" ]; then echo "git pull failed." && exit 1; fi
    CURRENT_Z3TEST_HASH=`git rev-parse HEAD`
    cd - > /dev/null;
else
    git clone $TEST_GIT $TEST_DIR
    if [ "$?" != "0" ]; then echo "git clone failed." && exit 1; fi
fi


if [ -d $Z3_DIR ]; then
    cd $Z3_DIR ;
    if [ "$?" != "0" ]; then echo "cd failed." && exit 1; fi
    git pull --rebase ;
    if [ "$?" != "0" ]; then echo "git pull failed." && exit 1; fi
    CURRENT_Z3_HASH=`git rev-parse HEAD` ;
    cd - > /dev/null;
else
    git clone $Z3_GIT $Z3_DIR --branch $BRANCH
    if [ "$?" != "0" ]; then echo "git clone failed." && exit 1; fi
fi

echo L=$LAST_Z3_HASH
echo L=$LAST_Z3TEST_HASH
echo C=$CURRENT_Z3_HASH
echo C=$CURRENT_Z3TEST_HASH
echo Z3DIR=$Z3DIR
if [ "$LAST_Z3_HASH" = "$CURRENT_Z3_HASH" ]; then 
    if [ "$LAST_Z3TEST_HASH" = "$CURRENT_Z3TEST_HASH" ]; then
        echo git hashes match previous version - not rebuilding. ;
        echo Build succeeded. ;
        exit 0 ;
    fi
fi

cd $TEST_DIR
python scripts/smalltest.py
RV=$?
cd - > /dev/null
if [ "$RV" != "0" ]; then echo "(small|big)test failed." && exit 1; fi
cd $Z3_DIR 
if [ "$?" != "0" ]; then echo "cd failed." && exit 1; fi
rm -rf build build-dist dist
if [ "$?" != "0" ]; then echo "cleanup2 failed." && exit 1; fi
python scripts/mk_unix_dist.py --githash --dotnet-key=~/secret/z3.snk
if [ "$?" != "0" ]; then echo "distribution build failed." && exit 1; fi
git rev-parse HEAD > $ROOT/last_z3_hash 
cd - > /dev/null

cd $TEST_DIR
git rev-parse HEAD > $ROOT/last_z3test_hash 
cd - > /dev/null

echo Build succeeded.
exit 0
