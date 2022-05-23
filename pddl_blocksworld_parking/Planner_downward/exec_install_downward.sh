#!/bin/sh

echo 'Installing dependencies'
sudo apt-get install mercurial g++ make python flex bison gawk
sudo apt-get install g++-multilib
echo 'Downloading downward'
cd ..
hg clone http://hg.fast-downward.org Planner_downward
echo 'Installing downward'
cd Planner_downward
./build_all
