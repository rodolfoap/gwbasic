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
		vi -p Dockerfile assets/entrypoint c/dosbox.conf build.bash cli.bash
		build
		execute
	;;
	"")
		build
		execute
	;;
esac
