table 5998 "Standard Service Item Gr. Code"
{
    Caption = 'Standard Service Item Gr. Code';
    DataCaptionFields = "Service Item Group Code";

    fields
    {
        field(1; "Service Item Group Code"; Code[10])
        {
            Caption = 'Service Item Group Code';
            TableRelation = "Service Item Group";
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Standard Service Code";
        }
        field(3; Description; Text[100])
        {
            CalcFormula = Lookup ("Standard Service Code".Description WHERE (Code = FIELD (Code)));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Service Item Group Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

