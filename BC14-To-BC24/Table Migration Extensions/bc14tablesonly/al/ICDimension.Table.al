table 411 "IC Dimension"
{
    Caption = 'IC Dimension';
    DataCaptionFields = "Code", Name;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(4; "Map-to Dimension Code"; Code[20])
        {
            Caption = 'Map-to Dimension Code';
            TableRelation = Dimension;
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
        fieldgroup(DropDown; "Code", Name, Blocked, "Map-to Dimension Code")
        {
        }
    }
}

