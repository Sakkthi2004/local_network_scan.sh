####### HEY I AM SAKKTHI #######
THIS REPOSITORY IS ABOUT TO SCAN LOCAL NETWORK

# Features
 * It can autodetect your local subnet (e.g. 192.168.1.0/24)
 * It performs fast **TCP SYN scans**
 * Their output results in:
     Plain text (.txt),
     XML (.xml),
     HTML (.html)
 * It shows the timestamp on your output directries 

# Requirements
 * Linux or WSL
 * nmap
 * ip (usually preinstalled)
 * Optional: xsltproc (For HTML report generation)

# Usage
Installing nmap from their official website

sudo apt update 

sudo apt install nmap xsltproc

git clone https://github.com/Sakkthi2004/local_network_scan.sh-main.git

cd local_network_scan.sh-main

chmod +x local_network_scan.sh

./local_network_scan.sh

# Optionally using Wireshark 
  By using wireshark we can trace the packets in the open port.

# Example output 

Nmap scan report for 192.168.1.10
Host is up (0.0015s latency).
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
