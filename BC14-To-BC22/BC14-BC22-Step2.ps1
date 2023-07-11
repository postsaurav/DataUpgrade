########################################################################
#Author : Saurav Dhyani
#Date   : 12-07-2023
#Purpose: Execute Step 2 of BC14 to BC22 Upgrade
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\220\Service\NavAdminTool.ps1'

#Convert the application database to version 22
Invoke-NAVApplicationDatabaseConversion -DatabaseServer "LOCALHOST\SQL2009" -DatabaseName "BC14-CU35-BC22"

#Configure version 22 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC22-DEV -KeyName DatabaseServer -KeyValue "LOCALHOST"
Set-NAVServerConfiguration -ServerInstance BC22-DEV -KeyName DatabaseInstance -KeyValue "SQL2009"
Set-NAVServerConfiguration -ServerInstance BC22-DEV -KeyName DatabaseName -KeyValue "BC14-CU35-BC22"

Set-NAVServerConfiguration -ServerInstance BC22-DEV -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"},{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'
Set-NavServerConfiguration -ServerInstance BC22-DEV -KeyName "EnableTaskScheduler" -KeyValue false
Restart-NAVServerInstance -ServerInstance BC22-DEV

Import-NAVServerLicense -ServerInstance BC22-DEV -LicenseFile "D:\BC22-Upgrade\partner.bclicense"
Restart-NAVServerInstance -ServerInstance BC22-DEV

#Publish extensions
Publish-NAVApp -ServerInstance BC22-DEV -Path "D:\BC22-Upgrade\BC22.0 - 55195\Applications\system application\source\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC22-DEV -Path "D:\BC22-Upgrade\BC22.0 - 55195\Applications\BaseApp\Source\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC22-DEV -Path "D:\BC22-Upgrade\BC22.0 - 55195\Applications\Application\Source\Microsoft_Application.app"
Publish-NAVApp -ServerInstance BC22-DEV -Path "D:\BC22-Upgrade\Saurav Demo_Upgrade Demo_22.0.0.0.app" -SkipVerification

#Restart service
Restart-NAVServerInstance -ServerInstance BC22-DEV

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC22-DEV -Tenant default -Mode Sync

#Synchronize Apps
Sync-NAVApp -ServerInstance BC22-DEV -Tenant default -Name "System Application" -Version 22.0.54157.55195
Sync-NAVApp -ServerInstance BC22-DEV -Tenant default -Name "Base Application" -Version 22.0.54157.55195
Sync-NAVApp -ServerInstance BC22-DEV -Tenant default -Name "Application" -Version 22.0.54157.55195
Sync-NAVApp -ServerInstance BC22-DEV -Tenant default -Name "Upgrade Demo" -Version 22.0.0.0

#Upgrade data
Start-NAVDataUpgrade -ServerInstance BC22-DEV -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck

#Install Apps
Install-NAVApp -ServerInstance BC22-DEV -Tenant default -Name "Application" -Version 22.0.54157.55195

#Upgrade Apps / Extension
Start-NAVAppDataUpgrade -ServerInstance BC22-DEV -Name "Upgrade Demo" -Version 22.0.0.0

#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\220\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.SocialListening' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SocialListening\Microsoft.Dynamics.Nav.Client.SocialListening.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC22-DEV -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')

#Change application version
Set-NAVApplication -ServerInstance BC22-DEV -ApplicationVersion 22.0.54157.55195 -Force
Sync-NAVTenant -ServerInstance BC22-DEV -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC22-DEV -FunctionExecutionMode Serial -Tenant default -SkipUserSessionCheck
Set-NAVServerConfiguration -ServerInstance BC22-DEV -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  