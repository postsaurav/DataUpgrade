table 5113 "Contact Dupl. Details Buffer"
{
    Caption = 'Contact Dupl. Details Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            DataClassification = SystemMetadata;
        }
        field(3; "Field Value"; Text[250])
        {
            Caption = 'Field Value';
            DataClassification = SystemMetadata;
        }
        field(4; "Duplicate Field Value"; Text[250])
        {
            Caption = 'Duplicate Field Value';
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

