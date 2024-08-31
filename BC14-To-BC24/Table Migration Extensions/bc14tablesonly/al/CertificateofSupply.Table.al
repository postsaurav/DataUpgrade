table 780 "Certificate of Supply"
{
    Caption = 'Certificate of Supply';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Sales Shipment,Service Shipment,Return Shipment';
            OptionMembers = "Sales Shipment","Service Shipment","Return Shipment";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = IF ("Document Type" = FILTER ("Sales Shipment")) "Sales Shipment Header"."No."
            ELSE
            IF ("Document Type" = FILTER ("Service Shipment")) "Service Shipment Header"."No."
            ELSE
            IF ("Document Type" = FILTER ("Return Shipment")) "Return Shipment Header"."No.";
        }
        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Not Applicable,Required,Received,Not Received';
            OptionMembers = "Not Applicable",Required,Received,"Not Received";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(5; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
        }
        field(6; Printed; Boolean)
        {
            Caption = 'Printed';
        }
        field(7; "Customer/Vendor Name"; Text[100])
        {
            Caption = 'Customer/Vendor Name';
            Editable = false;
        }
        field(8; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            Editable = false;
        }
        field(9; "Shipment/Posting Date"; Date)
        {
            Caption = 'Shipment/Posting Date';
            Editable = false;
        }
        field(10; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            Editable = false;
        }
        field(11; "Customer/Vendor No."; Code[20])
        {
            Caption = 'Customer/Vendor No.';
        }
        field(12; "Vehicle Registration No."; Text[20])
        {
            Caption = 'Vehicle Registration No.';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

