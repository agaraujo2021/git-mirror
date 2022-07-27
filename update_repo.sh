#!/bin/bash

IFS=''
 
cd /repos
ls -lC1 /repos/dev.azure.com/Extreme-Digital/0160_RJ_PRODERJ_RH/_git/ > /tmp/repos.txt

# Set input file name here
INPUT="/tmp/repos.txt"
 
while read -r reponame
do  
    cd  /repos/dev.azure.com/Extreme-Digital/0160_RJ_PRODERJ_RH/_git/$reponame
    EXISTS=$(git remote show|grep $repo-name |wc -l)
    if [ $EXISTS -eq 0 ]; then
	   #git remote add $reponame http://$USERNAME:$USERPW@www.gitlab.proderj.rj.gov.br:8081/rj-digital/$reponame
       #git push --all $reponame
	   echo "Remote repo not exists"
	else
	   echo "Remote repo exists!"
	fi
done < "$INPUT"
