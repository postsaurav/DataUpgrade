table 856 "Cash Flow Report Selection"
{
    Caption = 'Cash Flow Report Selection';

    fields
    {
        field(2; Sequence; Code[10])
        {
            Caption = 'Sequence';
            Numeric = true;
        }
        field(3; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(4; "Report Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Report),
                                                                           "Object ID" = FIELD ("Report ID")));
            Caption = 'Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Sequence)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

