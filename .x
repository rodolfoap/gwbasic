execute(){
	./cli.bash
}
build(){
	./build.bash
}
case "$1" in
	b)
		build
	;;
	e)
		vi -p Dockerfile build.bash cli.bash
		build
		execute
	;;
	"")
		execute
	;;
esac
