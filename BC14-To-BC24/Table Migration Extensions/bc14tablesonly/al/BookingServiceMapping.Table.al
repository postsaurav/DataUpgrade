table 6706 "Booking Service Mapping"
{
    Caption = 'Booking Service Mapping';

    fields
    {
        field(1; "Service ID"; Text[50])
        {
            Caption = 'Service ID';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(3; "Booking Mailbox"; Text[80])
        {
            Caption = 'Booking Mailbox';
        }
    }

    keys
    {
        key(Key1; "Service ID")
        {
            Clustered = true;
        }
        key(Key2; "Booking Mailbox", "Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

