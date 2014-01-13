#!/bin/sh

# $Id: setup.sh 167 2009-11-29 13:54:45Z dot $

echo "INTERFACE='eth0'" > config.sh
echo "SESSION='session_${RANDOM}${RANDOM}${RANDOM}'" >> config.sh
echo "DHNS_SERVER_URL='http://dandydot.homeip.net/cgi-bin/dhns/index.cgi'" >> config.sh
echo 'IP=`ifconfig $INTERFACE | head -n 2 | tail -n 1 | cut -d ":" -f2 | cut -d " " -f1`' >> config.sh
echo 'HOSTNAME=`hostname`' >> config.sh
echo "HOSTS='/etc/hosts'" >> config.sh
