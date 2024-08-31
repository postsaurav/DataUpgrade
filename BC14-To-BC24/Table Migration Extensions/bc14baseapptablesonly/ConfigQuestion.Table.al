table 8612 "Config. Question"
{
    Caption = 'Config. Question';
    ReplicateData = false;

    fields
    {
        field(1; "Questionnaire Code"; Code[10])
        {
            Caption = 'Questionnaire Code';
            Editable = false;
            TableRelation = "Config. Questionnaire".Code;
        }
        field(2; "Question Area Code"; Code[10])
        {
            Caption = 'Question Area Code';
            Editable = false;
            TableRelation = "Config. Question Area".Code WHERE ("Questionnaire Code" = FIELD ("Questionnaire Code"));
        }
        field(3; "No."; Integer)
        {
            Caption = 'No.';
            MinValue = 1;
        }
        field(4; Question; Text[250])
        {
            Caption = 'Question';
        }
        field(5; "Answer Option"; Text[250])
        {
            Caption = 'Answer Option';
            Editable = false;
        }
        field(6; Answer; Text[250])
        {
            Caption = 'Answer';
        }
        field(7; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(8; "Field ID"; Integer)
        {
            Caption = 'Field ID';
        }
        field(9; Reference; Text[250])
        {
            Caption = 'Reference';
            ExtendedDatatype = URL;
        }
        field(10; "Question Origin"; Text[30])
        {
            Caption = 'Question Origin';
        }
        field(11; "Field Name"; Text[30])
        {
            CalcFormula = Lookup (Field.FieldName WHERE (TableNo = FIELD ("Table ID"),
                                                        "No." = FIELD ("Field ID")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field ID")));
            Caption = 'Field Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Questionnaire Code", "Question Area Code", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Questionnaire Code", "Question Area Code", "Field ID")
        {
        }
        key(Key3; "Table ID", "Field ID")
        {
        }
    }

    fieldgroups
    {
    }
}

