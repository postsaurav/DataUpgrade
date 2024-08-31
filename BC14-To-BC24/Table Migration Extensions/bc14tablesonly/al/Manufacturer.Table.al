table 5720 Manufacturer
{
    Caption = 'Manufacturer';

    fields
    {
        field(10; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
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
    }
}

