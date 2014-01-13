#!/bin/sh

# $Id: hosts-edit.sh 166 2009-11-29 08:50:23Z dot $

. /etc/dhns/config.sh

cp $HOSTS $HOSTS.backup
sh /etc/dhns/hosts-clean.sh > $HOSTS.clean
mv $HOSTS.clean $HOSTS
echo  '#### Start Dynamic Host Name ####' >> $HOSTS
sh /etc/dhns/read_host.sh >> $HOSTS
echo '#### End Dynamic Host Name ####' >> $HOSTS
