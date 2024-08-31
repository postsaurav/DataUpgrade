table 1754 "Field Content Buffer"
{
    Caption = 'Field Content Buffer';

    fields
    {
        field(1; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
            Description = 'The value of the field in the database';
        }
    }

    keys
    {
        key(Key1; Value)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

