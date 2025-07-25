#!/bin/bash

USE_FOLDER=false
VERBOSE=false

while getopts "f" opt; do
	case $opt in
		f)
			USE_FOLDER=true
			;;
		v)	#will finish this later
			VERBOSE=true
			;;
		*)
			echo "Usage: $0 [-f] ClassName"
			exit 1
			;;
	esac
done

shift $((OPTIND - 1))

if [[ -z $1 ]]; then
    echo "I need at least the class name to work."
	exit 1
fi

CLASSNAME=$1

if $USE_FOLDER; then
	mkdir -p src inc
	./createCpp.bash "$CLASSNAME" "src/"
	./createHeader.bash "$CLASSNAME" "inc/"
else
	./createCpp.bash "$CLASSNAME"
	./createHeader.bash "$CLASSNAME"
fi

