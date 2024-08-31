table 5650 "Total Value Insured"
{
    Caption = 'Total Value Insured';

    fields
    {
        field(1; "FA No."; Code[20])
        {
            Caption = 'FA No.';
            TableRelation = "Fixed Asset";
        }
        field(2; "Insurance No."; Code[20])
        {
            Caption = 'Insurance No.';
            TableRelation = Insurance;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Total Value Insured"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Value Insured';
        }
    }

    keys
    {
        key(Key1; "FA No.", "Insurance No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

