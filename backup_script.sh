#!/bin/bash
#parameters: 
# $1 - path to the syncing directory
# $2 - path to the directory where the copies of the files will be stored.
rsync -rtu —delete —info=BACKUP,REMOVE --log-file=~/rsync.log «~/$1/« «~/$2»
