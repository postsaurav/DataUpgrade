table 5611 "Depreciation Book"
{
    Caption = 'Depreciation Book';
    DataCaptionFields = "Code", Description;
    Permissions = TableData "FA Posting Type Setup" = rimd,
                  TableData "FA Depreciation Book" = rm;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "G/L Integration - Acq. Cost"; Boolean)
        {
            Caption = 'G/L Integration - Acq. Cost';
        }
        field(4; "G/L Integration - Depreciation"; Boolean)
        {
            Caption = 'G/L Integration - Depreciation';
        }
        field(5; "G/L Integration - Write-Down"; Boolean)
        {
            Caption = 'G/L Integration - Write-Down';
        }
        field(6; "G/L Integration - Appreciation"; Boolean)
        {
            Caption = 'G/L Integration - Appreciation';
        }
        field(7; "G/L Integration - Custom 1"; Boolean)
        {
            Caption = 'G/L Integration - Custom 1';
        }
        field(8; "G/L Integration - Custom 2"; Boolean)
        {
            Caption = 'G/L Integration - Custom 2';
        }
        field(9; "G/L Integration - Disposal"; Boolean)
        {
            Caption = 'G/L Integration - Disposal';
        }
        field(10; "G/L Integration - Maintenance"; Boolean)
        {
            Caption = 'G/L Integration - Maintenance';
        }
        field(11; "Disposal Calculation Method"; Option)
        {
            Caption = 'Disposal Calculation Method';
            OptionCaption = 'Net,Gross';
            OptionMembers = Net,Gross;
        }
        field(12; "Use Custom 1 Depreciation"; Boolean)
        {
            Caption = 'Use Custom 1 Depreciation';
        }
        field(13; "Allow Depr. below Zero"; Boolean)
        {
            Caption = 'Allow Depr. below Zero';
        }
        field(14; "Use FA Exch. Rate in Duplic."; Boolean)
        {
            Caption = 'Use FA Exch. Rate in Duplic.';
        }
        field(15; "Part of Duplication List"; Boolean)
        {
            Caption = 'Part of Duplication List';
        }
        field(17; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(18; "Allow Indexation"; Boolean)
        {
            Caption = 'Allow Indexation';
        }
        field(19; "Use Same FA+G/L Posting Dates"; Boolean)
        {
            Caption = 'Use Same FA+G/L Posting Dates';
            InitValue = true;
        }
        field(20; "Default Exchange Rate"; Decimal)
        {
            Caption = 'Default Exchange Rate';
            DecimalPlaces = 4 : 4;
            MinValue = 0;
        }
        field(23; "Use FA Ledger Check"; Boolean)
        {
            Caption = 'Use FA Ledger Check';
            InitValue = true;
        }
        field(24; "Use Rounding in Periodic Depr."; Boolean)
        {
            Caption = 'Use Rounding in Periodic Depr.';
        }
        field(25; "New Fiscal Year Starting Date"; Date)
        {
            Caption = 'New Fiscal Year Starting Date';
        }
        field(26; "No. of Days in Fiscal Year"; Integer)
        {
            Caption = 'No. of Days in Fiscal Year';
            MaxValue = 1080;
            MinValue = 10;
        }
        field(27; "Allow Changes in Depr. Fields"; Boolean)
        {
            Caption = 'Allow Changes in Depr. Fields';
        }
        field(28; "Default Final Rounding Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Default Final Rounding Amount';
            MinValue = 0;
        }
        field(29; "Default Ending Book Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Default Ending Book Value';
            MinValue = 0;
        }
        field(32; "Periodic Depr. Date Calc."; Option)
        {
            Caption = 'Periodic Depr. Date Calc.';
            OptionCaption = 'Last Entry,Last Depr. Entry';
            OptionMembers = "Last Entry","Last Depr. Entry";
        }
        field(33; "Mark Errors as Corrections"; Boolean)
        {
            Caption = 'Mark Errors as Corrections';
        }
        field(34; "Add-Curr Exch Rate - Acq. Cost"; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add-Curr Exch Rate - Acq. Cost';
        }
        field(35; "Add.-Curr. Exch. Rate - Depr."; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add.-Curr. Exch. Rate - Depr.';
        }
        field(36; "Add-Curr Exch Rate -Write-Down"; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add-Curr Exch Rate -Write-Down';
        }
        field(37; "Add-Curr. Exch. Rate - Apprec."; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add-Curr. Exch. Rate - Apprec.';
        }
        field(38; "Add-Curr. Exch Rate - Custom 1"; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add-Curr. Exch Rate - Custom 1';
        }
        field(39; "Add-Curr. Exch Rate - Custom 2"; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add-Curr. Exch Rate - Custom 2';
        }
        field(40; "Add.-Curr. Exch. Rate - Disp."; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add.-Curr. Exch. Rate - Disp.';
        }
        field(41; "Add.-Curr. Exch. Rate - Maint."; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Add.-Curr. Exch. Rate - Maint.';
        }
        field(42; "Use Default Dimension"; Boolean)
        {
            Caption = 'Use Default Dimension';
        }
        field(43; "Subtract Disc. in Purch. Inv."; Boolean)
        {
            Caption = 'Subtract Disc. in Purch. Inv.';
        }
        field(44; "Allow Correction of Disposal"; Boolean)
        {
            Caption = 'Allow Correction of Disposal';
        }
        field(45; "Allow more than 360/365 Days"; Boolean)
        {
            Caption = 'Allow more than 360/365 Days';
        }
        field(46; "VAT on Net Disposal Entries"; Boolean)
        {
            Caption = 'VAT on Net Disposal Entries';
        }
        field(47; "Allow Acq. Cost below Zero"; Boolean)
        {
            Caption = 'Allow Acq. Cost below Zero';
        }
        field(48; "Allow Identical Document No."; Boolean)
        {
            Caption = 'Allow Identical Document No.';
        }
        field(49; "Fiscal Year 365 Days"; Boolean)
        {
            Caption = 'Fiscal Year 365 Days';
        }
        field(10500; "Use Accounting Period"; Boolean)
        {
            Caption = 'Use Accounting Period';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

