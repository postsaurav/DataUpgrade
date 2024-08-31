table 7328 "Whse. Worksheet Template"
{
    Caption = 'Whse. Worksheet Template';
    ReplicateData = false;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Put-away,Pick,Movement';
            OptionMembers = "Put-away",Pick,Movement;
        }
        field(4; "Page ID"; Integer)
        {
            Caption = 'Page ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Page));
        }
        field(5; "Page Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Page),
                                                                           "Object ID" = FIELD ("Page ID")));
            Caption = 'Page Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

