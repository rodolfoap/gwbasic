execute(){
	./launch.bash
}
build(){
	./build.bash
}
case "$1" in
	b)
		build
	;;
	e)
		vi -p gwbasic/dosbox.conf Dockerfile build.bash cli.bash
		build
		execute
	;;
	"")
		build
		execute
	;;
esac
