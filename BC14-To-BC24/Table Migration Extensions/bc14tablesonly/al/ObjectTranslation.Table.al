table 377 "Object Translation"
{
    Caption = 'Object Translation';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionCaption = ' ,Table,Form,Report,,Codeunit,XMLPort,MenuSuite,Page';
            OptionMembers = " ","Table",Form,"Report",,"Codeunit","XMLPort",MenuSuite,"Page";
        }
        field(2; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            NotBlank = true;
            TableRelation = IF ("Object Type" = FILTER (> " ")) AllObj."Object ID" WHERE ("Object Type" = FIELD ("Object Type"));
        }
        field(3; "Language ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Language ID';
            NotBlank = true;
            TableRelation = "Windows Language";
        }
        field(4; "Language Name"; Text[80])
        {
            CalcFormula = Lookup ("Windows Language".Name WHERE ("Language ID" = FIELD ("Language ID")));
            Caption = 'Language Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; "Object Name"; Text[30])
        {
            CalcFormula = Lookup (Object.Name WHERE (Type = FIELD ("Object Type"),
                                                    ID = FIELD ("Object ID")));
            Caption = 'Object Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Object Type", "Object ID", "Language ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

