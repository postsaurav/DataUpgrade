table 132 "Incoming Document Approver"
{
    Caption = 'Incoming Document Approver';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Guid)
        {
            Caption = 'User ID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

