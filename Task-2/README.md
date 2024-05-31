### 2. Auditing Hardware

We work with companies that require our solution to be deployed on premise. For that we receive hardware, and auditing that hardware becomes important part of our deployment process.

Write a bash script to audit the following hardware spec in RHEL. The script should print out following specifications and also audit report should highlight specifications if they are not matching expected specifications

Server Uptime
Last Server Reboot Timestamp
Server Local Time Zone [Expected IST, Highlight to NON-IST ]
Last 10 installed packges with dates
OS version [Expected RHEL family, Highlight for different os]
Kernel version
CPU - Virtual cores
CPU - Clock speed
CPU - Architecture [Expected x86-64 , Highlight for other than x86-64]
Disk - Mounted/Unmounted volumes, type, storage
Private and Public IP
Private and Public DNS or Hostname
Networking - Bandwidth
Networking - OS Firewall (Allowed Ports & Protocols)
Networking - Network Firewall (Allowed Ports & Protocols)
CPU - Utilization [Expected Less than 60 %, Highlight CPU consumption]
RAM - Utilization [Expected Less than 60 %,Highlight RAM consumption]
Storage [Expected Less than 60 %, other wise Highlight Storage consumption]
Highlight when current User Password Exipring
Deliverables:
A Shell Script.
A README file with instructions how to run.

### Solution

#### Hardware Audit Script
This script audits various hardware and system specifications on a RHEL system. It checks server uptime, last reboot timestamp, local time zone, installed packages, OS version, kernel version, CPU and RAM utilization, disk usage, network configuration, and password expiration for the current user.

You can find the script at the following link:

[script.sh](https://github.com/sumanthgitty/DevOps-Support-Engineer/blob/main/Task-2/script.sh)

#### How to Execute
Make the script executable: Before running the script, ensure it has execute permissions. You can do this with the following command:

```bash
chmod +x script.sh
```
Run the script: Execute the script by running:

```bash
./script.sh
```
View the results: The script will output various hardware and system specifications directly to the terminal.
