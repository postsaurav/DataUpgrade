table 7355 "Report Selection Warehouse"
{
    Caption = 'Report Selection Warehouse';

    fields
    {
        field(1; Usage; Option)
        {
            Caption = 'Usage';
            OptionCaption = 'Put-away,Pick,Movement,Invt. Put-away,Invt. Pick,Invt. Movement,Receipt,Shipment,Posted Receipt,Posted Shipment';
            OptionMembers = "Put-away",Pick,Movement,"Invt. Put-away","Invt. Pick","Invt. Movement",Receipt,Shipment,"Posted Receipt","Posted Shipment";
        }
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
        key(Key1; Usage, Sequence)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

