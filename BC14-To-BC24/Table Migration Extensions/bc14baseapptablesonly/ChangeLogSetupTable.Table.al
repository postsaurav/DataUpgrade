table 403 "Change Log Setup (Table)"
{
    Caption = 'Change Log Setup (Table)';
    ReplicateData = false;

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(2; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table No.")));
            Caption = 'Table Caption';
            FieldClass = FlowField;
        }
        field(3; "Log Insertion"; Option)
        {
            Caption = 'Log Insertion';
            OptionCaption = ' ,Some Fields,All Fields';
            OptionMembers = " ","Some Fields","All Fields";
        }
        field(4; "Log Modification"; Option)
        {
            Caption = 'Log Modification';
            OptionCaption = ' ,Some Fields,All Fields';
            OptionMembers = " ","Some Fields","All Fields";
        }
        field(5; "Log Deletion"; Option)
        {
            Caption = 'Log Deletion';
            OptionCaption = ' ,Some Fields,All Fields';
            OptionMembers = " ","Some Fields","All Fields";
        }
    }

    keys
    {
        key(Key1; "Table No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

