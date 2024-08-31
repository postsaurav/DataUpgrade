table 5973 "Service Contract Account Group"
{
    Caption = 'Service Contract Account Group';

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
        field(3; "Non-Prepaid Contract Acc."; Code[20])
        {
            Caption = 'Non-Prepaid Contract Acc.';
            TableRelation = "G/L Account"."No.";
        }
        field(4; "Prepaid Contract Acc."; Code[20])
        {
            Caption = 'Prepaid Contract Acc.';
            TableRelation = "G/L Account"."No.";
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

