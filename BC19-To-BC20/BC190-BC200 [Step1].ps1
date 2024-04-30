Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\190\Service\NavAdminTool.ps1'

Get-NAVAppInfo -ServerInstance BC190 -Tenant default| % { Uninstall-NAVApp -ServerInstance BC190 -Tenant default -Name $_.Name -Version $_.Version -Force}

Get-NAVAppInfo -ServerInstance BC190 -Tenant default -TenantSpecificProperties | Out-GridView

Get-NAVAppInfo -ServerInstance BC190 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC190 -Name $_.Name -Version $_.Version }

Stop-NAVServerInstance -ServerInstance BC190