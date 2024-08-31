table 1062 "Payment Reporting Argument"
{
    Caption = 'Payment Reporting Argument';
    Permissions = TableData "Payment Reporting Argument" = rimd;

    fields
    {
        field(1; "Key"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Key';
        }
        field(3; "Document Record ID"; RecordID)
        {
            Caption = 'Document Record ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Setup Record ID"; RecordID)
        {
            Caption = 'Setup Record ID';
            DataClassification = SystemMetadata;
        }
        field(10; Logo; BLOB)
        {
            Caption = 'Logo';
        }
        field(12; "URL Caption"; Text[250])
        {
            Caption = 'URL Caption';
        }
        field(13; "Target URL"; BLOB)
        {
            Caption = 'Service URL';
        }
        field(30; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
        }
        field(35; "Payment Service ID"; Integer)
        {
            Caption = 'Payment Service ID';
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

