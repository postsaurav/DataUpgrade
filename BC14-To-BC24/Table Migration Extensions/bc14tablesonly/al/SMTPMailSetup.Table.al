table 409 "SMTP Mail Setup"
{
    Caption = 'SMTP Mail Setup';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "SMTP Server"; Text[250])
        {
            Caption = 'SMTP Server';
        }
        field(3; Authentication; Option)
        {
            Caption = 'Authentication';
            OptionCaption = 'Anonymous,NTLM,Basic';
            OptionMembers = Anonymous,NTLM,Basic;
        }
        field(4; "User ID"; Text[250])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(6; "SMTP Server Port"; Integer)
        {
            Caption = 'SMTP Server Port';
            InitValue = 25;
        }
        field(7; "Secure Connection"; Boolean)
        {
            Caption = 'Secure Connection';
            InitValue = false;
        }
        field(8; "Password Key"; Guid)
        {
            Caption = 'Password Key';
        }
        field(9; "Send As"; Text[250])
        {
            Caption = 'Send As';
        }
        field(10; "Allow Sender Substitution"; Boolean)
        {
            Caption = 'Allow Sender Substitution';
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

