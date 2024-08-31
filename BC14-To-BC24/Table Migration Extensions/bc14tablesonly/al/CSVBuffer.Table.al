table 1234 "CSV Buffer"
{
    Caption = 'CSV Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = SystemMetadata;
        }
        field(3; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

