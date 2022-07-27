#!/bin/bash

IFS=''
DIR="/repos/dev.azure.com/Extreme-Digital/0160_RJ_PRODERJ_RH/_git/"

sync(){
 cd /repos
 ls -lC1 $DIR > /tmp/repos.txt
 INPUT="/tmp/repos.txt"

 while read -r reponame
 do
    cd $DIR/$reponame
    EXISTS=$(git remote show|grep $repo-name |wc -l)
    if [ $EXISTS -eq 0 ]; then
          #git remote add $reponame http://$USERNAME:$USERPW@www.gitlab.proderj.rj.gov.br:8081/rj-digital/$reponame
          #git push --all $reponame
          echo "Remote repo not exists"
        else
           echo "Remote repo exists!"
        fi
 done < "$INPUT"
}

while true; do
  sync
  sleep 30
done
