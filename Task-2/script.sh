#!/bin/bash

#server uptime
echo "server uptime:"
uptime
echo

#last server reboot timestamp
echo "last server reboot timestamp:"
last reboot | head -n 1
echo

#server local time zone
echo "server local time zone:"
timezone=$(datetimectl | grep "Time zone" | awk '{print $3}')
echo "$timezone"
if [[ "$timezone" != "IST" ]]; then
        echo "warning:time zone is not IST"
fi
echo

#Last 10 installed packges with dates
echo "Last 10 installed packges with dates:"
rpm -qa --last | head -n 10
echo

#OS version [Expected RHEL family, Highlight for different os]
echo "OS version:"
osversion=$(cat /etc/os-release)
echo "$osversion"
if [[ "$osversion" != "Red Hat" ]]; then
        echo "warning: os is not RHEL"
fi
echo

#Kernel version
echo "Kernel version:"
uname -r
echo

#CPU - Virtual cores
echo "CPU - Virtual cores:"
lscpu
echo

#cpu clock speed
echo "cpu clock speed:"
lscpu | grep "CPU MHz"
echo

#CPU - Architecture [Expected x86-64 , Highlight for other than x86-64]
echo "CPU - Architecture:"
architecture=$(lscpu | grep "Architecture" | awk '{print $2}')
echo "$architecture"
if [[ "$architecture" != "x86_64" ]]; then
        echo "warning cpu architecture is not x86_64"
fi
echo 

#Disk information
echo "Disk - Mounted/Unmounted volumes, type, storage:"
df -T
echo

#Private and Public IP info 
echo "network info:"
echo

#private IP
echo "private ip address(es):"
ip addr | grep "inet" | awk '{print $2}'
echo

#public ip
echo "public ip address:"
curl ifconfig.me
echo 
echo

#Private and Public DNS or Hostname
echo "Private and Public DNS or Hostname:"
hostname
echo 

#Public DNS or Hostname
echo "Public DNS or Hostname:"
curl -s ifconfig.me/host
echo

#Networking - Bandwidth
echo "Networking - Bandwidth (Bytes received/transmitted):"
ifconfig | grep bytes
echo

#Networking - OS Firewall (Allowed Ports & Protocols)
echo "Networking - OS Firewall (Allowed Ports & Protocols):"
iptables -L                     #we can also use firewall-cmd --list-all command
echo

## Networking - Network Firewall (Allowed Ports & Protocols)
echo "Networking - Network Firewall (Allowed Ports & Protocols):"
iptables -L                     #we can also use firewall-cmd --list-all command
echo

# CPU - Utilization [Expected Less than 60 %, Highlight CPU consumption]
echo "CPU - Utilization:"
cpu_utilization=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/,//')
echo "Current CPU utilization: $cpu_utilization%"
cpu_utilization_int=${cpu_utilization%.*}
if [ "$cpu_utilization_int" -gt 60 ]; then
    echo "Warning: CPU consumption is high!"
fi
echo

# RAM - Utilization [Expected Less than 60 %, Highlight RAM consumption]
echo "RAM - Utilization:"
ram_utilization=$(free | awk '/Mem/{print ($3/$2) * 100}')
echo "Current RAM utilization: $ram_utilization%"
ram_utilization_int=${ram_utilization%.*}
if [ "$ram_utilization_int" -gt 60 ]; then
    echo "Warning: RAM consumption is high!"
fi
echo

# Storage [Expected Less than 60 %, other wise Highlight Storage consumption]
echo "Storage - Utilization:"
df -h | awk 'NR>1 {print $5}' | while read -r utilization; do
    if [[ "${utilization%?}" -gt 60 ]]; then
        echo "Warning: Storage consumption is high! ($utilization)"
    else
        echo "Storage utilization: $utilization"
    fi
done
echo

# Highlight when current User Password Expiring
echo "Current User Password Expiry:"
# Get password expiration information
password_expiry=$(chage -l $(whoami) | grep "Password expires" | awk -F ': ' '{print $2}')
# Display password expiry date
echo "Password will expire on: $password_expiry"
echo