########################################################################
#Author : Saurav Dhyani
#Date   : 19-05-2025
#Purpose: Execute Step 2 of BC Upgrade
########################################################################


#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\260\Service\NavAdminTool.ps1'

#Convert the application database to version 26
Invoke-NAVApplicationDatabaseConversion -DatabaseServer localhost -DatabaseName "NAV2016-IN-Upgrade-Demo"

#Configure version 26 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC260 -KeyName DatabaseServer -KeyValue localhost
#Set-NAVServerConfiguration -ServerInstance BC260 -KeyName DatabaseInstance -KeyValue 
Set-NAVServerConfiguration -ServerInstance BC260 -KeyName DatabaseName -KeyValue "NAV2016-IN-Upgrade-Demo"
Set-NavServerConfiguration -ServerInstance BC260 -KeyName "EnableTaskScheduler" -KeyValue false

Restart-NAVServerInstance -ServerInstance BC260

#Import-NAVServerLicense -ServerInstance BC260 -LicenseFile "C:\Upgrade\Dev.bclicense"
#Restart-NAVServerInstance -ServerInstance BC260

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC260 -Tenant default -Mode Sync

#Publish extensions
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\core\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\core\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\core\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\core\Microsoft_Application.app"
Restart-NAVServerInstance  -ServerInstance BC260

#Publish INDIA Extension
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_Tax Engine.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Tax Base.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_QR Generator.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India GST.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India TCS.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India TDS.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_Fixed Asset Depreciation for India.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Gate Entry.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Voucher Interface.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Reports.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Charge Group.app"
Publish-NAVApp -ServerInstance BC260 -Path "D:\IN UPGRADE DEMO\BC26-Apps\IN\Microsoft_India Data Migration.app"
Restart-NAVServerInstance -ServerInstance BC260


#Synchronize Apps
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "System Application" -version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "Business Foundation" -version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "Base Application" -version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "Application" -version 26.1.33404.33876

#Synchronize Apps - INDIA Extensions
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "Tax Engine"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Tax Base"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "QR Generator"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India GST"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India TCS"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India TDS"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "Fixed Asset Depreciation for India"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Gate Entry"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Voucher Interface"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Reports"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Charge Group"  -Version 26.1.33404.33876
Sync-NAVApp -ServerInstance BC260 -Tenant default -Name "India Data Migration"  -Version 26.1.33404.33876

Get-NAVAppInfo -ServerInstance BC260 -Tenant default -TenantSpecificProperties | Out-GridView

#Upgrade data
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "System Application" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "Business Foundation" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "Base Application" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "Application" -version 26.1.33404.33876

#Upgrade data - INDIA Extensions
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "Tax Engine" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India Tax Base" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "QR Generator" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India GST" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India TCS" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India TDS" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "Fixed Asset Depreciation for India" -version  26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India Gate Entry" -version  26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Name "India Voucher Interface" -version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Tenant default -Name "India Reports"  -Version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Tenant default -Name "India Charge Group"  -Version 26.1.33404.33876
Start-NAVAppDataUpgrade -ServerInstance BC260 -Tenant default -Name "India Data Migration"  -Version 26.1.33404.33876


#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\260\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC260 -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')


#Change application version
Set-NAVApplication -ServerInstance BC260 -Applicationversion 26.1.33404.33876 -Force
Sync-NAVTenant -ServerInstance BC260 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC260 -FunctionExecutionMode Serial -Tenant default -SkipUserSessionCheck
Set-NAVServerConfiguration -ServerInstance BC260 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  