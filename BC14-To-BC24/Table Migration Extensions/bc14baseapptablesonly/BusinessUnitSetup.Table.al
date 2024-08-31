table 1827 "Business Unit Setup"
{
    Caption = 'Business Unit Setup';

    fields
    {
        field(1; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
        }
        field(2; Include; Boolean)
        {
            Caption = 'Include';
        }
        field(3; Completed; Boolean)
        {
            Caption = 'Completed';
        }
    }

    keys
    {
        key(Key1; "Company Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

