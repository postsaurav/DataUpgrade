#Replace <<BC15Service>> With Business Central 15 Service Instance Name
#Replace <<LicensePath>> With Path of Business Central 15 License File.
#Replace <<DBName>>      With Database Name
#Replace <<ServerName>>  With SQL Server name
#Replace <<NewBaseID>>   With BC15 New Base App Version 
#Replace <<OldBaseID>>   With BC15 Old Base App Version


#1. Import BC15 Powershell Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

#2. Import Partner License.
Import-NAVServerLicense -LicenseFile <<LicensePath>> -ServerInstance <<BC15Service>>

#3 Restart NAV Service.
Restart-NAVServerInstance -ServerInstance <<BC15Service>>

#4. UnInstall All App Installed on Service
Get-NAVAppInfo -ServerInstance <<BC15Service>> | % { Uninstall-NAVApp -ServerInstance <<BC15Service>> -Name $_.Name -Version $_.Version -Force}

#5. UnPublish All Symbol on Service
Get-NAVAppInfo -ServerInstance <<BC15Service>> -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance <<BC15Service>> -Name $_.Name -Version $_.Version}

#6. Stop NAV Service
Stop-NAVServerInstance -ServerInstance <<BC15Service>>

## Unistall Business Central 15 older version and install new Version. Change Compatiability Level of database to max Version. Close and Start Powershell again before procedding.

#7. Import BC15 Powershell Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

#8. Invoke Application Database Conversion
Invoke-NAVApplicationDatabaseConversion -DatabaseName <<DBName>> -DatabaseServer <<ServerName>>

#9. Set Database Name
Set-NAVServerConfiguration -ServerInstance <<BC15Service>> -KeyName DatabaseName -KeyValue <<DBName>>

#10. Disable Task Scheduler
Set-NavServerConfiguration -ServerInstance <<BC15Service>> -KeyName "EnableTaskScheduler" -KeyValue false

#11. Restart Service
Restart-NAVServerInstance -ServerInstance <<BC15Service>> 

#12. Publish System App Symbols
Publish-NAVApp -ServerInstance <<BC15Service>> -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly

#13. Publish Microsoft System App.
#Change Path as the Path of System Application.
Publish-NAVApp -ServerInstance <<BC15Service>> -Path "D:\Wave 2 DVD 15.2\Applications\System Application\Source\Microsoft_System Application.app"

#14. Publish Microsoft Base App.
#Change Path as the Path of Base Application.
Publish-NAVApp -ServerInstance <<BC15Service>> -Path "D:\Wave 2 DVD 15.2\Applications\BaseApp\Source\Microsoft_Base Application.app"

#15. Sync NavTenant 
Sync-NAVTenant -ServerInstance <<BC15Service>> -Mode Sync

#16. Get Version for System and Base Application
Get-NAVAppInfo -ServerInstance <<BC15Service>> | format-table Name,version 

#17. Sync System Application
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "System Application" -Version <<NewBaseID>>

#18. Sync Base Application
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Base Application" -Version <<NewBaseID>>

#19. System Application NAVApp Data Upgrade
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "System Application" -Version <<NewBaseID>>

#20. Base Application NAVApp Data Upgrade
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Base Application" -Version <<NewBaseID>>

#21. Sync NAV Application
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "AMC Banking 365 Fundamentals" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Essential Business Headlines" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Ceridian Payroll" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Intelligent Cloud Base" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "_Exclude_APIV1_" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "_Exclude_ClientAddIns_" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Quickbooks Payroll File Import" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Sales and Inventory Forecast" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "PayPal Payments Standard" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Envestnet Yodlee Bank Feeds" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Image Analyzer" -Version <<NewBaseID>>
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "Send remittance advice by email" -Version <<NewBaseID>>

#22. Data Upgrade NAV Application
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "AMC Banking 365 Fundamentals" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Essential Business Headlines" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Ceridian Payroll" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Intelligent Cloud Base" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "_Exclude_APIV1_" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "_Exclude_ClientAddIns_" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Quickbooks Payroll File Import" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Sales and Inventory Forecast" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "PayPal Payments Standard" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Envestnet Yodlee Bank Feeds" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Image Analyzer" -Version <<NewBaseID>>
Start-NAVAppDataUpgrade -ServerInstance <<BC15Service>> -Name "Send remittance advice by email" -Version <<NewBaseID>>

#23. Publish Sync and Install New Application
#Change Path as the Path of System Application.
Publish-NAVApp -ServerInstance <<BC15Service>> -Path "D:\Wave 2 DVD 15.2\Applications\MX_DIOT\Source\MX_DIOT.app"
Sync-NAVApp -ServerInstance <<BC15Service>> -Name "DIOT - Localization for Mexico" -Version <<NewBaseID>>
Install-NAVApp -ServerInstance <<BC15Service>> -Name "DIOT - Localization for Mexico" -Version <<NewBaseID>>

#24. UnPublish Old Version of Extensions.
Get-NAVAppInfo -ServerInstance <<BC15Service>> -Version <<OldBaseID>> | % { Unpublish-NAVApp -ServerInstance <<BC15Service>> -Name $_.Name -Version $_.Version}

#25. Sync Old Extension with mode Clean.
Get-NAVAppInfo -ServerInstance <<BC15Service>> -Version <<OldBaseID>> | % { Sync-NAVApp -ServerInstance <<BC15Service>> -Mode Clean -Name $_.Name -Version $_.Version}

#26. Get Base App Properties.
Get-NAVAppInfo -ServerInstance <<BC15Service>> | format-table appId,Name,publisher

#27. Set the DestinationAppsForMigration parameter for the server instance configuration to include the information about the base application.
Set-NAVServerConfiguration -ServerInstance <<BC15Service>> -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'

#28. Enable TaskScheduler and Restart Service.
Set-NavServerConfiguration -ServerInstance <<BC15Service>> -KeyName "EnableTaskScheduler" -KeyValue true
Restart-NAVServerInstance -ServerInstance <<BC15Service>>