#!/bin/bash

# Three major catagories to trace file descriptors:
# NSO itself: pgrep ncs.smp
# java-vm (only one, running NEDs): pgrep -f com.tailf.ncs.NcsJVMLauncher
# python(maybe multiple, one for each package/service): pgrep -f ncs_pyvm/startup.py

LOG_FILE="/tmp/nso_fd_counts.log"

while true
time_stamp=$(date)
do
    echo "$time_stamp,   ncs, $(ls -l /proc/$(pgrep ncs.smp)/fd | wc -l)" | tee -a $LOG_FILE
    echo "$time_stamp,  java, $(ls -l /proc/$(pgrep -f com.tailf.ncs.NcsJVMLauncher)/fd | wc -l)" | tee -a $LOG_FILE
    total=0 
    for pid in `pgrep -f ncs_pyvm/startup.py` 
    do 
        num=$(ls -l /proc/$pid/fd | wc -l)
        total=$(($total+$num))
    done 
    echo "$time_stamp,python, $total" | tee -a $LOG_FILE
    sleep 60
done
