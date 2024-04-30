Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\200\Service\NavAdminTool.ps1'

## Convert Database to Business Central 20
Invoke-NAVApplicationDatabaseConversion -DatabaseServer SDHYANI -DatabaseName "Upgrade Demo"

## Set server
Set-NAVServerConfiguration -ServerInstance BC200TEST -KeyName DatabaseName -KeyValue "Upgrade Demo"
Set-NavServerConfiguration -ServerInstance BC200TEST -KeyName "EnableTaskScheduler" -KeyValue false
Restart-NAVServerInstance -ServerInstance BC200TEST

Import-NAVServerLicense -ServerInstance BC200TEST -LicenseFile "D:\Move Back\DEV.flf"
Restart-NAVServerInstance -ServerInstance BC200TEST

## Publish Min Apps From Microsoft
Publish-NAVApp -ServerInstance BC200TEST -Path "D:\temp\DEMO\Upgrade\MS Extensions\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC200TEST -Path "D:\temp\DEMO\Upgrade\MS Extensions\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC200TEST -Path "D:\temp\DEMO\Upgrade\MS Extensions\Microsoft_Application.app"

## Sync Nav Tenant
Sync-NAVTenant -ServerInstance BC200TEST -Mode Sync -Tenant default

## Sync Min Apps From Microsoft
Sync-NAVApp -ServerInstance BC200TEST -Name "System Application" -Version 20.1.39764.39901
Sync-NAVApp -ServerInstance BC200TEST -Name "Base Application" -Version 20.1.39764.39901
Sync-NAVApp -ServerInstance BC200TEST -Name "Application" -Version 20.1.39764.39901

## Upgrade Min Apps From Microsoft
Start-NAVAppDataUpgrade -ServerInstance BC200TEST -Name "System Application" -Version 20.1.39764.39901
Start-NAVAppDataUpgrade -ServerInstance BC200TEST -Name "Base Application" -Version 20.1.39764.39901
Start-NAVAppDataUpgrade -ServerInstance BC200TEST -Name "Application" -Version 20.1.39764.39901

## Run Data Upgrade
Start-NAVDataUpgrade -ServerInstance BC200TEST -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck
##Check Upgrade
Get-NAVDataUpgrade -ServerInstance BC200TEST -Progress -Interval 10
Get-NAVDataUpgrade -ServerInstance BC200TEST -Detailed | Out-GridView



