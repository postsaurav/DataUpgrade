table 6702 "Booking Sync"
{
    Caption = 'Booking Sync';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Booking Mailbox Address"; Text[80])
        {
            Caption = 'Booking Mailbox Address';
        }
        field(3; "Booking Mailbox Name"; Text[250])
        {
            Caption = 'Booking Mailbox Name';
        }
        field(4; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5; "Last Customer Sync"; DateTime)
        {
            Caption = 'Last Customer Sync';
            Editable = true;
        }
        field(6; "Last Service Sync"; DateTime)
        {
            Caption = 'Last Service Sync';
        }
        field(7; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(8; "Sync Customers"; Boolean)
        {
            Caption = 'Sync Customers';
        }
        field(9; "Customer Filter"; BLOB)
        {
            Caption = 'Customer Filter';
        }
        field(10; "Customer Template Code"; Code[10])
        {
            Caption = 'Customer Template Code';
            TableRelation = "Customer Template".Code;
        }
        field(12; "Sync Services"; Boolean)
        {
            Caption = 'Sync Services';
        }
        field(13; "Item Filter"; BLOB)
        {
            Caption = 'Item Filter';
        }
        field(14; "Item Template Code"; Code[10])
        {
            Caption = 'Item Template Code';
            TableRelation = "Config. Template Header".Code WHERE ("Table ID" = FILTER (27));
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
        key(Key2; "Booking Mailbox Address")
        {
        }
    }

    fieldgroups
    {
    }
}

