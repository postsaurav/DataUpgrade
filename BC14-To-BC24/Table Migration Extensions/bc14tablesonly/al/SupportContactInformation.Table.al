table 9165 "Support Contact Information"
{
    Caption = 'Support Contact Information';
    DataPerCompany = false;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
        field(5; Name; Text[250])
        {
            Caption = 'Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(9; Email; Text[250])
        {
            Caption = 'Email';
            DataClassification = EndUserIdentifiableInformation;
            ExtendedDatatype = EMail;
        }
        field(13; URL; Text[250])
        {
            Caption = 'URL';
            DataClassification = CustomerContent;
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

