. ".\variables.ps1"

Set-AzureRmVMCustomScriptExtension -ResourceGroupName $resourceGroup `
    -VMName $vmName -Name "SetupIIS" -Location $location `
    -FileUri "https://raw.githubusercontent.com/OsricWilkinson/Azure-Scripts/master/setup-iis.ps1" `
    -Run "setup-iis.ps1" 