# Exit Steam Games app
Get-Process | Where-Object { $_.Name -like "Steam"} | Stop-Process

# Exit Epic Games app
Get-Process | Where-Object { $_.Name -like "EpicGamesLauncher"} | Stop-Process
Get-Process | Where-Object { $_.Name -like "EpicWebHelper"} | Stop-Process

# Exit NVIDIA Helpers
Get-Process | Where-Object { $_.Name -like "NVIDIA Web Helper" } | Stop-Process
Get-Process | Where-Object { $_.Name -like "nvsphelper64" } | Stop-Process

# Disable NVDisplay.ContainerLocalSystem and NvContainerLocalSystem services
Stop-Service NvContainerLocalSystem
Stop-Service NVDisplay.ContainerLocalSystem

# Exit Samsung Magician
Get-Process | Where-Object { $_.Name -like "SamsungMagician" } | Stop-Process

Stop-Service 'PCManager Service Store'

# Disable SoftEther VPN Client
vpncmd.exe localhost /CLIENT:localhost /CMD:AccountDisconnect "Azure Debian VPN"
Wait-Event -Timeout 2
Get-Process | Where-Object { $_.Name -like "vpncmgr_x64" } | Stop-Process -Confirm:$false
Wait-Event -Timeout 2

# Disable Networking Services
Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
Disable-NetAdapter -Name "Ethernet" -Confirm:$false

# Disable Windows Update Service
Get-PnpDevice -FriendlyName "High Definition Audio Controller" | Disable-PnpDevice -Confirm:$false