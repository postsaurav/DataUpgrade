table 1275 "Doc. Exch. Service Setup"
{
    Caption = 'Doc. Exch. Service Setup';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(4; "Sign-up URL"; Text[250])
        {
            Caption = 'Sign-up URL';
            ExtendedDatatype = URL;
        }
        field(5; "Service URL"; Text[250])
        {
            Caption = 'Service URL';
            ExtendedDatatype = URL;
        }
        field(6; "Sign-in URL"; Text[250])
        {
            Caption = 'Sign-in URL';
            ExtendedDatatype = URL;
        }
        field(7; "Consumer Key"; Guid)
        {
            Caption = 'Consumer Key';
            TableRelation = "Service Password".Key;
        }
        field(8; "Consumer Secret"; Guid)
        {
            Caption = 'Consumer Secret';
            Editable = false;
        }
        field(9; Token; Guid)
        {
            Caption = 'Token';
            Editable = false;
        }
        field(10; "Token Secret"; Guid)
        {
            Caption = 'Token Secret';
            Editable = false;
        }
        field(11; "Doc. Exch. Tenant ID"; Guid)
        {
            Caption = 'Doc. Exch. Tenant ID';
            DataClassification = OrganizationIdentifiableInformation;
            Editable = false;
        }
        field(12; "User Agent"; Text[30])
        {
            Caption = 'User Agent';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
        }
        field(20; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(21; "Log Web Requests"; Boolean)
        {
            Caption = 'Log Web Requests';
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

