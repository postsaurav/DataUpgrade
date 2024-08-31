table 8611 "Config. Question Area"
{
    Caption = 'Config. Question Area';
    ReplicateData = false;

    fields
    {
        field(1; "Questionnaire Code"; Code[10])
        {
            Caption = 'Questionnaire Code';
            Editable = false;
            NotBlank = true;
            TableRelation = "Config. Questionnaire";
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = FILTER (Table));
        }
        field(5; "Table Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Table),
                                                                        "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No. of Questions"; Integer)
        {
            CalcFormula = Count ("Config. Question" WHERE ("Questionnaire Code" = FIELD ("Questionnaire Code"),
                                                          "Question Area Code" = FIELD (Code)));
            Caption = 'No. of Questions';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Questionnaire Code", "Code")
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

