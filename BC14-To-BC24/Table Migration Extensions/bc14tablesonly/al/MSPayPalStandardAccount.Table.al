table 7860 "MS- PayPal Standard Account"
{
    Caption = 'MS- PayPal Standard Account';
    ObsoleteReason = 'This table is no longer used by any user.';
    ObsoleteState = Removed;
    Permissions = TableData "Webhook Subscription" = rimd;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Primary Key';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(4; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(5; "Always Include on Documents"; Boolean)
        {
            Caption = 'Always Include on Documents';
        }
        field(8; "Terms of Service"; Text[250])
        {
            Caption = 'Terms of Service';
            ExtendedDatatype = URL;
        }
        field(10; "Account ID"; Text[250])
        {
            Caption = 'Account ID';
        }
        field(12; "Target URL"; BLOB)
        {
            Caption = 'Target URL';
            SubType = Bitmap;
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

