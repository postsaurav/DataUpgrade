table 1445 "Headline RC Administrator"
{
    Caption = 'Headline RC Administrator';

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

