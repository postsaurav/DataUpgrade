table 5059 "Web Source"
{
    Caption = 'Web Source';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; URL; Text[250])
        {
            Caption = 'URL';
        }
        field(4; Comment; Boolean)
        {
            CalcFormula = Exist ("Rlshp. Mgt. Comment Line" WHERE ("Table Name" = CONST ("Web Source"),
                                                                  "No." = FIELD (Code),
                                                                  "Sub No." = CONST (0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

