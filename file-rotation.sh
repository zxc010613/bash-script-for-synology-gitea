#!/bin/bash

#predefined variable
M=60
H=3600
#Requiures input
FILES=/volume1/docker/gitea/backups/*
IF_SET=$((H*6))

for f in $FILES
do
  FILETIME=`stat -c %Y $f`
  NOW=$(awk 'BEGIN {srand(); print srand()}')
  TIMEDIFF=$((NOW-FILETIME))
  if [ ${IF_SET} -le ${TIMEDIFF} ];then
	echo "delete file:"$f && rm -f $f
  fi
done