table 5502 "Tax Rate Buffer"
{
    Caption = 'Tax Rate Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Tax Area ID"; Guid)
        {
            Caption = 'Tax Area ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Tax Group ID"; Guid)
        {
            Caption = 'Tax Group ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(3; "Tax Rate"; Decimal)
        {
            Caption = 'Tax Rate';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Tax Area ID", "Tax Group ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

