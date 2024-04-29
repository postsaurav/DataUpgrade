Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service\Admin\NavAdminTool.ps1'

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_AMC Banking 365 Fundamentals.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "AMC Banking 365 Fundamentals"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "AMC Banking 365 Fundamentals" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_API Reports - Finance.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "API Reports - Finance"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "API Reports - Finance" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Audit File Export.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Audit File Export"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Audit File Export" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Ceridian Payroll.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Ceridian Payroll"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Ceridian Payroll" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Company Hub.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Company Hub"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Company Hub" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Contoso Coffee Demo Dataset.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Contoso Coffee Demo Dataset"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Contoso Coffee Demo Dataset" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Data Archive.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Data Archive"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Data Archive" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Data Search.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Data Search"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Data Search" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_DIOT - Localization for Mexico.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "DIOT - Localization for Mexico"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "DIOT - Localization for Mexico" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Email - SMTP API.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Email - SMTP API"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Email - SMTP API" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Envestnet Yodlee Bank Feeds.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Envestnet Yodlee Bank Feeds"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Envestnet Yodlee Bank Feeds" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Error Messages with Recommendations.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Error Messages with Recommendations"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Error Messages with Recommendations" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Essential Business Headlines.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Essential Business Headlines"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Essential Business Headlines" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Image Analyzer.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Image Analyzer"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Image Analyzer" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Import of QuickBooks Payroll Files.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Import of QuickBooks Payroll Files"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Import of QuickBooks Payroll Files" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_IRS 1096.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "IRS 1096"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "IRS 1096" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Late Payment Prediction.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Late Payment Prediction"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Late Payment Prediction" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_OnPrem Permissions NA.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "OnPrem Permissions (NA)"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "OnPrem Permissions (NA)" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_OnPrem Permissions.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "OnPrem Permissions"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "OnPrem Permissions" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Payment Links to PayPal.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Payment Links to PayPal"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Payment Links to PayPal" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Payment Practices.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Payment Practices"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Payment Practices" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Recommended Apps.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Recommended Apps"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Recommended Apps" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Sales and Inventory Forecast.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Sales and Inventory Forecast"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Sales and Inventory Forecast" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Send remittance advice by email.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Send remittance advice by email"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Send remittance advice by email" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Send To Email Printer.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Send To Email Printer"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Send To Email Printer" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Shopify Connector.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Shopify Connector"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Shopify Connector" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Simplified Bank Statement Import.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Simplified Bank Statement Import"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Simplified Bank Statement Import" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Troubleshoot FA Ledger Entries.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Troubleshoot FA Ledger Entries"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Troubleshoot FA Ledger Entries" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Universal Print Integration.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Universal Print Integration"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "Universal Print Integration" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_APIV1_.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_APIV1_"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_APIV1_" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_APIV2_.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_APIV2_"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_APIV2_" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_Bank Deposits.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_Bank Deposits"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_Bank Deposits" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_Business_Events_.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_Business_Events_"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_Business_Events_" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_ClientAddIns_.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_ClientAddIns_"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_ClientAddIns_" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_Email Logging Using Graph API.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_Email Logging Using Graph API"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_Email Logging Using Graph API" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_Master_Data_Management.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_Master_Data_Management"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_Master_Data_Management" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_PlanConfiguration_.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_PlanConfiguration_"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_PlanConfiguration_" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft__Exclude_ReportLayouts.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "_Exclude_ReportLayouts"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240 -Name "_Exclude_ReportLayouts" -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Statistical Accounts.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Statistical Accounts"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240  -Name "Statistical Accounts"  -Version 24.0.16410.18056

Publish-NAVApp -ServerInstance BC240 -Path "C:\Upgrade\Dependencies - 1\Microsoft_Review General Ledger Entries.app"
Sync-NAVApp -ServerInstance BC240  -Tenant default -Name "Review General Ledger Entries"  -Version 24.0.16410.18056
Start-NAVAppDataUpgrade -ServerInstance BC240  -Name "Review General Ledger Entries"  -Version 24.0.16410.18056