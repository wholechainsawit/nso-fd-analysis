# NSO File Descriptors(FD) Analysis

NSO uses `ulimit -n` as the file descriptor limit of the NSO process. This repository provides a shell script to track the number of open descriptors opened by NSO and a Panda dataframe analysis.


# The total FD used by NSO can be counted by checking following processes:

1. NSO itself: pgrep ncs.smp
2. java-vm (only one, running NEDs): pgrep -f com.tailf.ncs.NcsJVMLauncher
3. python (may be multiple, one for each package/service): pgrep -f ncs_pyvm/startup.py


Listing file descriptors per process:

    lsof -p <pid> works fine.
    ls /proc/<pid>/fd

Showing active tcp session:

    ss -tp | grep pid=<pid>

Showing fd limits per process:

    cat /proc/<pid>/limits
