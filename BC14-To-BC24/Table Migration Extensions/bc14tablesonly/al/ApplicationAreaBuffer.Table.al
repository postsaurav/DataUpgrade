table 9179 "Application Area Buffer"
{
    Caption = 'Application Area Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Application Area"; Text[80])
        {
            Caption = 'Application Area';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(3; Selected; Boolean)
        {
            Caption = 'Selected';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

