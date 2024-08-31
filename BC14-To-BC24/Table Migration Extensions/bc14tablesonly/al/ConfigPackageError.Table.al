table 8617 "Config. Package Error"
{
    Caption = 'Config. Package Error';
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
            Editable = false;
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; "Record No."; Integer)
        {
            Caption = 'Record No.';
            Editable = false;
            NotBlank = true;
            TableRelation = "Config. Package Record"."No." WHERE ("Table ID" = FIELD ("Table ID"));
        }
        field(4; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            Editable = false;
            NotBlank = true;
        }
        field(5; "Field Name"; Text[30])
        {
            CalcFormula = Lookup (Field.FieldName WHERE (TableNo = FIELD ("Table ID"),
                                                        "No." = FIELD ("Field ID")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Error Text"; Text[250])
        {
            Caption = 'Error Text';
            Editable = false;
        }
        field(7; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field ID")));
            Caption = 'Field Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Error Type"; Option)
        {
            Caption = 'Error Type';
            OptionCaption = ',TableRelation';
            OptionMembers = ,TableRelation;
        }
        field(9; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(10; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Record No.", "Field ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

