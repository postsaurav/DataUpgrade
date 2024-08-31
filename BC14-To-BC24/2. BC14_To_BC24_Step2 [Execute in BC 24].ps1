########################################################################
#Author : Saurav Dhyani
#Date   : 25-08-2024
#Purpose: Execute Step 2 of BC Upgrade
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\NavAdminTool.ps1'

#Convert Database To BC 24
Invoke-NAVApplicationDatabaseConversion -DatabaseServer WIN-4HLPH2Q5UKO -DatabaseName "BC14-UpgradeDemo-GB"

#Configure version 24 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName DatabaseServer -KeyValue "WIN-4HLPH2Q5UKO"
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName DatabaseName -KeyValue "BC14-UpgradeDemo-GB"
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"d931bf32-b75d-4cbb-bdc5-4d807f40921d", "name":"bc14baseapptablesonly", "publisher": "bc14baseapptablesonly", "version": "1.0.0"}]'
Set-NavServerConfiguration -ServerInstance BC240 -KeyName "EnableTaskScheduler" -KeyValue false
Restart-NAVServerInstance  -ServerInstance BC240
Import-NAVServerLicense    -ServerInstance BC240 -LicenseFile "C:\Users\Administrator\Desktop\dev.bclicense"
Restart-NAVServerInstance  -ServerInstance BC240

#Publish Migration and Empty Extension
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Table Migration Extensions\Default Publisher_bc14baseapptablesonly_1.0.0.0.app" -SkipVerification
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Empty Extensions\Microsoft_System Application_14.0.0.0.app" -SkipVerification
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Empty Extensions\Microsoft_Business Foundation_14.0.0.0.app" -SkipVerification
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Empty Extensions\Microsoft_Base Application_14.0.0.0.app" -SkipVerification
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Empty Extensions\Saurav Dhyani_PTE Extension_1.0.0.0.app" -SkipVerification
Restart-NAVServerInstance  -ServerInstance BC240

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC240 -Mode Sync -Tenant default

#Sync Table only V1 & Empty extension
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name bc14baseapptablesonly -Version 1.0.0.0
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application"  -Version 14.0.0.0
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 14.0.0.0
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 14.0.0.0
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "PTE Extension" -Version 1.0.0.0

# Run Data Upgarde
Start-NAVDataUpgrade -ServerInstance BC240 -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck
Get-NAVDataUpgrade -ServerInstance BC240 -Tenant default -Detailed | Out-GridView

#Install Empty Extension
Install-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application"  -Version 14.0.0.0
Install-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 14.0.0.0
Install-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 14.0.0.0
Install-NAVApp -ServerInstance BC240 -Tenant default -Name "PTE Extension" -Version 1.0.0.0

#Publish final extensions
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\Table Migration Extensions\Default Publisher_bc14baseapptablesonly_1.0.0.1.app" -SkipVerification
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\BC24 Core Extension\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\BC24 Core Extension\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\BC24 Core Extension\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\BC24 Core Extension\Microsoft_Application.app"
Publish-NAVApp -ServerInstance BC240 -Path "D:\Upgrade\BC24 Core Extension\Saurav Dhyani_PTE Extension_3.0.0.0.app" -SkipVerification

#Synchronize final extensions
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application"  -Version 24.4.22295.22925
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 24.4.22295.22925
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 24.4.22295.22925
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Application" -Version 24.4.22295.22925
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "PTE Extension" -Version 3.0.0.0
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name bc14baseapptablesonly -Version 1.0.0.1

#Upgrade empty table migration extension
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "bc14baseapptablesonly" -version 1.0.0.1
Get-NAVDataUpgrade -ServerInstance BC240 -Tenant default -Detailed | Out-GridView

#Clean sync and unpublish table migration extensions
Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name "bc14baseapptablesonly" -Version 1.0.0.1
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "bc14baseapptablesonly" -Version 1.0.0.1 -Mode clean
Unpublish-NAVApp -ServerInstance BC240 -Name "bc14baseapptablesonly" -Version 1.0.0.1
Unpublish-NAVApp -ServerInstance BC240 -Name "bc14baseapptablesonly" -Version 1.0.0.0

#Upgrade and install final extensions
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "System Application"  -Version 24.4.22295.22925
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Business Foundation" -Version 24.4.22295.22925 
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Base Application" -Version 24.4.22295.22925 
Install-NAVApp -ServerInstance BC240 -Name "Application" -Version 24.4.22295.22925 
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "PTE Extension" -Version 3.0.0.0 

#Remove Empty Extesnions
Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application"  -Version 14.0.0.0
Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 14.0.0.0
Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 14.0.0.0
Uninstall-NAVApp -ServerInstance BC240 -Tenant default -Name "PTE Extension" -Version 1.0.0.0

Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "System Application"  -Version 14.0.0.0 -Mode clean
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Business Foundation" -Version 14.0.0.0 -Mode clean
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "Base Application" -Version 14.0.0.0 -Mode clean
Sync-NAVApp -ServerInstance BC240 -Tenant default -Name "PTE Extension" -Version 1.0.0.0 -Mode clean

Unpublish-NAVApp -ServerInstance BC240 -Name "System Application"  -Version 14.0.0.0
Unpublish-NAVApp -ServerInstance BC240 -Name "Business Foundation" -Version 14.0.0.0
Unpublish-NAVApp -ServerInstance BC240 -Name "Base Application" -Version 14.0.0.0
Unpublish-NAVApp -ServerInstance BC240 -Name "PTE Extension" -Version 1.0.0.0

#Upgrade control add-ins
$NewBcServerInstance = 'BC240'
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\Add-ins\'
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance $NewBcServerInstance -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')

#Change application version
Set-NAVApplication -ServerInstance BC240 -ApplicationVersion 24.4.22576.0 -Force
Sync-NAVTenant -ServerInstance BC240 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC240 -FunctionExecutionMode Serial -Tenant default

#Update Help and Support
Set-NAVServerConfiguration -ServerInstance BC240 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All