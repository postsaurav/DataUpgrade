table 1444 "Headline RC Relationship Mgt."
{
    Caption = 'Headline RC Relationship Mgt.';

    fields
    {
        field(1; "Key"; Code[10])
        {
            Caption = 'Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Workdate for computations"; Date)
        {
            Caption = 'Workdate for computations';
            DataClassification = SystemMetadata;
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

