$bluetoothDevice = Get-PnpDevice -FriendlyName "Realtek Bluetooth Adapter"

if ($bluetoothDevice) {
    Write-Host "Disabling Bluetooth driver..."
    Disable-PnpDevice -InstanceId $bluetoothDevice.InstanceId -Confirm:$false

    # Give it a moment to disable
    Start-Sleep -Seconds 2

    Write-Host "Enabling Bluetooth driver..."
    Enable-PnpDevice -InstanceId $bluetoothDevice.InstanceId -Confirm:$false

    Write-Host "Bluetooth driver restart complete."
} else {
    Write-Host "Bluetooth Radio device not found."
    Write-Host "Please ensure your Bluetooth hardware is present and enabled in Device Manager."
}
