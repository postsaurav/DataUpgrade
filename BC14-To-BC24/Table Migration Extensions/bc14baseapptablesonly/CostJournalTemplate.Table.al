table 1100 "Cost Journal Template"
{
    Caption = 'Cost Journal Template';
    ReplicateData = false;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(6; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(7; "Posting Report ID"; Integer)
        {
            Caption = 'Posting Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(8; "Posting Report Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Report),
                                                                           "Object ID" = FIELD ("Posting Report ID")));
            Caption = 'Posting Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name, Description)
        {
        }
    }
}

