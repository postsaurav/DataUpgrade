table 5103 "Interaction Tmpl. Language"
{
    Caption = 'Interaction Tmpl. Language';

    fields
    {
        field(1; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            Editable = false;
            TableRelation = "Interaction Template";
        }
        field(2; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
        }
        field(5; "Custom Layout Code"; Code[20])
        {
            Caption = 'Custom Layout Code';
            TableRelation = "Custom Report Layout" WHERE ("Report ID" = CONST (5084));
        }
        field(6; "Custom Layout Description"; Text[250])
        {
            CalcFormula = Lookup ("Custom Report Layout".Description WHERE (Code = FIELD ("Custom Layout Code")));
            Caption = 'Custom Layout Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Interaction Template Code", "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

