table 8619 "Config. Template Line"
{
    Caption = 'Config. Template Line';
    ReplicateData = false;

    fields
    {
        field(1; "Data Template Code"; Code[10])
        {
            Caption = 'Data Template Code';
            Editable = false;
            TableRelation = "Config. Template Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            InitValue = "Field";
            OptionCaption = 'Field,Template,Related Template';
            OptionMembers = "Field",Template,"Related Template";
        }
        field(4; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            TableRelation = IF (Type = CONST (Field)) Field."No." WHERE (TableNo = FIELD ("Table ID"),
                                                                      Class = CONST (Normal));
        }
        field(5; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            Editable = false;
            FieldClass = Normal;
        }
        field(6; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(7; "Table Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = FILTER (Table),
                                                                        "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Template Code"; Code[10])
        {
            Caption = 'Template Code';
            TableRelation = "Config. Template Header";
        }
        field(9; "Template Description"; Text[50])
        {
            CalcFormula = Lookup ("Config. Template Header".Description WHERE (Code = FIELD ("Data Template Code")));
            Caption = 'Template Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
        }
        field(11; Reference; Text[250])
        {
            Caption = 'Reference';
            ExtendedDatatype = URL;
        }
        field(12; "Default Value"; Text[250])
        {
            Caption = 'Default Value';
        }
        field(13; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = FILTER (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field ID")));
            Caption = 'Field Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Skip Relation Check"; Boolean)
        {
            Caption = 'Skip Relation Check';
        }
        field(16; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            InitValue = 0;
        }
    }

    keys
    {
        key(Key1; "Data Template Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Data Template Code", Type)
        {
        }
    }

    fieldgroups
    {
    }
}

