#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

if [ "$#" != "1" ];  then
    echo "Needs precisely one argument" 2>&1
    exit 1
fi;

#py2hy $1 > /tmp/tmp.hy
#cat /tmp/tmp.hy 
py2hy $1 | while read line
do
    echo $line > /tmp/tmp.hy
    emacs -q  --batch --eval \
	   $'(progn (package-initialize) (require \'f) (message (pp (read (f-read (car command-line-args-left))))))' /tmp/tmp.hy  | sed -e 's/\\././g' 

done

#emacs -q  --batch --eval \
#      $'(progn (package-initialize) (require \'f) (message (pp (read (f-read (car command-line-args-left))))))' /tmp/tmp.hy | sed -e 's/\\././g' 
