table 66 "Merge Duplicates Conflict"
{
    Caption = 'Merge Duplicates Conflict';
    ReplicateData = false;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
        }
        field(2; Duplicate; RecordID)
        {
            Caption = 'Duplicate';
            DataClassification = SystemMetadata;
        }
        field(3; Current; RecordID)
        {
            Caption = 'Current';
            DataClassification = SystemMetadata;
        }
        field(4; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Table Name"; Text[249])
        {
            Caption = 'Table Name';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Table ID", Duplicate)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

