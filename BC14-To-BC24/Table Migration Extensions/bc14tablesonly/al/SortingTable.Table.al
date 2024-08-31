table 1051 "Sorting Table"
{
    Caption = 'Sorting Table';

    fields
    {
        field(1; "Integer"; Integer)
        {
            Caption = 'Integer';
        }
        field(2; Decimal; Decimal)
        {
            Caption = 'Decimal';
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
        }
    }

    keys
    {
        key(Key1; "Integer")
        {
            Clustered = true;
        }
        key(Key2; Decimal)
        {
        }
        key(Key3; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

