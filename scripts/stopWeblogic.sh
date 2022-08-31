#!/bin/sh

# WARNING: Executar esta atividade com usuario ADMWEB!!!

userID=`id admweb | awk -F "(" '{gsub("uid=",""); print $1}'`
currentID=`id | awk -F "(" '{gsub("uid=",""); print $1}'`

if [ ${currentID} -ne ${userID} ]; then
        echo -e "Iniciar o Weblogic com usuario\e[31m admweb!!! \e[m"
        exit 0
fi

DOMAIN_HOME="/app/oracle/wls1213/user_projects/domains/pmn_domain"
DIRLOG="/logs/oracle/pmn_domain"

vDATA=`date +%Y%m%d-%H%M%S`

nohup ${DOMAIN_HOME}/bin/stopWebLogic.sh > ${DIRLOG}/stotWebLogic-${vDATA}.log &

echo "${DIRLOG}/stotWebLogic-${vDATA}.log"

sleep 30

vCHECK=`ps -ef | grep AdminServer | grep -v grep | awk '{print $2}'`

if [ -z ${vCHECK} ]; then
   echo "Weblogic Stoped..." >> ${DIRLOG}/stotWebLogic-${vDATA}.log
else
   echo "Weblogic Stoping..." >> ${DIRLOG}/stotWebLogic-${vDATA}.log
   sleep 15 
   kill -9 ${vCHECK}
   echo "Weblogic Stoped..."  >> ${DIRLOG}/stotWebLogic-${vDATA}.log
fi
