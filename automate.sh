#!/bin/bash

echo Restarting docker...  
sudo service docker stop  
sudo service docker start

#Must remove a preexisting container with the name we are going to use
sudo docker rm -f fastqc

echo pulling conradstoerker/fastqc...
sudo docker pull conradstoerker/fastqc

# change '/home/conrad/fastQC_docker/fastq_files/' to the directory with your fastq files
echo running conradstoerker/fastqc...
sudo docker run --name fastqc -i -v '/home/conrad/fastQC_docker/fastq_files/':/fastqc/data conradstoerker/fastqc

echo exiting...
sudo docker rm -f fastqc

