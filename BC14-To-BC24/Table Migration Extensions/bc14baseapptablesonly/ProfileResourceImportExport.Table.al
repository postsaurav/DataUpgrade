table 9170 "Profile Resource Import/Export"
{
    Caption = 'Profile Resource Import/Export';
    ReplicateData = false;

    fields
    {
        field(1; "Profile ID"; Code[30])
        {
            Caption = 'Profile ID';
        }
        field(2; "Page ID"; Integer)
        {
            Caption = 'Page ID';
        }
        field(3; "Personalization ID"; Code[40])
        {
            Caption = 'Personalization ID';
        }
        field(4; "Control GUID"; Code[40])
        {
            Caption = 'Control GUID';
        }
        field(5; "Abbreviated Language Name"; Code[3])
        {
            Caption = 'Abbreviated Language Name';
        }
        field(6; Value; Text[250])
        {
            Caption = 'Value';
        }
    }

    keys
    {
        key(Key1; "Profile ID", "Page ID", "Personalization ID", "Control GUID", "Abbreviated Language Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

