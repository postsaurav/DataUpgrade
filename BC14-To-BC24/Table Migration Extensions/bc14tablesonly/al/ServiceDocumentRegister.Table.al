table 5936 "Service Document Register"
{
    Caption = 'Service Document Register';

    fields
    {
        field(1; "Source Document Type"; Option)
        {
            Caption = 'Source Document Type';
            OptionCaption = 'Order,Contract';
            OptionMembers = "Order",Contract;
        }
        field(2; "Source Document No."; Code[20])
        {
            Caption = 'Source Document No.';
        }
        field(3; "Destination Document Type"; Option)
        {
            Caption = 'Destination Document Type';
            OptionCaption = 'Invoice,Credit Memo,Posted Invoice,Posted Credit Memo';
            OptionMembers = Invoice,"Credit Memo","Posted Invoice","Posted Credit Memo";
        }
        field(4; "Destination Document No."; Code[20])
        {
            Caption = 'Destination Document No.';
        }
    }

    keys
    {
        key(Key1; "Source Document Type", "Source Document No.", "Destination Document Type", "Destination Document No.")
        {
            Clustered = true;
        }
        key(Key2; "Destination Document Type", "Destination Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

