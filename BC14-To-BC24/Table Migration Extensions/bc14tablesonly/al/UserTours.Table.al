table 1314 "User Tours"
{
    Caption = 'User Tours';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(3; "Tour ID"; Integer)
        {
            Caption = 'Tour ID';
        }
        field(4; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'None,Started,Completed,Expired';
            OptionMembers = "None",Started,Completed,Expired;
        }
        field(5; Version; Text[163])
        {
            Caption = 'Version';
        }
    }

    keys
    {
        key(Key1; "User ID", "Tour ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

