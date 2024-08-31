table 5221 "Employee Posting Group"
{
    Caption = 'Employee Posting Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Payables Account"; Code[20])
        {
            Caption = 'Payables Account';
            TableRelation = "G/L Account";
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

