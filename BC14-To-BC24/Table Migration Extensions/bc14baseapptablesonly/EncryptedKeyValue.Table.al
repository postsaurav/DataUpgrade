table 1805 "Encrypted Key/Value"
{
    Caption = 'Encrypted Key/Value';
    DataPerCompany = false;
    ObsoleteReason = 'The suggested way to store the secrets is Isolated Storage, therefore Encrypted Key/Value will be removed.';
    ObsoleteState = Pending;
    ReplicateData = false;

    fields
    {
        field(1; "Key"; Code[50])
        {
            Caption = 'Key';
        }
        field(2; Value; BLOB)
        {
            Caption = 'Value';
        }
    }

    keys
    {
        key(Key1; "Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

