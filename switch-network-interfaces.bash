#!/usr/bin/bash
# Intelligent switches between WICD and NetworkManager
# This is sometimes necessary as WICD has several bugs dealing with
# certain authentication schemes

WICD_STATUS=`systemctl is-active wicd.service`
NM_STATUS=`systemctl is-active NetworkManager.service`

start_wicd () {
	systemctl stop NetworkManager.service
	pkill -9 nm-applet
	systemctl start wicd.service
	nohup wicd-client &
}

start_nm () {
	systemctl stop wicd.service
	pkill -9 wicd-client
	systemctl start NetworkManager.service
	nohup nm-applet &
}
echo WICD = $WICD_STATUS
echo NM = $NM_STATUS

if [ $WICD_STATUS = "active" ] && [ $NM_STATUS = "unknown" ] ; then
	echo "Starting NetworkManager, stopping WICD"
	start_nm
elif [ $WICD_STATUS = "inactive" ] && [ $NM_STATUS = "active" ] ; then
	echo "Starting WICD, stopping NetworkManager"
	start_wicd
fi

