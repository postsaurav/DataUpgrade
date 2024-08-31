table 5814 "Inventory Period"
{
    Caption = 'Inventory Period';

    fields
    {
        field(1; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Ending Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Ending Date", Name, Closed)
        {
        }
        fieldgroup(Brick; "Ending Date", Name, Closed)
        {
        }
    }
}

