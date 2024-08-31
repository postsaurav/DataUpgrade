table 7710 "ADCS User"
{
    Caption = 'ADCS User';

    fields
    {
        field(1; Name; Code[50])
        {
            Caption = 'Name';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
        }
        field(2; Password; Text[250])
        {
            Caption = 'Password';
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

