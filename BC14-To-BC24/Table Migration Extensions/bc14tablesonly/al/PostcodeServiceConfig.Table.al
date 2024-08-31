table 9091 "Postcode Service Config"
{
    Caption = 'Postcode Service Config';
    Permissions = TableData "Service Password" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; ServiceKey; Text[250])
        {
            Caption = 'ServiceKey';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

