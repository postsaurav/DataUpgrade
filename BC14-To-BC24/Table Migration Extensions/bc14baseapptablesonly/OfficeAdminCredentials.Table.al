table 1612 "Office Admin. Credentials"
{
    Caption = 'Office Admin. Credentials';
    Permissions = TableData "Service Password" = rimd,
                  TableData "Office Admin. Credentials" = r;
    ReplicateData = false;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; Email; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            NotBlank = true;
        }
        field(3; Password; Text[250])
        {
            Caption = 'Password';
            ExtendedDatatype = Masked;
            NotBlank = true;
        }
        field(4; Endpoint; Text[250])
        {
            Caption = 'Endpoint';
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

