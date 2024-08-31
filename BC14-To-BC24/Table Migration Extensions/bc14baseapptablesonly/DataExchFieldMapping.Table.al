table 1225 "Data Exch. Field Mapping"
{
    Caption = 'Data Exch. Field Mapping';

    fields
    {
        field(1; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Def".Code;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = "Data Exch. Mapping"."Table ID";
        }
        field(3; "Column No."; Integer)
        {
            Caption = 'Column No.';
            NotBlank = true;
            TableRelation = "Data Exch. Column Def"."Column No." WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"),
                                                                        "Data Exch. Line Def Code" = FIELD ("Data Exch. Line Def Code"));
        }
        field(4; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(5; Optional; Boolean)
        {
            Caption = 'Optional';
        }
        field(6; "Use Default Value"; Boolean)
        {
            Caption = 'Use Default Value';
        }
        field(7; "Default Value"; Text[250])
        {
            Caption = 'Default Value';
        }
        field(8; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Line Def".Code WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"));
        }
        field(9; Multiplier; Decimal)
        {
            Caption = 'Multiplier';
            InitValue = 1;
        }
        field(10; "Target Table ID"; Integer)
        {
            Caption = 'Target Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(11; "Target Field ID"; Integer)
        {
            Caption = 'Target Field ID';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Target Table ID"));
        }
        field(12; "Target Table Caption"; Text[250])
        {
            CalcFormula = Lookup ("Table Metadata".Caption WHERE (ID = FIELD ("Target Table ID")));
            Caption = 'Target Table Caption';
            FieldClass = FlowField;
        }
        field(13; "Target Field Caption"; Text[30])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Target Table ID"),
                                                              "No." = FIELD ("Target Field ID")));
            Caption = 'Target Field Caption';
            FieldClass = FlowField;
        }
        field(20; "Transformation Rule"; Code[20])
        {
            Caption = 'Transformation Rule';
            TableRelation = "Transformation Rule";
        }
        field(21; "Overwrite Value"; Boolean)
        {
            Caption = 'Overwrite Value';
        }
    }

    keys
    {
        key(Key1; "Data Exch. Def Code", "Data Exch. Line Def Code", "Table ID", "Column No.", "Field ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

