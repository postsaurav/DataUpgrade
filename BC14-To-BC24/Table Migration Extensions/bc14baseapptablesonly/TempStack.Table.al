table 9160 TempStack
{
    Caption = 'TempStack';

    fields
    {
        field(1; StackOrder; Integer)
        {
            Caption = 'StackOrder';
        }
        field(2; Value; RecordID)
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; StackOrder)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

