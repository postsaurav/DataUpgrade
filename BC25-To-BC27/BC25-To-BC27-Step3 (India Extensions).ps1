﻿########################################################################
#Author : Saurav Dhyani
#Date   : 01-12-2025
#Purpose: Execute IN Apps Upgrades To BC Upgrade
########################################################################

#Import Module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\270\Service\NavAdminTool.ps1'

#Publish extensions
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_Fixed Asset Depreciation for India.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_QR Generator.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_Tax Engine.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Tax Base.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Charge Group.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Voucher Interface.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India TCS.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India TDS.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India GST.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Reports.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Gate Entry.app"
Publish-NAVApp -ServerInstance BC270 -Path "D:\UpgradeToBC27\IN Apps\Microsoft_India Data Migration.app"


#Synchronize Apps
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Fixed Asset Depreciation for India" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "QR Generator" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "Tax Engine" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Tax Base" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Charge Group" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Voucher Interface" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India TCS" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India TDS" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India GST" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Reports" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Gate Entry" -Version 27.1.41698.41776
Sync-NAVApp -ServerInstance BC270 -Tenant default -Name "India Data Migration" -Version 27.1.41698.41776


#Upgrade data
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Fixed Asset Depreciation for India" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "QR Generator" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "Tax Engine" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Tax Base" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Charge Group" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Voucher Interface" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India TCS" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India TDS" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India GST" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Reports" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Gate Entry" -Version 27.1.41698.41776
Start-NAVAppDataUpgrade -ServerInstance BC270 -Name "India Data Migration" -Version 27.1.41698.41776
