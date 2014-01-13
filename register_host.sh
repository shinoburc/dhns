#!/bin/sh
#
# $Id: register_host.sh 165 2009-11-29 08:31:28Z dot $
#

. /etc/dhns/config.sh

URL="${DHNS_SERVER_URL}?mode=register&session=${SESSION}&ip=${IP}&hostname=${HOSTNAME}";

wget -q -O /tmp/register_ip_log ${URL}
cat /tmp/register_ip_log
rm /tmp/register_ip_log
