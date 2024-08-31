table 1750 "Fields Sync Status"
{
    Caption = 'Fields Sync Status';

    fields
    {
        field(1; ID; Code[2])
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
        field(2; "Last Sync Date Time"; DateTime)
        {
            Caption = 'Last Sync Date Time';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

