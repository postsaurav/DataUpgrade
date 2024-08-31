table 6300 "Azure AD App Setup"
{
    Caption = 'Azure AD App Setup';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "App ID"; Guid)
        {
            Caption = 'App ID';
            NotBlank = true;
        }
        field(2; "Secret Key"; BLOB)
        {
            Caption = 'Secret Key';
        }
        field(3; "Primary Key"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Primary Key';
        }
        field(4; "Redirect URL"; Text[150])
        {
            Caption = 'Redirect URL';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

