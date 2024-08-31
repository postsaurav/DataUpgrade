table 914 "Posted Assemble-to-Order Link"
{
    Caption = 'Posted Assemble-to-Order Link';
    Permissions = TableData "Posted Assembly Header" = d,
                  TableData "Posted Assemble-to-Order Link" = d;

    fields
    {
        field(1; "Assembly Document Type"; Option)
        {
            Caption = 'Assembly Document Type';
            OptionCaption = ' ,Assembly';
            OptionMembers = " ",Assembly;
        }
        field(2; "Assembly Document No."; Code[20])
        {
            Caption = 'Assembly Document No.';
            TableRelation = IF ("Assembly Document Type" = CONST (Assembly)) "Posted Assembly Header" WHERE ("No." = FIELD ("Assembly Document No."));
        }
        field(12; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Shipment';
            OptionMembers = " ","Sales Shipment";
        }
        field(13; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = IF ("Document Type" = CONST ("Sales Shipment")) "Sales Shipment Line" WHERE ("Document No." = FIELD ("Document No."),
                                                                                                      "Line No." = FIELD ("Document Line No."));
        }
        field(14; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(20; "Assembled Quantity"; Decimal)
        {
            Caption = 'Assembled Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(21; "Assembled Quantity (Base)"; Decimal)
        {
            Caption = 'Assembled Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(32; "Assembly Order No."; Code[20])
        {
            Caption = 'Assembly Order No.';
        }
        field(33; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(34; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
        }
    }

    keys
    {
        key(Key1; "Assembly Document Type", "Assembly Document No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Document No.", "Document Line No.")
        {
        }
        key(Key3; "Order No.", "Order Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

