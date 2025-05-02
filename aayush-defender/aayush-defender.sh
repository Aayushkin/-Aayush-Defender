#!/bin/bash

# Aayush-Defender v1.0
# By Aayush-Tech07

clear
echo "🔰 Welcome to Aayush-Defender - Secure Your Linux Like a King 🔰"
echo "--------------------------------------------------------------"
echo "1. Setup Firewall (UFW)"
echo "2. Scan for Rootkits"
echo "3. Install and Configure Fail2Ban"
echo "4. View Suspicious Logs"
echo "5. Harden SSH"
echo "6. Exit"
read -p "Choose an option (1-6): " choice

case $choice in
  1)
    echo "[+] Setting up UFW..."
    sudo apt install ufw -y
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
    echo "[+] Firewall enabled and configured."
    ;;
  2)
    echo "[+] Scanning for rootkits..."
    sudo apt install chkrootkit -y
    sudo chkrootkit
    ;;
  3)
    echo "[+] Installing Fail2Ban..."
    sudo apt install fail2ban -y
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban
    echo "[+] Fail2Ban is now protecting your system."
    ;;
  4)
    echo "[+] Showing last 20 suspicious logs from auth.log..."
    sudo grep "Failed\|Invalid\|error" /var/log/auth.log | tail -n 20
    ;;
  5)
    echo "[+] Hardening SSH..."
    sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
    sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    echo "[+] SSH now uses port 2222 and disallows root login."
    ;;
  6)
    echo "Goodbye! Stay secured, Legend."
    exit
    ;;
  *)
    echo "Invalid choice!"
    ;;
esac
