#!/bin/sh

# WARNING: Executar esta atividade com usuario ADMWEB!!!

userID=`id admweb | awk -F "(" '{gsub("uid=",""); print $1}'`
currentID=`id | awk -F "(" '{gsub("uid=",""); print $1}'`

if [ ${currentID} -ne ${userID} ]; then
        echo -e "Executar este script com usuario\e[31m admweb!!! \e[m"
        exit 0
fi

vDATA=`date +%Y%m%d-%H%M%S`

DOMAIN_HOME="/app/oracle/wls1213/user_projects/domains/pmn_domain"
DIRLOG="/logs/oracle/pmn_domain"

nohup ${DOMAIN_HOME}/bin/startWebLogic.sh $* > ${DIRLOG}/startWebLogic_${vDATA}.log &

echo "${DIRLOG}/startWebLogic_${vDATA}.log"
