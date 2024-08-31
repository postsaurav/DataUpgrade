table 6707 "Booking Item"
{
    Caption = 'Booking Item';
    ExternalName = 'appointments';
    TableType = MicrosoftGraph;

    fields
    {
        field(1; Id; Text[250])
        {
            Caption = 'Id';
            ExternalName = 'id';
            ExternalType = 'Edm.String';
        }
        field(2; "Start Date"; BLOB)
        {
            Caption = 'Start Date';
            ExternalName = 'start';
            ExternalType = 'microsoft.bookings.api.dateTimeTimeZone';
            SubType = Json;
        }
        field(3; "End Date"; BLOB)
        {
            Caption = 'End Date';
            ExternalName = 'end';
            ExternalType = 'microsoft.bookings.api.dateTimeTimeZone';
            SubType = Json;
        }
        field(4; Duration; Duration)
        {
            Caption = 'Duration';
            ExternalName = 'duration';
            ExternalType = 'Edm.Duration';
        }
        field(5; Notes; Text[250])
        {
            Caption = 'Notes';
            ExternalName = 'serviceNotes';
            ExternalType = 'Edm.String';
        }
        field(7; "Price Type"; Option)
        {
            Caption = 'Price Type';
            ExternalName = 'priceType';
            ExternalType = 'microsoft.bookings.api.bookingPriceType';
            OptionCaption = 'Undefined,Fixed Price,Starting At,Hourly,Free,Price Varies,Call Us,Not Set';
            OptionMembers = undefined,fixedPrice,startingAt,hourly,free,priceVaries,callUs,notSet;
        }
        field(8; Price; Decimal)
        {
            Caption = 'Price';
            ExternalName = 'price';
            ExternalType = 'Edm.Double';
        }
        field(10; "Service ID"; Text[50])
        {
            Caption = 'Service ID';
            ExternalName = 'serviceId';
            ExternalType = 'Edm.String';
        }
        field(11; "Service Name"; Text[50])
        {
            Caption = 'Service Name';
            ExternalName = 'serviceName';
            ExternalType = 'Edm.String';
        }
        field(13; "Customer ID"; Text[50])
        {
            Caption = 'Customer ID';
            ExternalName = 'customerId';
            ExternalType = 'Edm.String';
        }
        field(14; "Customer Email"; Text[80])
        {
            Caption = 'Customer Email';
            ExternalName = 'customerEmailAddress';
            ExternalType = 'Edm.String';
        }
        field(15; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            ExternalName = 'customerName';
            ExternalType = 'Edm.String';
        }
        field(18; "Invoice Link"; Text[250])
        {
            Caption = 'Invoice Link';
            ExternalName = 'invoiceUrl';
            ExternalType = 'Edm.String';
        }
        field(19; "Invoice No."; Text[250])
        {
            Caption = 'Invoice No.';
            ExternalName = 'invoiceId';
            ExternalType = 'Edm.String';
        }
        field(21; "Invoice Status"; Option)
        {
            Caption = 'Invoice Status';
            ExternalName = 'invoiceStatus';
            ExternalType = 'microsoft.bookings.api.bookingInvoiceStatus';
            OptionCaption = 'Draft,Reviewing,Open,Canceled,Paid,Corrective';
            OptionMembers = draft,reviewing,open,canceled,paid,corrective;
        }
        field(22; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
            ExternalName = 'invoiceAmount';
            ExternalType = 'Edm.Double';
        }
        field(23; "Invoice Date"; BLOB)
        {
            Caption = 'Invoice Date';
            ExternalName = 'invoiceDate';
            ExternalType = 'microsoft.bookings.api.dateTimeTimeZone';
            SubType = Json;
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

