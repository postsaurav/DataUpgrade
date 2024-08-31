table 8618 "Config. Template Header"
{
    Caption = 'Config. Template Header';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(4; "Table Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Table),
                                                                        "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Used In Hierarchy"; Boolean)
        {
            CalcFormula = Exist ("Config. Template Line" WHERE ("Data Template Code" = FIELD (Code),
                                                               Type = CONST (Template)));
            Caption = 'Used In Hierarchy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Enabled; Boolean)
        {
            Caption = 'Enabled';
            InitValue = true;
        }
        field(8; "Instance No. Series"; Code[20])
        {
            Caption = 'Instance No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Table ID")
        {
        }
    }

    fieldgroups
    {
    }
}

