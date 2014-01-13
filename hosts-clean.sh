#!/bin/sh

# $Id: hosts-clean.sh 165 2009-11-29 08:31:28Z dot $

. /etc/dhns/config.sh

START=`grep -n '#### Start Dynamic Host Name ####' $HOSTS | cut -d ':' -f1`
if [ x$START == 'x' ] ; then
  cat $HOSTS
  exit
fi
START=`expr $START - 1`
END=`grep -n '#### End Dynamic Host Name ####' $HOSTS | cut -d ':' -f1`
LINE=`wc -l $HOSTS | cut -d ' ' -f1`

TAIL_LINE_LENGTH=`expr $LINE - $END`

head -n $START $HOSTS
tail -n $TAIL_LINE_LENGTH $HOSTS
