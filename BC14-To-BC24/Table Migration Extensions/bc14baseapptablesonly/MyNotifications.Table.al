table 1518 "My Notifications"
{
    Caption = 'My Notifications';

    fields
    {
        field(1; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            NotBlank = true;
        }
        field(2; "Notification Id"; Guid)
        {
            Caption = 'Notification Id';
            Editable = false;
            NotBlank = true;
        }
        field(3; "Apply to Table Id"; Integer)
        {
            Caption = 'Apply to Table Id';
            Editable = false;
        }
        field(4; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(5; "Apply to Table Filter"; BLOB)
        {
            Caption = 'Filter';
        }
        field(6; Name; Text[128])
        {
            Caption = 'Notification';
            Editable = false;
            NotBlank = true;
        }
        field(7; Description; BLOB)
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "User Id", "Notification Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

