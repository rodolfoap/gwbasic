case "$1" in
 e)	vi -p drive_c/{autoexec.bat,config.sys}
	;;
 d)	dosemu -t drive_c/bin/DEBUG.COM
	;;
"")	dosemu -t
	;;
esac
