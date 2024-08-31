table 5052 "Contact Alt. Addr. Date Range"
{
    Caption = 'Contact Alt. Addr. Date Range';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            Editable = false;
            TableRelation = Contact;
        }
        field(2; "Contact Alt. Address Code"; Code[10])
        {
            Caption = 'Contact Alt. Address Code';
            TableRelation = "Contact Alt. Address".Code WHERE ("Contact No." = FIELD ("Contact No."));
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            NotBlank = true;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Starting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

