table 248 "VAT Reg. No. Srv Config"
{
    Caption = 'VAT Reg. No. Srv Config';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(3; "Service Endpoint"; Text[250])
        {
            Caption = 'Service Endpoint';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

