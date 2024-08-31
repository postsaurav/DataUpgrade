table 1101 "Cost Journal Line"
{
    Caption = 'Cost Journal Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Cost Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Cost Type No."; Code[20])
        {
            Caption = 'Cost Type No.';
            TableRelation = "Cost Type";
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Cost Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(11; "Bal. Cost Type No."; Code[20])
        {
            Caption = 'Bal. Cost Type No.';
            TableRelation = "Cost Type";
        }
        field(16; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(17; Balance; Decimal)
        {
            Caption = 'Balance';
            Editable = false;
        }
        field(18; "Debit Amount"; Decimal)
        {
            Caption = 'Debit Amount';
        }
        field(19; "Credit Amount"; Decimal)
        {
            Caption = 'Credit Amount';
        }
        field(20; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(21; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(22; "Bal. Cost Center Code"; Code[20])
        {
            Caption = 'Bal. Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(23; "Bal. Cost Object Code"; Code[20])
        {
            Caption = 'Bal. Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(27; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(29; "G/L Entry No."; Integer)
        {
            Caption = 'G/L Entry No.';
            Editable = false;
            TableRelation = "G/L Entry";
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(31; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(32; "Cost Entry No."; Integer)
        {
            Caption = 'Cost Entry No.';
            Editable = false;
        }
        field(33; Allocated; Boolean)
        {
            Caption = 'Allocated';
        }
        field(50; "Allocation Description"; Text[80])
        {
            Caption = 'Allocation Description';
        }
        field(51; "Allocation ID"; Code[10])
        {
            Caption = 'Allocation ID';
        }
        field(68; "Additional-Currency Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional-Currency Amount';
            Editable = false;
        }
        field(69; "Add.-Currency Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Add.-Currency Debit Amount';
            Editable = false;
        }
        field(70; "Add.-Currency Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Add.-Currency Credit Amount';
            Editable = false;
        }
        field(100; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Cost Type No.", "Cost Center Code", "Cost Object Code")
        {
        }
        key(Key3; "G/L Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

