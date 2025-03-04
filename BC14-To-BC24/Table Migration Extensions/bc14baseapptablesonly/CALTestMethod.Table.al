table 130404 "CAL Test Method"
{
    Caption = 'CAL Test Method';
    ReplicateData = false;

    fields
    {
        field(1; "Test Codeunit ID"; Integer)
        {
            Caption = 'Test Codeunit ID';
        }
        field(2; "Test Method Name"; Text[128])
        {
            Caption = 'Test Method Name';
        }
    }

    keys
    {
        key(Key1; "Test Codeunit ID", "Test Method Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

