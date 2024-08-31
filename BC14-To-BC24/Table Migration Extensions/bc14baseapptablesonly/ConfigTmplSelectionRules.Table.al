table 8620 "Config. Tmpl. Selection Rules"
{
    Caption = 'Config. Tmpl. Selection Rules';
    ReplicateData = false;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(2; "Template Code"; Code[10])
        {
            Caption = 'Template Code';
            NotBlank = true;
            TableRelation = "Config. Template Header".Code WHERE ("Table ID" = FIELD ("Table ID"));
        }
        field(5; "Selection Criteria"; BLOB)
        {
            Caption = 'Selection Criteria';
        }
        field(6; Description; Text[250])
        {
            CalcFormula = Lookup ("Config. Template Header".Description WHERE (Code = FIELD ("Template Code"),
                                                                              "Table ID" = FIELD ("Table ID")));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Order"; Integer)
        {
            Caption = 'Order';
        }
        field(11; "Page ID"; Integer)
        {
            Caption = 'Page ID';
        }
    }

    keys
    {
        key(Key1; "Table ID", "Template Code", "Page ID")
        {
            Clustered = true;
        }
        key(Key2; "Order")
        {
        }
    }

    fieldgroups
    {
    }
}

