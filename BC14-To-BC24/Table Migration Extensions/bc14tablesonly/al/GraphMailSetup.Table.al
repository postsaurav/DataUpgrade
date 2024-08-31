table 407 "Graph Mail Setup"
{
    Caption = 'Graph Mail Setup';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Refresh Code"; BLOB)
        {
            Caption = 'Refresh Code';
        }
        field(3; "Expires On"; DateTime)
        {
            Caption = 'Expires On';
        }
        field(4; "Sender Email"; Text[250])
        {
            Caption = 'Sender Email';
        }
        field(5; "Sender Name"; Text[250])
        {
            Caption = 'Sender Name';
        }
        field(6; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(7; "Sender AAD ID"; Text[80])
        {
            Caption = 'Sender AAD ID';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

