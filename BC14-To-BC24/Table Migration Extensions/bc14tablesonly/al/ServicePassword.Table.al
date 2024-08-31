table 1261 "Service Password"
{
    Caption = 'Service Password';
    ObsoleteReason = 'The suggested way to store the secrets is Isolated Storage, therefore Service Password will be removed.';
    ObsoleteState = Pending;
    ReplicateData = false;

    fields
    {
        field(1; "Key"; Guid)
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

