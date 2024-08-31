table 5918 "Fault Code"
{
    Caption = 'Fault Code';

    fields
    {
        field(1; "Fault Area Code"; Code[10])
        {
            Caption = 'Fault Area Code';
            TableRelation = "Fault Area".Code;
        }
        field(2; "Symptom Code"; Code[10])
        {
            Caption = 'Symptom Code';
            TableRelation = "Symptom Code".Code;
        }
        field(3; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(4; Description; Text[80])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Fault Area Code", "Symptom Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

