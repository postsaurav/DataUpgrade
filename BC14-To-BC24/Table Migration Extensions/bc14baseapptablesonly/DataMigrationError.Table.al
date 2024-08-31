table 1797 "Data Migration Error"
{
    Caption = 'Data Migration Error';
    ReplicateData = false;

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'Id';
        }
        field(2; "Migration Type"; Text[250])
        {
            Caption = 'Migration Type';
        }
        field(3; "Destination Table ID"; Integer)
        {
            Caption = 'Destination Table ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Source Staging Table Record ID"; RecordID)
        {
            Caption = 'Source Staging Table Record ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }
        field(6; "Scheduled For Retry"; Boolean)
        {
            Caption = 'Scheduled For Retry';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
        key(Key2; "Destination Table ID", "Migration Type")
        {
        }
    }

    fieldgroups
    {
    }
}

