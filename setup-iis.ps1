
$websitePath = "C:\Ocelot"

# Install IIS
Enable-WindowsOptionalFeature -All -Online -FeatureName IIS-ASP

# Import IIS controls
Import-Module WebAdministration

# Remove default websites
Remove-Website -Name *

# Create the new site
$path = Get-Item ($websitePath + "\wwwroot")
New-Item $site -bindings @{protocol="http";bindingInformation="*:80:*"} -physicalPath $path

# Open firewall
New-NetFirewallRule -DisplayName 'Web Inbound' -Profile @('Public') -Direction Inbound -Action Allow -Protocol TCP -LocalPort @('80')