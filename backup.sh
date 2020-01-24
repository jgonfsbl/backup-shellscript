#!/bin/bash
##
## SCRIPT FOR SIMPLE YET PERSONALIZED BACKUPS
##
## Version 2.0, January 24, 2020
## by EA1HET, Jonathan GONZALEZ (j@0x30.io)
##
## Dependecies:
##     - bzip2: provides a simple yet powerful backup compression solution
## 
## Configuration file format:
##
##     name_you_like : path
##
## Example:
##
##     mydocs : /home/user/documents
##

## VARIABLES ##################################################################

# Configuration file location.
CONFIG=/opt/backup_nas.txt

# Temporal directory.
TMPDIR=/opt/tmp

# Destination backup folder.
BKPDIR=/opt/NFS/backups

# Date format for backups.
FECHA=$(date +%G-%m-%dT%T)

# Retention period, in days.
PRET=7

##
## DO NOT EDIT BEYOND THIS POINT  #############################################
##

LPROG=$(cat $CONFIG | awk '{ print $1 }')

# Task 1: Perform backup itself
for i in $LPROG
do
    ITEM=$(cat $CONFIG | awk '{ print $3 }' | grep $i )
    cd $ITEM
    CDIR=$(basename "$PWD")
    cd ..
    tar -cjf $TMPDIR/$i-$FECHA.tar.bz2 $CDIR
    cp -f $TMPDIR/$i-$FECHA.tar.bz2 $BKPDIR
    rm -f $TMPDIR/$i-$FECHA.tar.bz2
done

cd $BKPDIR

# Task 2: Expurgate backups with creation date beyond retention period
for i in $LPROG
do
    LFICH=($i*)
    for ((j=0; j<(${#LFICH[@]}-$PRET); j++))
    do
        rm -f "${LFICH[$j]}"
    done
done

###############################################################################
