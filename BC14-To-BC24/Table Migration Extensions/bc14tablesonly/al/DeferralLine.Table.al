table 1702 "Deferral Line"
{
    Caption = 'Deferral Line';

    fields
    {
        field(1; "Deferral Doc. Type"; Option)
        {
            Caption = 'Deferral Doc. Type';
            OptionCaption = 'Purchase,Sales,G/L';
            OptionMembers = Purchase,Sales,"G/L";
            TableRelation = "Deferral Header"."Deferral Doc. Type";
        }
        field(2; "Gen. Jnl. Template Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Template Name';
            TableRelation = "Deferral Header"."Gen. Jnl. Template Name";
        }
        field(3; "Gen. Jnl. Batch Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Batch Name';
            TableRelation = "Deferral Header"."Gen. Jnl. Batch Name";
        }
        field(4; "Document Type"; Integer)
        {
            Caption = 'Document Type';
            TableRelation = "Deferral Header"."Document Type";
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Deferral Header"."Document No.";
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
            TableRelation = "Deferral Header"."Line No.";
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(10; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
    }

    keys
    {
        key(Key1; "Deferral Doc. Type", "Gen. Jnl. Template Name", "Gen. Jnl. Batch Name", "Document Type", "Document No.", "Line No.", "Posting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

