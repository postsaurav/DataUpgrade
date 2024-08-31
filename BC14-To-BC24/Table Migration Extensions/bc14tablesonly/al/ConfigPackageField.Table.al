table 8616 "Config. Package Field"
{
    Caption = 'Config. Package Field';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            NotBlank = true;
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            NotBlank = true;
            TableRelation = IF (Dimension = CONST (false)) Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(4; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
        }
        field(5; "Field Caption"; Text[250])
        {
            Caption = 'Field Caption';
        }
        field(6; "Validate Field"; Boolean)
        {
            Caption = 'Validate Field';
        }
        field(7; "Include Field"; Boolean)
        {
            Caption = 'Include Field';
        }
        field(8; "Localize Field"; Boolean)
        {
            Caption = 'Localize Field';
        }
        field(9; "Relation Table ID"; Integer)
        {
            Caption = 'Relation Table ID';
            Editable = false;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(10; "Relation Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Table),
                                                                        "Object ID" = FIELD ("Relation Table ID")));
            Caption = 'Relation Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; Dimension; Boolean)
        {
            Caption = 'Dimension';
            Editable = false;
        }
        field(12; "Primary Key"; Boolean)
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(13; "Processing Order"; Integer)
        {
            Caption = 'Processing Order';
        }
        field(14; "Create Missing Codes"; Boolean)
        {
            Caption = 'Create Missing Codes';
        }
        field(15; "Mapping Exists"; Boolean)
        {
            CalcFormula = Exist ("Config. Field Mapping" WHERE ("Package Code" = FIELD ("Package Code"),
                                                               "Table ID" = FIELD ("Table ID"),
                                                               "Field ID" = FIELD ("Field ID")));
            Caption = 'Mapping Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; AutoIncrement; Boolean)
        {
            Caption = 'AutoIncrement';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Field ID")
        {
            Clustered = true;
        }
        key(Key2; "Package Code", "Table ID", "Include Field")
        {
        }
        key(Key3; "Package Code", "Table ID", "Validate Field")
        {
        }
        key(Key4; "Package Code", "Table ID", "Processing Order")
        {
        }
    }

    fieldgroups
    {
    }
}

