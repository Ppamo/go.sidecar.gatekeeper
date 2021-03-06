#!/bin/bash
APP=dummy
PORT=8081
source "$(git rev-parse --show-toplevel)/lib/build_lib.sh"

usage(){
	printf "$YELLOW* Usage:
	build $BLUE[compile|build|run|clean|list]$RESET
"
}

if [ $# -eq 0 ]
then
	usage
	exit 0
fi

INDEX=0
while [ $INDEX -lt $# ]
do
	((INDEX++))
	case ${@:INDEX:1} in
		compile)	compile			;;
		build)
			DOCKERCOPYFILES="resources/properties.json resources/validation.json" \
			build
			;;
		launch)		launch			;;
		run)		run			;;
		clean)		clean			;;
		list)		list			;;
		push)		push ${@:INDEX}		;;
		deploy)		deploy ${@:INDEX}	;;
		*)
			printf $RED"- ERROR: comando \"${@:INDEX:1}\" no reconocido\n"$RESET
			usage
			exit -1
	esac
done
