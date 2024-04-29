Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\Admin\NavAdminTool.ps1'

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Bank Account Reconciliation With AI.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Bank Account Reconciliation With AI"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Bank Account Reconciliation With AI"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Dynamics BC Excel Reports.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Dynamics BC Excel Reports"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Dynamics BC Excel Reports"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_E-Document Core.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Document Core"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Document Core"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_E-Document Core Demo Data.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Document Core Demo Data"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Document Core Demo Data"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_E-Documents Connector with External Endpoints.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Documents Connector with External Endpoints"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "E-Documents Connector with External Endpoints"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Enforced Digital Vouchers.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Enforced Digital Vouchers"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Enforced Digital Vouchers"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_IRS Forms.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "IRS Forms"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "IRS Forms"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Sales Lines Suggestions.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Sales Lines Suggestions"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Sales Lines Suggestions"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Sustainability.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Sustainability"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Sustainability"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\New Apps\Microsoft_Sustainability Contoso Coffee Demo Dataset.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Sustainability Contoso Coffee Demo Dataset"  -Version 24.0.16410.18056
Install-NAVApp -ServerInstance BC240  -Tenant default -Name "Sustainability Contoso Coffee Demo Dataset"  -Version 24.0.16410.18056