#!/bin/bash
set -e

function print_help {
	printf "Available Commands:\n";
	awk -v sq="'" '/^function run_([a-zA-Z0-9-]*)\s*/ {print "-e " sq NR "p" sq " -e " sq NR-1 "p" sq }' make.sh \
		| while read line; do eval "sed -n $line make.sh"; done \
		| paste -d"|" - - \
		| sed -e 's/^/  /' -e 's/function run_//' -e 's/#//' -e 's/{/	/' \
		| awk -F '|' '{ print "  " $2 "\t" $1}' \
		| expand -t 30
}

function run_buildv2 { #build v2 docker container
	docker build -t nerdalize/pythonapp:v2 ./v2
}

function run_buildpushv2 { #build and push v2 docker container
	run_buildv2
	docker push nerdalize/pythonapp:v2
}

function run_buildv3 { #build v3 docker container
	docker build -t nerdalize/pythonapp:v3 ./v3
}

function run_buildpushv3 { #build and push v3 docker container
	run_buildv3
	docker push nerdalize/pythonapp:v3
}

case $1 in
	"buildv2") run_buildv2 ;;
	"buildpushv2") run_buildpushv2 ;;
	"buildv3") run_buildv3 ;;
	"buildpushv3") run_buildpushv3 ;;
	*) print_help ;;
esac
