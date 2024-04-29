Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\Admin\NavAdminTool.ps1'

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Microsoft_Contoso Coffee Demo Dataset (US).app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Contoso Coffee Demo Dataset (US)"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Contoso Coffee Demo Dataset (US)" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Microsoft_Email - Outlook REST API.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Email - Outlook REST API"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Email - Outlook REST API" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Microsoft_Email - Current User Connector.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Email - Current User Connector"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Email - Current User Connector" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Microsoft_Email - SMTP Connector.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Email - SMTP Connector"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Email - SMTP Connector" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Microsoft_Email - Microsoft 365 Connector.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Email - Microsoft 365 Connector"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Email - Microsoft 365 Connector" -Version 24.0.16410.18056

#Custom App
Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 2\Saurav Dhyani_Demo-PTE_2.0.0.0.app" -SkipVerification
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Demo-PTE"  -Version 2.0.0.0
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Demo-PTE" -Version 2.0.0.0