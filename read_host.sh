#!/bin/sh
#
# $Id: read_host.sh 165 2009-11-29 08:31:28Z dot $
#

. /etc/dhns/config.sh

URL="${DHNS_SERVER_URL}?session=${SESSION}";

wget -q -O /tmp/print_ip_log ${URL}
cat /tmp/print_ip_log
rm /tmp/print_ip_log
