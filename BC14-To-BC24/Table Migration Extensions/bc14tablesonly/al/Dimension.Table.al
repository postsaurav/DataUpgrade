table 348 Dimension
{
    Caption = 'Dimension';
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
        field(3; "Code Caption"; Text[80])
        {
            Caption = 'Code Caption';
        }
        field(4; "Filter Caption"; Text[80])
        {
            Caption = 'Filter Caption';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; "Consolidation Code"; Code[20])
        {
            AccessByPermission = TableData "Business Unit" = R;
            Caption = 'Consolidation Code';
        }
        field(8; "Map-to IC Dimension Code"; Code[20])
        {
            Caption = 'Map-to IC Dimension Code';
            TableRelation = "IC Dimension";
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
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
        fieldgroup(DropDown; "Code", Name, Blocked)
        {
        }
        fieldgroup(Brick; "Code", Name)
        {
        }
    }
}

