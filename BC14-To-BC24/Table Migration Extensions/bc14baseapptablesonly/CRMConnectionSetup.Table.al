table 5330 "CRM Connection Setup"
{
    Caption = 'Microsoft Dynamics 365 Connection Setup';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Server Address"; Text[250])
        {
            Caption = 'Dynamics 365 for Sales URL';
        }
        field(3; "User Name"; Text[250])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; "User Password Key"; Guid)
        {
            Caption = 'User Password Key';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(5; "Last Update Invoice Entry No."; Integer)
        {
            Caption = 'Last Update Invoice Entry No.';
            Editable = false;
        }
        field(59; "Restore Connection"; Boolean)
        {
            Caption = 'Restore Connection';
        }
        field(60; "Is Enabled"; Boolean)
        {
            Caption = 'Is Enabled';
        }
        field(61; "Is User Mapping Required"; Boolean)
        {
            Caption = 'Business Central Users Must Map to Dynamics 365 for Sales Users';
        }
        field(62; "Is User Mapped To CRM User"; Boolean)
        {
            Caption = 'Is User Mapped To CRM User';
        }
        field(63; "CRM Version"; Text[30])
        {
            Caption = 'CRM Version';
        }
        field(64; "Use Newest UI"; Boolean)
        {
            Caption = 'Use Newest UI';
            DataClassification = SystemMetadata;
        }
        field(65; "Newest UI AppModuleId"; Text[50])
        {
            Caption = 'Newest UI AppModuleId';
            DataClassification = SystemMetadata;
        }
        field(66; "Is S.Order Integration Enabled"; Boolean)
        {
            Caption = 'Is S.Order Integration Enabled';
        }
        field(67; "Is CRM Solution Installed"; Boolean)
        {
            Caption = 'Is CRM Solution Installed';
        }
        field(68; "Is Enabled For User"; Boolean)
        {
            Caption = 'Is Enabled For User';
        }
        field(69; "Dynamics NAV URL"; Text[250])
        {
            Caption = 'Dynamics NAV URL';
        }
        field(70; "Dynamics NAV OData URL"; Text[250])
        {
            Caption = 'Dynamics NAV OData URL';
        }
        field(71; "Dynamics NAV OData Username"; Text[250])
        {
            Caption = 'Dynamics NAV OData Username';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(72; "Dynamics NAV OData Accesskey"; Text[250])
        {
            Caption = 'Dynamics NAV OData Accesskey';
        }
        field(75; "Default CRM Price List ID"; Guid)
        {
            Caption = 'Default CRM Price List ID';
        }
        field(76; "Proxy Version"; Integer)
        {
            Caption = 'Proxy Version';
            DataClassification = SystemMetadata;
        }
        field(80; "Auto Create Sales Orders"; Boolean)
        {
            Caption = 'Automatically Create Sales Orders';
            DataClassification = SystemMetadata;
        }
        field(81; "Auto Process Sales Quotes"; Boolean)
        {
            Caption = 'Automatically Process Sales Quotes';
            DataClassification = SystemMetadata;
        }
        field(118; CurrencyDecimalPrecision; Integer)
        {
            Caption = 'Currency Decimal Precision';
            Description = 'Number of decimal places that can be used for currency.';
        }
        field(124; BaseCurrencyId; Guid)
        {
            Caption = 'Currency';
            Description = 'Unique identifier of the base currency of the organization.';
            TableRelation = "CRM Transactioncurrency".TransactionCurrencyId;
        }
        field(133; BaseCurrencyPrecision; Integer)
        {
            Caption = 'Base Currency Precision';
            Description = 'Number of decimal places that can be used for the base currency.';
            MaxValue = 4;
            MinValue = 0;
        }
        field(134; BaseCurrencySymbol; Text[5])
        {
            Caption = 'Base Currency Symbol';
            Description = 'Symbol used for the base currency.';
        }
        field(135; "Authentication Type"; Option)
        {
            Caption = 'Authentication Type';
            OptionCaption = 'Office365,AD,IFD,OAuth';
            OptionMembers = Office365,AD,IFD,OAuth;
        }
        field(136; "Connection String"; Text[250])
        {
            Caption = 'Connection String';
        }
        field(137; Domain; Text[250])
        {
            Caption = 'Domain';
            DataClassification = OrganizationIdentifiableInformation;
            Editable = false;
        }
        field(138; "Server Connection String"; BLOB)
        {
            Caption = 'Server Connection String';
        }
        field(139; "Disable Reason"; Text[250])
        {
            Caption = 'Disable Reason';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

