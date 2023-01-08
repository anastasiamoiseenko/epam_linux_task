#!/bin/bash
scan_ip () {
    local SUBNET=$(ip route | awk '/proto/ && !/default/ && !/docker/ {print $1}'
    nmap -sn $SUBNET | awk '/Nmap scan report for/{print $5, $6}'
}

scan_ports () {
    netstat -tln $2 | awk '{print $1, $4}'
}
case $1 in

    --all) scan_ip;; # сканувати поточну мережу або задану в параметрах
    
    --target) scan_ports;; #віддалений хост, вести адресу

    *) echo "Help page for net_scanner.sh
The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
The --target key displays a list of open system TCP ports"
    esac