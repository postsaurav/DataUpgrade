table 7303 "Bin Type"
{
    Caption = 'Bin Type';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; Receive; Boolean)
        {
            Caption = 'Receive';
        }
        field(11; Ship; Boolean)
        {
            Caption = 'Ship';
        }
        field(12; "Put Away"; Boolean)
        {
            Caption = 'Put Away';
        }
        field(13; Pick; Boolean)
        {
            Caption = 'Pick';
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

