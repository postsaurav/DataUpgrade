table 355 "Dimension Set ID Filter Line"
{
    Caption = 'Dimension Set ID Filter Line';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Dimension Value Filter Part"; Text[250])
        {
            Caption = 'Dimension Value Filter Part';
        }
    }

    keys
    {
        key(Key1; "Code", "Dimension Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

