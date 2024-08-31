table 63 "Account Use Buffer"
{
    Caption = 'Account Use Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = SystemMetadata;
        }
        field(2; "No. of Use"; Integer)
        {
            Caption = 'No. of Use';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Account No.")
        {
            Clustered = true;
        }
        key(Key2; "No. of Use")
        {
        }
    }

    fieldgroups
    {
    }
}

