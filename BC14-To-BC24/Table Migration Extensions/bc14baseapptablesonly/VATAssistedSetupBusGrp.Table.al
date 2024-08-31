table 1879 "VAT Assisted Setup Bus. Grp."
{
    Caption = 'VAT Assisted Setup Bus. Grp.';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(4; Default; Boolean)
        {
            Caption = 'Default';
        }
    }

    keys
    {
        key(Key1; "Code", Default)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

