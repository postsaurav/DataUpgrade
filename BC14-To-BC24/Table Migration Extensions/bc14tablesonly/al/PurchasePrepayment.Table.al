table 460 "Purchase Prepayment %"
{
    Caption = 'Purchase Prepayment %';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(5; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Vendor No.", "Starting Date")
        {
            Clustered = true;
        }
        key(Key2; "Vendor No.")
        {
        }
    }

    fieldgroups
    {
    }
}

