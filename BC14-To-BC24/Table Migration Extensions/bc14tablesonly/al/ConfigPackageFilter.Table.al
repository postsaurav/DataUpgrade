table 8626 "Config. Package Filter"
{
    Caption = 'Config. Package Filter';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(3; "Processing Rule No."; Integer)
        {
            Caption = 'Processing Rule No.';
        }
        field(5; "Field ID"; Integer)
        {
            Caption = 'Field ID';
        }
        field(6; "Field Name"; Text[30])
        {
            CalcFormula = Lookup (Field.FieldName WHERE (TableNo = FIELD ("Table ID"),
                                                        "No." = FIELD ("Field ID")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field ID")));
            Caption = 'Field Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Field Filter"; Text[250])
        {
            Caption = 'Field Filter';
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Processing Rule No.", "Field ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

