table 480 "Dimension Set Entry"
{
    Caption = 'Dimension Set Entry';
    Permissions = TableData "Dimension Set Entry" = ri,
                  TableData "Dimension Set Tree Node" = rim;

    fields
    {
        field(1; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
        }
        field(2; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(3; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(4; "Dimension Value ID"; Integer)
        {
            Caption = 'Dimension Value ID';
        }
        field(5; "Dimension Name"; Text[30])
        {
            CalcFormula = Lookup (Dimension.Name WHERE (Code = FIELD ("Dimension Code")));
            Caption = 'Dimension Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Dimension Value Name"; Text[50])
        {
            CalcFormula = Lookup ("Dimension Value".Name WHERE ("Dimension Code" = FIELD ("Dimension Code"),
                                                               Code = FIELD ("Dimension Value Code")));
            Caption = 'Dimension Value Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Dimension Set ID", "Dimension Code")
        {
            Clustered = true;
        }
        key(Key2; "Dimension Value ID")
        {
        }
        key(Key3; "Dimension Code", "Dimension Value Code", "Dimension Set ID")
        {
        }
    }

    fieldgroups
    {
    }
}

