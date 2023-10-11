#! /bin/bash
#color notes
NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
cyan='\033[0;36m'
yellow='\033[0;33m'
#Sectioning .........
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
echo "Server details:"
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"

#fetching basic specs from the server(user,ip,os)
user=`whoami`
echo -e "${cyan}User:${NC} $user"
hostname=`hostname`
echo -e "${cyan}hostname:${NC} $hostname"
ip=`hostname -I`
echo -e "${cyan}IP address:${NC} $ip"
os=`cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' | grep NAME`
echo -e "${cyan}OS:${NC} $os"

 
#Sectioning............
#Fetching mem and cpu informations
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
echo "Memory Details:"
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
sleep 1
#view mem info
free -h
#get uptime details
uptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "${cyan}System Uptime:${NC} :$uptime"
#Fetching the load average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "${cyan}Load average:${NC}: $loadaverage"
echo -e "${cyan}The top 10 services with high resource usage are listed below.${NC}"
#Get top services with high resource utilization
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head


#sectioning...........
#Fetching server space details!
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
echo "Server space Details:"
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
#View disk space details
df -h


echo "----------------------------------------------------------------------------------------------------------------"