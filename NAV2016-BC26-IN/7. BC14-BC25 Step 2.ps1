﻿########################################################################
#Author : Saurav Dhyani
#Date   : 11-05-2025
#Purpose: Execute Step 2 of BC Upgrade
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\252\Service\NavAdminTool.ps1'

#Convert Database To BC 25
Invoke-NAVApplicationDatabaseConversion -DatabaseServer localhost -DatabaseName "NAV2016-IN-Upgrade-Demo"

#Configure version 25 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC252 -KeyName DatabaseServer -KeyValue "localhost"
Set-NAVServerConfiguration -ServerInstance BC252 -KeyName DatabaseName -KeyValue "NAV2016-IN-Upgrade-Demo"
Set-NAVServerConfiguration -ServerInstance BC252 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"},{"appId":"f3552374-a1f2-4356-848e-196002525837", "name":"Business Foundation", "publisher": "Microsoft"},{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'
Set-NavServerConfiguration -ServerInstance BC252 -KeyName "EnableTaskScheduler" -KeyValue false
Restart-NAVServerInstance  -ServerInstance BC252
Import-NAVServerLicense    -ServerInstance BC252 -LicenseFile "D:\IN UPGRADE DEMO\7. DEV.bclicense"
Restart-NAVServerInstance  -ServerInstance BC252

#Publish Core Apps
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\Microsoft_Application.app"
Restart-NAVServerInstance  -ServerInstance BC252

#Publish India Apps
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_Tax Engine.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Tax Base.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_QR Generator.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India GST.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India TCS.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India TDS.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_Fixed Asset Depreciation for India.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Gate Entry.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Voucher Interface.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Reports.app"
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Charge Group.app"
Restart-NAVServerInstance  -ServerInstance BC252

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC252 -Mode Sync -Tenant default

#Sync Core Apps
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "System Application"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "Business Foundation" -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "Base Application" -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "Application" -Version 25.6.32556.0

#Sync IN Apps
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "Tax Engine"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Tax Base"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "QR Generator"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India GST"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India TCS"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India TDS"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "Fixed Asset Depreciation for India"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Gate Entry"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Voucher Interface"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Reports"  -Version 25.6.32556.0
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Charge Group"  -Version 25.6.32556.0

# Run Data Upgarde
Start-NAVDataUpgrade -ServerInstance BC252 -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck
Get-NAVDataUpgrade -ServerInstance BC252 -Tenant default -Detailed | Out-GridView

#Install Apps
Install-NAVApp -ServerInstance BC252 -Tenant default -Name "Application"  -Version 25.6.32556.0


#Upgrade IN Apps
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "Tax Engine" -version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India Tax Base" -version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India GST" -version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India TCS" -version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India TDS" -version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "Fixed Asset Depreciation for India" -version  25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India Gate Entry" -version  25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India Voucher Interface" -version 25.6.32556.0


#Install IN Apps
Install-NAVApp -ServerInstance BC252 -Tenant default -Name "QR Generator" -Version 25.6.32556.0
Install-NAVApp -ServerInstance BC252 -Tenant default -Name "India Reports" -Version 25.6.32556.0
Install-NAVApp -ServerInstance BC252 -Tenant default -Name "India Charge Group" -Version 25.6.32556.0

#Upgrade India Upgrade extensions (India Data Migration)
Publish-NAVApp -ServerInstance BC252 -Path "D:\IN UPGRADE DEMO\BC25-Apps\IN\Microsoft_India Data Migration.app"
Sync-NAVApp -ServerInstance BC252 -Tenant default -Name "India Data Migration"  -Version 25.6.32556.0
Start-NAVAppDataUpgrade -ServerInstance BC252 -Name "India Data Migration" -version 25.6.32556.0

#Run assisted setup
# Start Web Client and search for Assisted Setup and Run Setup Tax Engine for each company.
# Search for Assisted Setup and Run Finalize Data Migration for each company.

#Upgrade control add-ins
$NewBcServerInstance = 'BC252'
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\252\Service\Add-ins\'

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
Set-NAVApplication -ServerInstance BC252 -ApplicationVersion 25.6.32556.0 -Force
Sync-NAVTenant -ServerInstance BC252 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC252 -FunctionExecutionMode Serial -Tenant default -SkipUserSessionCheck

#Update Help and Support
Set-NAVServerConfiguration -ServerInstance BC252 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All