table 303 "Finance Charge Memo Line"
{
    Caption = 'Finance Charge Memo Line';

    fields
    {
        field(1; "Finance Charge Memo No."; Code[20])
        {
            Caption = 'Finance Charge Memo No.';
            TableRelation = "Finance Charge Memo Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            NotBlank = true;
        }
        field(3; "Attached to Line No."; Integer)
        {
            Caption = 'Attached to Line No.';
            Editable = false;
            TableRelation = "Finance Charge Memo Line"."Line No." WHERE ("Finance Charge Memo No." = FIELD ("Finance Charge Memo No."));
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Customer Ledger Entry';
            OptionMembers = " ","G/L Account","Customer Ledger Entry";
        }
        field(5; "Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Entry No.';
            TableRelation = "Cust. Ledger Entry";
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(9; "Due Date"; Date)
        {
            Caption = 'Due Date';
            Editable = false;
        }
        field(10; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; "Original Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Original Amount';
            Editable = false;
        }
        field(14; "Remaining Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Remaining Amount';
            Editable = false;
        }
        field(15; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (" ")) "Standard Text"
            ELSE
            IF (Type = CONST ("G/L Account")) "G/L Account";
        }
        field(16; Amount; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Amount';
        }
        field(17; "Interest Rate"; Decimal)
        {
            Caption = 'Interest Rate';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(18; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(19; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(20; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(21; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'VAT Amount';
            Editable = false;
        }
        field(22; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(23; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(24; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier';
            Editable = false;
        }
        field(25; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Finance Charge Memo Line,Beginning Text,Ending Text,Rounding';
            OptionMembers = "Finance Charge Memo Line","Beginning Text","Ending Text",Rounding;
        }
        field(26; "VAT Clause Code"; Code[20])
        {
            Caption = 'VAT Clause Code';
            TableRelation = "VAT Clause";
        }
        field(30; "Detailed Interest Rates Entry"; Boolean)
        {
            Caption = 'Detailed Interest Rates Entry';
        }
        field(101; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(10500; "Multiple Interest Rates Entry"; Boolean)
        {
            Caption = 'Multiple Interest Rates Entry';
            ObsoleteReason = 'Merged to W1';
            ObsoleteState = Removed;
        }
    }

    keys
    {
        key(Key1; "Finance Charge Memo No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Finance Charge Memo No.", Type, "Detailed Interest Rates Entry")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key3; "Finance Charge Memo No.", "Detailed Interest Rates Entry")
        {
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key4; "Finance Charge Memo No.", Type, "Multiple Interest Rates Entry")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            ObsoleteReason = 'Merged to W1';
            ObsoleteState = Removed;
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key5; "Finance Charge Memo No.", "Multiple Interest Rates Entry")
        {
            ObsoleteReason = 'Merged to W1';
            ObsoleteState = Removed;
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
    }

    fieldgroups
    {
    }
}

