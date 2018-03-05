
$websitePath = "C:\Ocelot"

# Install IIS
Enable-WindowsOptionalFeature -All -Online -FeatureName IIS-ASP

# Import IIS controls
Import-Module WebAdministration

# Remove default websites
Remove-Website -Name *

# Create the new site
$path = Get-Item ($websitePath + "\wwwroot")
New-Item $site -bindings @{protocol="http";bindingInformation="*:8080:*"} -physicalPath $path
