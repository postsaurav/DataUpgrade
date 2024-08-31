table 1022 "Job Planning Line Invoice"
{
    Caption = 'Job Planning Line Invoice';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            Editable = false;
            TableRelation = Job;
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            Editable = false;
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(3; "Job Planning Line No."; Integer)
        {
            Caption = 'Job Planning Line No.';
            Editable = false;
            TableRelation = "Job Planning Line"."Line No." WHERE ("Job No." = FIELD ("Job No."),
                                                                  "Job Task No." = FIELD ("Job Task No."));
        }
        field(4; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = ' ,Invoice,Credit Memo,Posted Invoice,Posted Credit Memo';
            OptionMembers = " ",Invoice,"Credit Memo","Posted Invoice","Posted Credit Memo";
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(7; "Quantity Transferred"; Decimal)
        {
            Caption = 'Quantity Transferred';
            Editable = false;
        }
        field(8; "Transferred Date"; Date)
        {
            Caption = 'Transferred Date';
            Editable = false;
        }
        field(9; "Invoiced Date"; Date)
        {
            Caption = 'Invoiced Date';
            Editable = false;
        }
        field(10; "Invoiced Amount (LCY)"; Decimal)
        {
            Caption = 'Invoiced Amount (LCY)';
            Editable = false;
        }
        field(11; "Invoiced Cost Amount (LCY)"; Decimal)
        {
            Caption = 'Invoiced Cost Amount (LCY)';
            Editable = false;
        }
        field(12; "Job Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Ledger Entry No.';
            Editable = false;
            TableRelation = "Job Ledger Entry";
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Job Planning Line No.", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Document No.", "Job Ledger Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

