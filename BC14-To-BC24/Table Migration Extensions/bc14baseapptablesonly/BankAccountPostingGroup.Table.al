table 277 "Bank Account Posting Group"
{
    Caption = 'Bank Account Posting Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "G/L Bank Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
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
        fieldgroup(DropDown; "Code", "G/L Bank Account No.")
        {
        }
        fieldgroup(Brick; "Code")
        {
        }
    }
}

