# Get all processes with a main window title (visible apps)
$apps = Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.Id -ne $PID -and $_.ProcessName -ne "explorer" }

# Stop each process
foreach ($app in $apps) {
    Stop-Process -Id $app.Id -Force
}