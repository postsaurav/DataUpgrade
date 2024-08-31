table 1432 "Net Promoter Score Setup"
{
    Caption = 'Net Promoter Score Setup';
    DataPerCompany = false;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "API URL"; BLOB)
        {
            Caption = 'API URL';
            DataClassification = SystemMetadata;
        }
        field(3; "Expire Time"; DateTime)
        {
            Caption = 'Expire Time';
            DataClassification = SystemMetadata;
        }
        field(4; "Time Between Requests"; Integer)
        {
            Caption = 'Time Between Requests';
            ObsoleteReason = 'This field is not needed and it is not used anymore.';
            ObsoleteState = Removed;
        }
        field(5; "Request Timeout"; Integer)
        {
            Caption = 'Request Timeout';
            DataClassification = SystemMetadata;
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

