#!/bin/bash
#PBS -l walltime=72:00:00
#PBS -q default
#PBS -l nodes=1:ppn=1
#PBS -N getBAMcounts
#PBS -o /data3/prabhani/allFiles/log
#PBS -e /data3/prabhani/allFiles/log
#PBS -t 1-40

bash runstar.sh /data3/prabhani/allFiles/



