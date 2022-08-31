#!/bin/bash

DOMAIN_HOME="/app/oracle/wls1213/user_projects/domains/pmn_domain"
SCRIPT="/app/oracle/scripts/manageServers.py"

HOST=`hostname`
TIPO="stopall"
PORT="7001"
JVM="ServerName"
USER="monitor"
PASSWD="xxxxxxxxx"

source ${DOMAIN_HOME}/bin/setDomainEnv.sh

java weblogic.WLST ${SCRIPT} -u ${USER} -p ${PASSWD} -a ${HOST}:${PORT} -n ${JVM} -c ${TIPO}
