#!/bin/bash

git clone $1 /r-svn --depth=1

cd /r-svn

echo '.gitignore' >>.gitignore
echo 'build/' >>.gitignore
echo 'src/library/Recommended/*gz' >>.gitignore

mkdir /r-svn/build && cd /r-svn/build

wget https://raw.githubusercontent.com/lionel-/contributing/master/inst/GNUmakefile

wget https://raw.githubusercontent.com/lionel-/contributing/master/inst/make-svn-revision

chmod +x make-svn-revision

cp /rsourcetools/build.sh ./build.sh
