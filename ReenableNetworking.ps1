
# Enable Networking Services

Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
Enable-NetAdapter -Name "Ethernet" -Confirm:$false

# Restart SoftEther VPN client and connect to the VPN
Wait-Event -Timeout 12
vpncmd.exe localhost /CLIENT:localhost /CMD AccountConnect "Azure Debian VPN"