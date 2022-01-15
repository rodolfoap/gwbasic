case "$1" in
 e)	dosemu -t
	;;
 d)	dosemu -t drive_c/bin/DEBUG.COM
	;;
"")	dosemu -t
	;;
esac
