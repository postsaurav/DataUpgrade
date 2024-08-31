table 1446 "Headline RC Team Member"
{
    Caption = 'Headline RC Team Member';

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

