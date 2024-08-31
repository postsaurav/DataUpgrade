table 8451 "Intrastat Checklist Setup"
{
    Caption = 'Intrastat Checklist Setup';

    fields
    {
        field(1; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(2; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
        }
    }

    keys
    {
        key(Key1; "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

