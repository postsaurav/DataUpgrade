table 1306 "User Preference"
{
    Caption = 'User Preference';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(2; "Instruction Code"; Code[50])
        {
            Caption = 'Instruction Code';
        }
        field(3; "User Selection"; BLOB)
        {
            Caption = 'User Selection';
        }
    }

    keys
    {
        key(Key1; "User ID", "Instruction Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

