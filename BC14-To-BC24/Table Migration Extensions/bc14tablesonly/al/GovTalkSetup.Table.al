table 10523 "GovTalk Setup"
{
    Caption = 'GovTalk Setup';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; Id; Code[10])
        {
            Caption = 'Id';
        }
        field(2; Username; Text[250])
        {
            Caption = 'Username';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; Password; Guid)
        {
            Caption = 'Password';
        }
        field(4; Endpoint; Text[250])
        {
            Caption = 'Endpoint';
        }
        field(5; "Vendor ID"; Guid)
        {
            Caption = 'Vendor ID';
        }
        field(6; "Test Mode"; Boolean)
        {
            Caption = 'Test Mode';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

