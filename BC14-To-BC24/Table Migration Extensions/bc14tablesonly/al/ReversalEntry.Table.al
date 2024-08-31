table 179 "Reversal Entry"
{
    Caption = 'Reversal Entry';
    PasteIsValid = false;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = ' ,G/L Account,Customer,Vendor,Bank Account,Fixed Asset,Maintenance,VAT,Employee';
            OptionMembers = " ","G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Maintenance,VAT,Employee;
        }
        field(3; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            TableRelation = IF ("Entry Type" = CONST ("G/L Account")) "G/L Entry"
            ELSE
            IF ("Entry Type" = CONST (Customer)) "Cust. Ledger Entry"
            ELSE
            IF ("Entry Type" = CONST (Vendor)) "Vendor Ledger Entry"
            ELSE
            IF ("Entry Type" = CONST ("Bank Account")) "Bank Account Ledger Entry"
            ELSE
            IF ("Entry Type" = CONST ("Fixed Asset")) "FA Ledger Entry"
            ELSE
            IF ("Entry Type" = CONST (Maintenance)) "Maintenance Ledger Entry"
            ELSE
            IF ("Entry Type" = CONST (VAT)) "VAT Entry";
        }
        field(4; "G/L Register No."; Integer)
        {
            Caption = 'G/L Register No.';
            TableRelation = "G/L Register";
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(7; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(8; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Bank Account,Fixed Asset,Employee';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset",Employee;
        }
        field(9; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (Customer)) Customer
            ELSE
            IF ("Source Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Source Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Source Type" = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Source Type" = CONST (Employee)) Employee;
        }
        field(10; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(13; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Debit Amount';
        }
        field(14; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Amount';
        }
        field(15; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(16; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Debit Amount (LCY)';
        }
        field(17; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Amount (LCY)';
        }
        field(18; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(19; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(20; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(21; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(22; "Account No."; Code[20])
        {
            Caption = 'Account No.';
        }
        field(23; "Account Name"; Text[100])
        {
            Caption = 'Account Name';
        }
        field(25; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(26; "Bal. Account No."; Code[20])
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
        field(27; "FA Posting Category"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Posting Category';
            OptionCaption = ' ,Disposal,Bal. Disposal';
            OptionMembers = " ",Disposal,"Bal. Disposal";
        }
        field(28; "FA Posting Type"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Posting Type';
            OptionCaption = ' ,Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Proceeds on Disposal,Salvage Value,Gain/Loss,Book Value on Disposal';
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2","Proceeds on Disposal","Salvage Value","Gain/Loss","Book Value on Disposal";
        }
        field(30; "Reversal Type"; Option)
        {
            Caption = 'Reversal Type';
            OptionCaption = 'Transaction,Register';
            OptionMembers = Transaction,Register;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Entry Type")
        {
        }
        key(Key3; "Document No.", "Posting Date", "Entry Type", "Entry No.")
        {
        }
        key(Key4; "Entry Type", "Entry No.")
        {
        }
        key(Key5; "Transaction No.")
        {
        }
    }

    fieldgroups
    {
    }
}

