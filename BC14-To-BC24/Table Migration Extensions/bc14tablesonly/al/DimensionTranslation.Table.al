table 388 "Dimension Translation"
{
    Caption = 'Dimension Translation';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(2; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            NotBlank = true;
            TableRelation = "Windows Language";
        }
        field(3; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(4; "Code Caption"; Text[80])
        {
            Caption = 'Code Caption';
        }
        field(5; "Filter Caption"; Text[80])
        {
            Caption = 'Filter Caption';
        }
        field(6; "Language Name"; Text[80])
        {
            CalcFormula = Lookup ("Windows Language".Name WHERE ("Language ID" = FIELD ("Language ID")));
            Caption = 'Language Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code", "Language ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

