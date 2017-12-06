#!/bin/bash
#PBS -l walltime=72:00:00
#PBS -q default
#PBS -l nodes=1:ppn=1
#PBS -N getBAMcounts
#PBS -o /data3/prabhani/allFiles/log
#PBS -e /data3/prabhani/allFiles/log
#PBS -t 1-40

datafolder=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $1}' /data3/prabhani/allFiles/careyFiles.txt)
datafile1=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $2}' /data3/prabhani/allFiles/careyFiles.txt)
datafile2=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $3}' /data3/prabhani/allFiles/careyFiles.txt)

outfolder1=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $5}' /data3/prabhani/allFiles/careyFiles.txt)
outfolder2=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $6}' /data3/prabhani/allFiles/careyFiles.txt)
outfolder3=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $4}' /data3/prabhani/allFiles/careyFiles.txt)

cd /data3/prabhani/allFiles/${outfolder1}/${outfolder2}/${outfolder3}

module load STAR/2.5.3a-foss-2016b

STAR --outFilterMismatchNmax 4 --genomeDir /data3/prabhani/allFiles/genome --readFilesCommand zcat  --genomeLoad NoSharedMemory --readFilesIn ${datafolder}/${datafile1} ${datafolder}/${datafile2} --runThreadN 5 --quantMode GeneCounts


