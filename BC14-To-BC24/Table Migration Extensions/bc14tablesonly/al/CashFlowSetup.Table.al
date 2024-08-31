table 843 "Cash Flow Setup"
{
    Caption = 'Cash Flow Setup';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Cash Flow Forecast No. Series"; Code[20])
        {
            Caption = 'Cash Flow Forecast No. Series';
            TableRelation = "No. Series";
        }
        field(3; "Receivables CF Account No."; Code[20])
        {
            Caption = 'Receivables CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(4; "Payables CF Account No."; Code[20])
        {
            Caption = 'Payables CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(5; "Sales Order CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Sales Order CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(6; "Purch. Order CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Purch. Order CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(8; "FA Budget CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Budget CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(9; "FA Disposal CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Disposal CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(10; "Service CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Service CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(11; "CF No. on Chart in Role Center"; Code[20])
        {
            Caption = 'CF No. on Chart in Role Center';
        }
        field(12; "Job CF Account No."; Code[20])
        {
            AccessByPermission = TableData "Job Planning Line" = R;
            Caption = 'Job CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(13; "Automatic Update Frequency"; Option)
        {
            Caption = 'Automatic Update Frequency';
            OptionCaption = 'Never,Daily,Weekly';
            OptionMembers = Never,Daily,Weekly;
        }
        field(14; "Tax CF Account No."; Code[20])
        {
            AccessByPermission = TableData "VAT Entry" = R;
            Caption = 'Tax CF Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(19; "Taxable Period"; Option)
        {
            Caption = 'Taxable Period';
            InitValue = Quarterly;
            OptionCaption = 'Monthly,Quarterly,Accounting Period,Yearly';
            OptionMembers = Monthly,Quarterly,"Accounting Period",Yearly;
        }
        field(20; "Tax Payment Window"; DateFormula)
        {
            Caption = 'Tax Payment Window';
        }
        field(21; "Tax Bal. Account Type"; Option)
        {
            Caption = 'Tax Bal. Account Type';
            OptionCaption = ' ,Vendor,G/L Account';
            OptionMembers = " ",Vendor,"G/L Account";
        }
        field(22; "Tax Bal. Account No."; Code[20])
        {
            Caption = 'Tax Bal. Account No.';
            TableRelation = IF ("Tax Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Tax Bal. Account Type" = CONST (Vendor)) Vendor;
        }
        field(23; "API Key"; Text[250])
        {
            Caption = 'API Key';
        }
        field(24; "API URL"; Text[250])
        {
            Caption = 'API URL';
        }
        field(25; "Variance %"; Integer)
        {
            Caption = 'Variance %';
            InitValue = 35;
            MaxValue = 100;
            MinValue = 1;
        }
        field(26; "Historical Periods"; Integer)
        {
            Caption = 'Historical Periods';
            InitValue = 24;
            MaxValue = 24;
            MinValue = 5;
        }
        field(27; Horizon; Integer)
        {
            Caption = 'Horizon';
            InitValue = 4;
            MaxValue = 24;
            MinValue = 3;
        }
        field(28; "Period Type"; Option)
        {
            Caption = 'Period Type';
            InitValue = Month;
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(29; TimeOut; Integer)
        {
            Caption = 'TimeOut';
            InitValue = 120;
            MinValue = 1;
        }
        field(30; "Service Pass API Key ID"; Guid)
        {
            Caption = 'Service Pass API Key ID';
            Description = 'The Key for retrieving the API Key from the Service Password table.';
            TableRelation = "Service Password".Key;
        }
        field(31; "Cortana Intelligence Enabled"; Boolean)
        {
            Caption = 'Cortana Intelligence Enabled';
            InitValue = false;
        }
        field(32; "Show Cortana Notification"; Boolean)
        {
            Caption = 'Show Cortana Notification';
            InitValue = true;
        }
        field(33; "Time Series Model"; Option)
        {
            Caption = 'Time Series Model';
            OptionCaption = 'ARIMA,ETS,STL,ETS+ARIMA,ETS+STL,ALL,TBATS', Locked = true;
            OptionMembers = ARIMA,ETS,STL,"ETS+ARIMA","ETS+STL",ALL,TBATS;
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

