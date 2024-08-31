table 7506 "Filter Item Attributes Buffer"
{
    Caption = 'Filter Item Attributes Buffer';
    ReplicateData = false;

    fields
    {
        field(1; Attribute; Text[250])
        {
            Caption = 'Attribute';
            DataClassification = SystemMetadata;
        }
        field(2; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
        field(3; ID; Guid)
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Attribute)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

