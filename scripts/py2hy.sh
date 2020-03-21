#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

if [ "$#" != "1" ];  then
    echo "Needs precisely one argument" 2>&1
    exit 1
fi;


py2hy $1 | while read line
do
    #echo $line | emacs -q --batch --eval '(let ((buf (generate-new-buffer "buf.hy"))  ) (set-buffer buf)  (insert (read-string "") "\n" ) (pp (read (buffer-string))))' | sed -e 's/\\\./\./g' -e 's/\\\,/\,/g'
    echo $line | emacs -q --batch --eval '(let ((buf (generate-new-buffer "buf.hy"))  ) (set-buffer buf)  (insert (read-string "") "\n" ) (pp (read (buffer-string))))'    
done
