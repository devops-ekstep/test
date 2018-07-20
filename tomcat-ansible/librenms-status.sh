#!/bin/bash
echo "--------------------------"
echo Host = $HOSTNAME

if [ $(rpm -qa| grep snmp | wc -l) -ne 0 ]; then
echo "Snmp Service is installed"
fi

status="systemctl show -p ActiveState snmpd | sed 's/ActiveState=//g'"
eval $status

if [ $(netstat -antup | grep -i 161| wc -l) -ne 0 ]; then
echo "Snmp is Running"
else
echo "snmp is not running"
fi

echo "--------------------------"
