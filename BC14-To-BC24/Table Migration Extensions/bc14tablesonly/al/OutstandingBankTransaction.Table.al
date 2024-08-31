table 1284 "Outstanding Bank Transaction"
{
    Caption = 'Outstanding Bank Transaction';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(5; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Bank Account Ledger Entry,Check Ledger Entry';
            OptionMembers = "Bank Account Ledger Entry","Check Ledger Entry";
        }
        field(9; Applied; Boolean)
        {
            Caption = 'Applied';
        }
        field(10; "Statement Type"; Option)
        {
            Caption = 'Statement Type';
            OptionCaption = 'Bank Reconciliation,Payment Application';
            OptionMembers = "Bank Reconciliation","Payment Application";
        }
        field(11; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; Type)
        {
        }
    }

    fieldgroups
    {
    }
}

