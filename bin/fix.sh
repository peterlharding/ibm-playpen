#!/bin/sh

NEW_NAME=`ls S* | awk '{print $2'} | sed 's/-//g'`

echo $NEW_NAME

mv S* $NEW_NAME

ls -l


