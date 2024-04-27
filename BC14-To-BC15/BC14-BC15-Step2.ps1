###################### Parameters ######################
#Replace $DatabaseServer       With SQL Server Name.
#Replace $DatabaseInstance     With SQL Server Instance (if any).
#Replace $DatabaseName         With Database Name. 
#Replace $ServiceName          With Business Central 15 Server Instance Name.
#Replace $DeveloperLicenseFile With File Path of Developer License.
#Replace $BC15Version          With Business Central Base App Version.
#Replace $SystemAppPath        With Actual Path of System App.
#Replace $BaseAppPath          With Actual Path of Base App. [If Custom Base App then replace of Path of that App.]

##################################################################

Write-Host "1. Importing BC15 Powershell Module"
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

Write-Host "2. Executing Application Database Conversion"
Invoke-NAVApplicationDatabaseConversion -DatabaseName $DatabaseName -DatabaseServer $DatabaseServer -Force

Write-Host "3. Checking Service Status and Start if not started"
$ServiceStatus = Get-NAVServerInstance -ServerInstance $ServerInstance

If ($ServiceStatus.State -eq "Stopped")
{
    Start-NAVServerInstance -ServerInstance $ServerInstance
}

Write-Host "4. Setting Service Parameters & Load License"
Set-NAVServerConfiguration -ServerInstance $ServerInstance -KeyName DatabaseServer -KeyValue $DatabaseServer
Set-NAVServerConfiguration -ServerInstance $ServerInstance -KeyName DatabaseInstance -KeyValue $DatabaseInstance
Set-NAVServerConfiguration -ServerInstance $ServerInstance -KeyName DatabaseName -KeyValue $DatabaseName
Set-NavServerConfiguration -ServerInstance $ServerInstance -KeyName "EnableTaskScheduler" -KeyValue false
Import-NAVServerLicense  -ServerInstance $ServerInstance -LicenseFile $DeveloperLicenseFile

Write-Host "5. Restarting NAV Service"
ReStart-NAVServerInstance -ServerInstance $ServerInstance

Write-Host "6. Publishing System App Symbols"
Publish-NAVApp -ServerInstance $ServerInstance -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly

Write-Host "7. Publishing System Application"
Publish-NAVApp -ServerInstance $ServerInstance -Path $SystemAppPath  -SkipVerification

Write-Host "8. Publishing Base Application"
Publish-NAVApp -ServerInstance $ServerInstance -Path $BaseAppPath  -SkipVerification

Write-Host "9. Syncing Tenant"
Sync-NAVTenant -ServerInstance $ServerInstance -Mode Sync

Write-Host "10. Syncing System Application"
Sync-NAVApp -ServerInstance $ServerInstance -Name "System Application" -Version $BC15Version

Write-Host "12. Syncing Base Application"
Sync-NAVApp -ServerInstance $ServerInstance -Name "Base Application" -Version $BC15Version

Write-Host "13. Installing System Application"
Install-NAVApp -ServerInstance $ServerInstance -Name "System Application" -Version $BC15Version

Write-Host "14. Installing Base Application"
Install-NAVApp -ServerInstance $ServerInstance -Name "Base Application" -Version $BC15Version

Write-Host "15. Running Data Upgrade.."
Start-NAVDataUpgrade -ServerInstance $ServerInstance -FunctionExecutionMode Serial -SkipAppVersionCheck -Force

#Repeat these steps for all Existing Extensions.
Write-Host "16. Upgrade Extension and Uninstall Old Version of App."
# Publish New Version of App.
#Publish-NAVApp -ServerInstance $ServerInstance -Path "D:\Blog\Other Apps In DVD\ImageAnalysis.app" -SkipVerification

# Sync New Version of App.
#Sync-NAVApp -ServerInstance $ServerInstance -Name "Image Analyzer" -Version $BC15Version

# Start NAV Data Upgrade of App.
#Start-NAVAppDataUpgrade -ServerInstance $ServerInstance -Name "Image Analyzer" -Version $BC15Version

# Unpublish Old Version of App.
#Unpublish-NAVApp -ServerInstance $ServerInstance -Name "Image Analyzer" -Version 14.9.39327.0


# Repeat these steps for all New Extension that you need.
Write-Host "17. Install New Extension Avilable with New Version."

# Publish New Version of App.
#Publish-NAVApp -ServerInstance $ServerInstance -Path "D:\Blog\Other Apps In DVD\Microsoft_Test Runner.app" -SkipVerification

# Sync New App.
#Sync-NAVApp -ServerInstance $ServerInstance -Name "Test Runner"

# Install New App.
#Install-NAVApp -ServerInstance $ServerInstance -Name "Test Runner"


Write-Host "18. Get Installed App Information"
Get-NAVAppInfo -ServerInstance $ServerInstance | format-table appId,Name,publisher

Write-Host "19. Set Properties in Service Tier."
Set-NAVServerConfiguration -ServerInstance $ServerInstance -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'

Write-Host "20. Set Other Properties in Service."
Set-NavServerConfiguration -ServerInstance $ServerInstance -KeyName "EnableTaskScheduler" -KeyValue true

Write-Host "21. Restart NAV Service."
Restart-NAVServerInstance -ServerInstance $ServerInstance