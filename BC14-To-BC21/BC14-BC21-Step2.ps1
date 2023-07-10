#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\NavAdminTool.ps1'

#Convert the application database to version 21
Invoke-NAVApplicationDatabaseConversion -DatabaseServer "LOCALHOST\SQL2009" -DatabaseName "BC14-CU35-BC21"

#Configure version 21 server for DestinationAppsForMigration
Set-NAVServerConfiguration -ServerInstance BC210 -KeyName DatabaseServer -KeyValue "LOCALHOST"
Set-NAVServerConfiguration -ServerInstance BC210 -KeyName DatabaseInstance -KeyValue "SQL2009"
Set-NAVServerConfiguration -ServerInstance BC210 -KeyName DatabaseName -KeyValue "BC14-CU35-BC21"

Set-NAVServerConfiguration -ServerInstance BC210 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"},{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'
Set-NavServerConfiguration -ServerInstance BC210 -KeyName "EnableTaskScheduler" -KeyValue false
Restart-NAVServerInstance -ServerInstance BC210
Import-NAVServerLicense -ServerInstance BC210 -LicenseFile "D:\BC21-Upgrade\partner.bclicense"
Restart-NAVServerInstance -ServerInstance BC210

#Publish extensions
Publish-NAVApp -ServerInstance BC210 -Path "D:\BC21-Upgrade\BC21.4 - Dynamics.365.BC.52785.US.DVD\Applications\system application\source\Microsoft_System Application.app"
Publish-NAVApp -ServerInstance BC210 -Path "D:\BC21-Upgrade\BC21.4 - Dynamics.365.BC.52785.US.DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
Publish-NAVApp -ServerInstance BC210 -Path "D:\BC21-Upgrade\BC21.4 - Dynamics.365.BC.52785.US.DVD\Applications\Application\Source\Microsoft_Application.app"
Publish-NAVApp -ServerInstance BC210 -Path "D:\BC21-Upgrade\Saurav Demo_Upgrade Demo_21.0.0.0.app" -SkipVerification

#Restart service
Restart-NAVServerInstance -ServerInstance BC210

#Synchronize tenant
Sync-NAVTenant -ServerInstance BC210 -Tenant default -Mode Sync

#Synchronize Apps
Sync-NAVApp -ServerInstance BC210 -Tenant default -Name "System Application" -Version 21.4.52563.52785
Sync-NAVApp -ServerInstance BC210 -Tenant default -Name "Base Application" -Version 21.4.52563.52785
Sync-NAVApp -ServerInstance BC210 -Tenant default -Name "Application" -Version 21.4.52563.52785
Sync-NAVApp -ServerInstance BC210 -Tenant default -Name "Upgrade Demo" -Version 21.0.0.0

#Upgrade data
Start-NAVDataUpgrade -ServerInstance BC210 -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck

#Install Apps
Install-NAVApp -ServerInstance BC210 -Tenant default -Name "Application" -Version 21.4.52563.52785

#Upgrade Apps / Extension
Start-NAVAppDataUpgrade -ServerInstance BC210 -Name "Upgrade Demo" -Version 21.0.0.0

#Upgrade control add-ins
$AddinsFolder = 'C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\Add-ins'

Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.BusinessChart' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.FlowIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'FlowIntegration\Microsoft.Dynamics.Nav.Client.FlowIntegration.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.OAuthIntegration' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'OAuthIntegration\Microsoft.Dynamics.Nav.Client.OAuthIntegration.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.PageReady' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PageReady\Microsoft.Dynamics.Nav.Client.PageReady.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.PowerBIManagement' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'PowerBIManagement\Microsoft.Dynamics.Nav.Client.PowerBIManagement.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.RoleCenterSelector' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'RoleCenterSelector\Microsoft.Dynamics.Nav.Client.RoleCenterSelector.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.SatisfactionSurvey' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SatisfactionSurvey\Microsoft.Dynamics.Nav.Client.SatisfactionSurvey.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.SocialListening' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'SocialListening\Microsoft.Dynamics.Nav.Client.SocialListening.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.VideoPlayer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'VideoPlayer\Microsoft.Dynamics.Nav.Client.VideoPlayer.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.WebPageViewer' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WebPageViewer\Microsoft.Dynamics.Nav.Client.WebPageViewer.zip')
Set-NAVAddIn -ServerInstance BC210 -AddinName 'Microsoft.Dynamics.Nav.Client.WelcomeWizard' -PublicKeyToken 31bf3856ad364e35 -ResourceFile ($AppName = Join-Path $AddinsFolder 'WelcomeWizard\Microsoft.Dynamics.Nav.Client.WelcomeWizard.zip')

#Change application version
Set-NAVApplication -ServerInstance BC210 -ApplicationVersion 21.4.52785 -Force
Sync-NAVTenant -ServerInstance BC210 -Mode Sync -Tenant default
Start-NAVDataUpgrade -ServerInstance BC210 -FunctionExecutionMode Serial -Tenant default
Set-NAVServerConfiguration -ServerInstance BC210 -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  