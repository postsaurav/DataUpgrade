table 300 "Reminder/Fin. Charge Entry"
{
    Caption = 'Reminder/Fin. Charge Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            NotBlank = true;
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Reminder,Finance Charge Memo';
            OptionMembers = Reminder,"Finance Charge Memo";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Reminder)) "Issued Reminder Header"
            ELSE
            IF (Type = CONST ("Finance Charge Memo")) "Issued Fin. Charge Memo Header";
        }
        field(4; "Reminder Level"; Integer)
        {
            Caption = 'Reminder Level';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(7; "Interest Posted"; Boolean)
        {
            Caption = 'Interest Posted';
        }
        field(8; "Interest Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Interest Amount';
        }
        field(9; "Customer Entry No."; Integer)
        {
            Caption = 'Customer Entry No.';
            TableRelation = "Cust. Ledger Entry";
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
        field(12; "Remaining Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amount';
        }
        field(13; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(14; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(15; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Customer No.")
        {
        }
        key(Key3; "Customer Entry No.", Type)
        {
        }
        key(Key4; Type, "No.")
        {
        }
        key(Key5; "Document No.", "Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

