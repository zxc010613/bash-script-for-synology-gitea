#!/bin/bash
# See Wiki for instructions.

DIRECTORY_PATH=/volume1/docker/gitea/backups
cd $DIRECTORY_PATH
FILES=*
for f in $FILES
do
	if [ "${#f}" -eq 34 ]; then
		continue
    fi
	if  [[ $f == gitea-dump-* ]]; then
    	IDX=`expr index "$f" dump-`
    	IDX=$((IDX+5))
    	LENGTH=`expr index "$f" .z`
    	LENGTH=$((LENGTH-1))
    	LENGTH=$((LENGTH-IDX))
    	TIMESTAMP=${f:IDX:LENGTH}
    	DATETIME=`date -d @$TIMESTAMP "+%Y-%m-%d-%H-%M-%S"`
    	FILENAME="gitea-dump-"$DATETIME".zip"
    	mv $f $FILENAME
    	echo $f" to " $FILENAME"!"
	fi
done