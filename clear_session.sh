#!/bin/sh
#
# $Id: register_ip.sh 157 2009-11-03 22:33:01Z dot $
#

. /etc/dhns/config.sh

URL="${DHNS_SERVER_URL}?mode=clear&session=${SESSION}";

wget -q -O /tmp/clear_session_log ${URL}
cat /tmp/clear_session_log
rm /tmp/clear_session_log
