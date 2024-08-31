table 1430 "Role Center Notifications"
{
    Caption = 'Role Center Notifications';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "User SID"; Guid)
        {
            Caption = 'User SID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(2; "First Session ID"; Integer)
        {
            Caption = 'First Session ID';
        }
        field(3; "Last Session ID"; Integer)
        {
            Caption = 'Last Session ID';
        }
        field(4; "Evaluation Notification State"; Option)
        {
            Caption = 'Evaluation Notification State';
            OptionCaption = 'Disabled,Enabled,Clicked';
            OptionMembers = Disabled,Enabled,Clicked;
        }
        field(5; "Buy Notification State"; Option)
        {
            Caption = 'Buy Notification State';
            OptionCaption = 'Disabled,Enabled,Clicked';
            OptionMembers = Disabled,Enabled,Clicked;
        }
    }

    keys
    {
        key(Key1; "User SID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

