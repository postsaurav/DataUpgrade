table 6704 "Booking Mailbox"
{
    Caption = 'Booking Mailbox';
    ExternalName = 'BookingMailbox';
    TableType = Exchange;

    fields
    {
        field(1; SmtpAddress; Text[80])
        {
            Caption = 'SmtpAddress';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; "Display Name"; Text[250])
        {
            Caption = 'Display Name';
            ExternalName = 'DisplayName';
        }
    }

    keys
    {
        key(Key1; SmtpAddress)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

