table 289 "Payment Method"
{
    Caption = 'Payment Method';
    DataCaptionFields = "Code", Description;

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
        field(3; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Bank Account';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(4; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account";
        }
        field(6; "Direct Debit"; Boolean)
        {
            Caption = 'Direct Debit';
        }
        field(7; "Direct Debit Pmt. Terms Code"; Code[10])
        {
            Caption = 'Direct Debit Pmt. Terms Code';
            TableRelation = "Payment Terms";
        }
        field(8; "Pmt. Export Line Definition"; Code[20])
        {
            Caption = 'Pmt. Export Line Definition';
        }
        field(9; "Bank Data Conversion Pmt. Type"; Text[50])
        {
            Caption = 'Bank Data Conversion Pmt. Type';
            ObsoleteReason = 'Changed to AMC Banking 365 Fundamentals Extension';
            ObsoleteState = Pending;
            TableRelation = "Bank Data Conversion Pmt. Type";
        }
        field(10; "Use for Invoicing"; Boolean)
        {
            Caption = 'Use for Invoicing';
        }
        field(11; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
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
        fieldgroup(Brick; "Code", Description)
        {
        }
    }
}

