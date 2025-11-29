﻿########################################################################
#Author : Saurav Dhyani
#Date   : 01-12-2025
#Purpose: Execute Apps Upgrades To BC Upgrade
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\270\Service\NavAdminTool.ps1'

#Publish,Sync and Upgrade : Symbols extensions
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_APIV1_.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_APIV2_.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_Bank Deposits.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_Business_Events_.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_ClientAddIns_.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_Email Logging Using Graph API.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_Master_Data_Management.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_PlanConfiguration_.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft__Exclude_ReportLayouts.app"

Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_APIV1_" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_APIV2_" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_Bank Deposits" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_Business_Events_" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_ClientAddIns_" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_Email Logging Using Graph API" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_Master_Data_Management" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_PlanConfiguration_" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "_Exclude_ReportLayouts" -Version 27.1.41698.41776

Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_APIV1_" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_APIV2_" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_Bank Deposits" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_Business_Events_" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_ClientAddIns_" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_Email Logging Using Graph API" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_Master_Data_Management" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_PlanConfiguration_" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "_Exclude_ReportLayouts" -Version 27.1.41698.41776


#Publish,Sync and Upgrade : Data Archive and Search
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Data Archive.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Data Search.app"

Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Data Archive" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Data Search" -Version 27.1.41698.41776

Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Data Archive" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Data Search" -Version 27.1.41698.41776

#Publish,Sync and Upgrade : reports and other extensions
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Dynamics BC Excel Reports.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Error Messages with Recommendations.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Essential Business Headlines.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Late Payment Prediction.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_OnPrem Permissions.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Recommended Apps.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Power BI Report embeddings for Dynamics 365 Business Central.app"

Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Dynamics BC Excel Reports" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Error Messages with Recommendations" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Essential Business Headlines" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Late Payment Prediction" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "OnPrem Permissions" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Recommended Apps" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Power BI Report embeddings for Dynamics 365 Business Central" -Version 27.1.41698.41776

Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Dynamics BC Excel Reports" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Error Messages with Recommendations" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Essential Business Headlines" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Late Payment Prediction" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "OnPrem Permissions" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Recommended Apps" -Version 27.1.41698.41776
Install-NAVApp -ServerInstance BC270 -Name "Power BI Report embeddings for Dynamics 365 Business Central" -Version 27.1.41698.41776


#Publish,Sync and Upgrade : Email Apps
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Email - Outlook REST API.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Microsoft_Email - SMTP API.app"

Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\2\Microsoft_Email - Current User Connector.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\2\Microsoft_Email - Microsoft 365 Connector.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\2\Microsoft_Email - SMTP Connector.app"

Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Email - Outlook REST API" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Email - SMTP API" -Version 27.1.41698.41776

Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Email - Current User Connector" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Email - Microsoft 365 Connector" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Email - SMTP Connector" -Version 27.1.41698.41776

Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Email - Outlook REST API" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Email - SMTP API" -Version 27.1.41698.41776

Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Email - Current User Connector" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Email - Microsoft 365 Connector" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Email - SMTP Connector" -Version 27.1.41698.41776

#Publish,Sync and Upgrade : PTE
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\1\Edhate Consulting_UPG-Extension_27.0.0.0.app" -SkipVerification
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "UPG-Extension" -Version 27.0.0.0
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "UPG-Extension" -Version 27.0.0.0

#Breaking Changes
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\Apps\2\Microsoft_Subscription Billing.app"
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Subscription Billing" -Version 27.1.41698.41776 -Mode ForceSync
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Subscription Billing" -Version 27.1.41698.41776