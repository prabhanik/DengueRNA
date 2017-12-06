#!/usr/bin/env bash

datafolder=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $1}' $1/careyFiles.txt)
datafile1=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $2}' $1/careyFiles.txt)
datafile2=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $3}' $1/careyFiles.txt)

outfolder1=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $5}' $1/careyFiles.txt)
outfolder2=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $6}' $1/careyFiles.txt)
outfolder3=$(awk -v arrayid="${PBS_ARRAYID}" 'NR == arrayid {print $4}' $1/careyFiles.txt)

cd $1/${outfolder1}/${outfolder2}/${outfolder3}

module load STAR/2.5.3a-foss-2016b

STAR --outFilterMismatchNmax 4 --genomeDir $1/genome --readFilesCommand zcat  --genomeLoad NoSharedMemory --readFilesIn ${datafolder}/${datafile1} ${datafolder}/${datafile2} --runThreadN 5 --quantMode GeneCounts

