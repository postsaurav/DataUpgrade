table 1307 "O365 Device Setup Instructions"
{
    Caption = 'O365 Device Setup Instructions';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "Key"; Code[10])
        {
            Caption = 'Key';
        }
        field(10; "Setup URL"; Text[250])
        {
            Caption = 'Setup URL';
            ExtendedDatatype = URL;
            ObsoleteReason = 'This field is obsolete after refactoring.';
            ObsoleteState = Removed;
        }
        field(11; "QR Code"; BLOB)
        {
            Caption = 'QR Code';
            SubType = Bitmap;
        }
    }

    keys
    {
        key(Key1; "Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

