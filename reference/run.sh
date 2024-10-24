#!/bin/sh

rm -rf craftfrb.difx
rm -rf log*
errormon2 6 &
export ERRORMONPID=$!
mpirun --oversubscribe -mca btl self -np 11 mpifxcorr askapdifxtest_1.input --nocommandthread
kill $ERRORMONPID
rm -f craftfrb.difxlog
mv log craftfrb.difxlog
