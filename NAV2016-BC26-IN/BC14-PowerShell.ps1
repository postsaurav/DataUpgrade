#import module
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\140\Service\NavAdminTool.ps1'

#Sync Nav Tenant
Sync-NAVTenant -ServerInstance BC140 -Mode Sync

#Delete objects (tables) with sync schema force
# 470|824|825|826|827|828|829|830|1305|1510|5150|5371|5372|8640

#Publish of System and Test Apps
Publish-NAVApp -ServerInstance BC140 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\AL Development Environment\System.app" -PackageType SymbolsOnly
Publish-NAVApp -ServerInstance BC140 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\AL Development Environment\Test.app" -PackageType SymbolsOnly

#Generate Symbols from Command Prompt (Administartor)
# cd C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client
# finsql.exe command=generatesymbolreference, ServerName=<SQL Server Name\Instance>, Database=<DatabaseName>

#Publish India Upgrade Tables
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaUpgradeTables.app"
Sync-NAVApp -ServerInstance BC140 -Name "India Upgrade Tables"
Install-NAVApp  -ServerInstance BC140 -Name "India Upgrade Tables"

#Sync Nav Tenant
Sync-NAVTenant -ServerInstance BC140 -Mode Sync

#Data Upgrade for W1
Start-navdataupgrade  -ServerInstance BC140 -FunctionExecutionMode Serial -SkipCompanyInitialization

#Upgrade Progress
Get-NavDataUpgrade  -ServerInstance BC140 -Interval 10 -Progress
Get-NavDataUpgrade  -ServerInstance BC140 -Detailed -tenant default | out-gridview

#Publish India Extensions
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaTaxBase.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaTaxEngine.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaUPGTCS.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\INFADepreciation.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\INVoucherInterface.app" 
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaTaxGST.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\IndiaUPGTDS.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\INGateEntry.app"
Publish-NAVApp -ServerInstance BC140 -Path "D:\IN UPGRADE DEMO\Apps\UPGIndia.app"

#Sync India Extensions
Sync-NAVApp -ServerInstance BC140 -Name "India Tax Base"
Sync-NAVApp -ServerInstance BC140 -Name "Tax Engine"
Sync-NAVApp -ServerInstance BC140 -Name "India TCS"
Sync-NAVApp -ServerInstance BC140 -Name "Fixed Asset Depreciation for India"
Sync-NAVApp -ServerInstance BC140 -Name "India Voucher Interface"
Sync-NAVApp -ServerInstance BC140 -Name "India GST"
Sync-NAVApp -ServerInstance BC140 -Name "India TDS"
Sync-NAVApp -ServerInstance BC140 -Name "India Gate Entry"
Sync-NAVApp -ServerInstance BC140 -Name "India Data Migration"

#Install India Extensions
Install-NAVApp -ServerInstance BC140 -Name "India Tax Base"
Install-NAVApp -ServerInstance BC140 -Name "Tax Engine"
Install-NAVApp -ServerInstance BC140 -Name "India TCS"
Install-NAVApp -ServerInstance BC140 -Name "Fixed Asset Depreciation for India"
Install-NAVApp -ServerInstance BC140 -Name "India Voucher Interface"
Install-NAVApp -ServerInstance BC140 -Name "India GST"
Install-NAVApp -ServerInstance BC140 -Name "India TDS"
Install-NAVApp -ServerInstance BC140 -Name "India Gate Entry"
Install-NAVApp -ServerInstance BC140 -Name "India Data Migration"

#Upgrade Step
# Using Web Client for each company 
# Search Data Transfer and Run Data Upgrade