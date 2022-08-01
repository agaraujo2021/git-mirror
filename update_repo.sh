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
    EXISTS=$(git remote show|grep $reponame |wc -l)
    if [ $EXISTS -eq 0 ]; then
          echo "Remote repo not exists."
          git remote add $reponame http://$USERNAME:$USERPW1@www.gitlab.proderj.rj.gov.br:8081/rj-digital/$reponame
          git push --all $reponame
          echo "Remote repo created and updated."
        else
          echo "Remote repo exists, start updating process!"
          git push --all $reponame
          if [ $? -eq 0 ];then
             echo "Repository updated."
          else
             echo "Error whilst update data to Gitlab."
          fi
        fi
 done < "$INPUT"
}

while true; do
  sync
  sleep 960 
done
