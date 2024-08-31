table 296 "Reminder Line"
{
    Caption = 'Reminder Line';

    fields
    {
        field(1; "Reminder No."; Code[20])
        {
            Caption = 'Reminder No.';
            TableRelation = "Reminder Header";
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
            TableRelation = "Reminder Line"."Line No." WHERE ("Reminder No." = FIELD ("Reminder No."));
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Customer Ledger Entry,Line Fee';
            OptionMembers = " ","G/L Account","Customer Ledger Entry","Line Fee";
        }
        field(5; "Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Entry No.';
            TableRelation = "Cust. Ledger Entry";
        }
        field(6; "No. of Reminders"; Integer)
        {
            Caption = 'No. of Reminders';
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
            IF (Type = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST ("Line Fee")) "G/L Account";
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
            OptionCaption = 'Reminder Line,Not Due,Beginning Text,Ending Text,Rounding,On Hold,Additional Fee,Line Fee';
            OptionMembers = "Reminder Line","Not Due","Beginning Text","Ending Text",Rounding,"On Hold","Additional Fee","Line Fee";
        }
        field(26; "VAT Clause Code"; Code[20])
        {
            Caption = 'VAT Clause Code';
            TableRelation = "VAT Clause";
        }
        field(27; "Applies-to Document Type"; Option)
        {
            Caption = 'Applies-to Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(28; "Applies-to Document No."; Code[20])
        {
            Caption = 'Applies-to Document No.';
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
        key(Key1; "Reminder No.", "Line No.")
        {
            Clustered = true;
            MaintainSIFTIndex = false;
        }
        key(Key2; "Reminder No.", Type, "Line Type", "Detailed Interest Rates Entry")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key3; "Reminder No.", "Detailed Interest Rates Entry")
        {
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key4; "Reminder No.", Type, "Multiple Interest Rates Entry", "Line Type")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            ObsoleteReason = 'Merged to W1';
            ObsoleteState = Removed;
            SumIndexFields = Amount, "VAT Amount", "Remaining Amount";
        }
        key(Key5; "Reminder No.", "Multiple Interest Rates Entry")
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

