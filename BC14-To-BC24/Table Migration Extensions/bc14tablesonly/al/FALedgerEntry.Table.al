table 5601 "FA Ledger Entry"
{
    Caption = 'FA Ledger Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "G/L Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'G/L Entry No.';
            TableRelation = "G/L Entry";
        }
        field(3; "FA No."; Code[20])
        {
            Caption = 'FA No.';
            TableRelation = "Fixed Asset";
        }
        field(4; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(8; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(9; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";
        }
        field(12; "FA Posting Category"; Option)
        {
            Caption = 'FA Posting Category';
            OptionCaption = ' ,Disposal,Bal. Disposal';
            OptionMembers = " ",Disposal,"Bal. Disposal";
        }
        field(13; "FA Posting Type"; Option)
        {
            Caption = 'FA Posting Type';
            OptionCaption = 'Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Proceeds on Disposal,Salvage Value,Gain/Loss,Book Value on Disposal';
            OptionMembers = "Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2","Proceeds on Disposal","Salvage Value","Gain/Loss","Book Value on Disposal";
        }
        field(14; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(15; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Debit Amount';
        }
        field(16; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Amount';
        }
        field(17; "Reclassification Entry"; Boolean)
        {
            Caption = 'Reclassification Entry';
        }
        field(18; "Part of Book Value"; Boolean)
        {
            Caption = 'Part of Book Value';
        }
        field(19; "Part of Depreciable Basis"; Boolean)
        {
            Caption = 'Part of Depreciable Basis';
        }
        field(20; "Disposal Calculation Method"; Option)
        {
            Caption = 'Disposal Calculation Method';
            OptionCaption = ' ,Net,Gross';
            OptionMembers = " ",Net,Gross;
        }
        field(21; "Disposal Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Disposal Entry No.';
        }
        field(22; "No. of Depreciation Days"; Integer)
        {
            Caption = 'No. of Depreciation Days';
        }
        field(23; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(24; "FA No./Budgeted FA No."; Code[20])
        {
            Caption = 'FA No./Budgeted FA No.';
            TableRelation = "Fixed Asset";
        }
        field(25; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
        }
        field(26; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(27; "FA Posting Group"; Code[20])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
        }
        field(28; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(29; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(30; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(32; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(33; "Depreciation Method"; Option)
        {
            Caption = 'Depreciation Method';
            OptionCaption = 'Straight-Line,Declining-Balance 1,Declining-Balance 2,DB1/SL,DB2/SL,User-Defined,Manual';
            OptionMembers = "Straight-Line","Declining-Balance 1","Declining-Balance 2","DB1/SL","DB2/SL","User-Defined",Manual;
        }
        field(34; "Depreciation Starting Date"; Date)
        {
            Caption = 'Depreciation Starting Date';
        }
        field(35; "Straight-Line %"; Decimal)
        {
            Caption = 'Straight-Line %';
            DecimalPlaces = 1 : 1;
        }
        field(36; "No. of Depreciation Years"; Decimal)
        {
            Caption = 'No. of Depreciation Years';
            DecimalPlaces = 0 : 3;
        }
        field(37; "Fixed Depr. Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Fixed Depr. Amount';
        }
        field(38; "Declining-Balance %"; Decimal)
        {
            Caption = 'Declining-Balance %';
            DecimalPlaces = 1 : 1;
        }
        field(39; "Depreciation Table Code"; Code[10])
        {
            Caption = 'Depreciation Table Code';
            TableRelation = "Depreciation Table Header";
        }
        field(40; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(41; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(42; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(43; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(44; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(45; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Fixed Asset")) "Fixed Asset";
        }
        field(46; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(47; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(48; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(49; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(50; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(51; "FA Exchange Rate"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'FA Exchange Rate';
        }
        field(52; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(53; "Result on Disposal"; Option)
        {
            Caption = 'Result on Disposal';
            OptionCaption = ' ,Gain,Loss';
            OptionMembers = " ",Gain,Loss;
        }
        field(54; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(55; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(56; "Canceled from FA No."; Code[20])
        {
            Caption = 'Canceled from FA No.';
            TableRelation = "Fixed Asset";
        }
        field(57; "Depreciation Ending Date"; Date)
        {
            Caption = 'Depreciation Ending Date';
        }
        field(58; "Use FA Ledger Check"; Boolean)
        {
            Caption = 'Use FA Ledger Check';
        }
        field(59; "Automatic Entry"; Boolean)
        {
            Caption = 'Automatic Entry';
        }
        field(60; "Depr. Starting Date (Custom 1)"; Date)
        {
            Caption = 'Depr. Starting Date (Custom 1)';
        }
        field(61; "Depr. Ending Date (Custom 1)"; Date)
        {
            Caption = 'Depr. Ending Date (Custom 1)';
        }
        field(62; "Accum. Depr. % (Custom 1)"; Decimal)
        {
            Caption = 'Accum. Depr. % (Custom 1)';
            DecimalPlaces = 1 : 1;
        }
        field(63; "Depr. % this year (Custom 1)"; Decimal)
        {
            Caption = 'Depr. % this year (Custom 1)';
            DecimalPlaces = 1 : 1;
        }
        field(64; "Property Class (Custom 1)"; Option)
        {
            Caption = 'Property Class (Custom 1)';
            OptionCaption = ' ,Personal Property,Real Property';
            OptionMembers = " ","Personal Property","Real Property";
        }
        field(65; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(66; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(67; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(68; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(69; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(70; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(71; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(72; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(73; "Reversed by Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed by Entry No.';
            TableRelation = "FA Ledger Entry";
        }
        field(74; "Reversed Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed Entry No.';
            TableRelation = "FA Ledger Entry";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "FA No.", "Depreciation Book Code", "FA Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "FA Posting Date", "Part of Book Value", "Reclassification Entry")
        {
            SumIndexFields = Amount;
        }
        key(Key4; "FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key5; "FA No.", "Depreciation Book Code", "Part of Depreciable Basis", "FA Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key6; "FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Posting Date")
        {
            SumIndexFields = Amount;
        }
        key(Key7; "Canceled from FA No.", "Depreciation Book Code", "FA Posting Date")
        {
        }
        key(Key8; "Document No.", "Posting Date")
        {
        }
        key(Key9; "G/L Entry No.")
        {
        }
        key(Key10; "Document Type", "Document No.")
        {
        }
        key(Key11; "Transaction No.")
        {
        }
        key(Key12; "FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Document No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "FA No.", "FA Posting Date", "FA Posting Type", "Document Type")
        {
        }
    }
}

