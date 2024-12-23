########################################################################
#Author : Saurav Dhyani
#Date   : 23-12-2024
#Purpose: Execute Step 2 of BC Upgrade
########################################################################


#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\250\Service\NavAdminTool.ps1'

#Convert the application database to version 24
Invoke-NAVApplicationDatabaseConversion -DatabaseServer localhost -DatabaseName BC24_To_BC25

#Configure version 25 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC250 -KeyName DatabaseServer -KeyValue localhost
#Set-NAVServerConfiguration -ServerInstance BC250 -KeyName DatabaseInstance -KeyValue 
Set-NAVServerConfiguration -ServerInstance BC250 -KeyName DatabaseName -KeyValue BC24_To_BC25
Set-NavServerConfiguration -ServerInstance BC250 -KeyName "EnableTaskScheduler" -KeyValue false

Restart-NAVServerInstance -ServerInstance BC250

#Import-NAVServerLicense -ServerInstance BC250 -LicenseFile "C:\Upgrade\Dev.bclicense"
#Restart-NAVServerInstance -ServerInstance BC250

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC250 -Tenant default -Mode Sync

#Publish extensions
Publish-NAVApp -ServerInstance BC250 -Path "E:\Upgrade To BC 25\Core Apps\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC250 -Path "E:\Upgrade To BC 25\Core Apps\Microsoft_Business Foundation.app"
Publish-NAVApp -ServerInstance BC250 -Path "E:\Upgrade To BC 25\Core Apps\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC250 -Path "E:\Upgrade To BC 25\Core Apps\Microsoft_Application.app"

#Restart service
Restart-NAVServerInstance -ServerInstance BC250


#Synchronize Apps
Sync-NAVApp -ServerInstance BC250 -Tenant default -Name "System Application" -Version 25.1.25873.25900
Sync-NAVApp -ServerInstance BC250 -Tenant default -Name "Business Foundation" -Version 25.1.25873.25900
Sync-NAVApp -ServerInstance BC250 -Tenant default -Name "Base Application" -Version 25.1.25873.25900
Sync-NAVApp -ServerInstance BC250 -Tenant default -Name "Application" -Version 25.1.25873.25900


#Upgrade data
Start-NAVAppDataUpgrade -ServerInstance BC250 -Name "System Application" -Version 25.1.25873.25900
Start-NAVAppDataUpgrade -ServerInstance BC250 -Name "Business Foundation" -Version 25.1.25873.25900
Start-NAVAppDataUpgrade -ServerInstance BC250 -Name "Base Application" -Version 25.1.25873.25900
Start-NAVAppDataUpgrade -ServerInstance BC250 -Name "Application" -Version 25.1.25873.25900


#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\250\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC250 -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')


#Change application version
Set-NAVApplication -ServerInstance BC250 -ApplicationVersion 25.1.25873.25900 -Force
Sync-NAVTenant -ServerInstance BC250 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC250 -FunctionExecutionMode Serial -Tenant default -SkipUserSessionCheck
Set-NAVServerConfiguration -ServerInstance BC250 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  