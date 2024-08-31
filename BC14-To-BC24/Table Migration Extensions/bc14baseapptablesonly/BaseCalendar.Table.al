table 7600 "Base Calendar"
{
    Caption = 'Base Calendar';
    DataCaptionFields = "Code", Name;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; "Customized Changes Exist"; Boolean)
        {
            CalcFormula = Exist ("Customized Calendar Change" WHERE ("Base Calendar Code" = FIELD (Code)));
            Caption = 'Customized Changes Exist';
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

