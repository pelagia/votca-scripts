#!/bin/tcsh
#
#$ -pe PE_8 8
#$ -o idft.out
#$ -e idft.err
#$ -cwd
#$ -j n
#$ -m eab
#$ -M wehnerj@mpip-mainz.mpg.de
#$ -N idft

set workdir=`pwd`
echo "Workdir is $workdir"

mkdir -p /usr/scratch/kordt/idft

setenv g09root /sw/linux/gaussian
setenv GAUSS_SCRDIR /usr/scratch/kordt
source $g09root/g09/bsd/g09.login
source ~/tm_init
source ~/votca/bin/VOTCARC.csh

#echo $LD_LIBRARY_PATH

ctp_parallel -e "idft" -o options.xml -f /people/thnfs/homes/kordt/Projects/DPBIC/calculations/MerzKollmann/state.sql -t 8 -c 8 -r 'stat(FAILED)' 
