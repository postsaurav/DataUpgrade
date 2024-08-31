table 5886 "Exp. Phys. Invt. Tracking"
{
    Caption = 'Exp. Phys. Invt. Tracking';

    fields
    {
        field(1; "Order No"; Code[20])
        {
            Caption = 'Order No';
            TableRelation = "Phys. Invt. Order Header";
        }
        field(2; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
            TableRelation = "Phys. Invt. Order Line"."Line No." WHERE ("Document No." = FIELD ("Order No"));
        }
        field(3; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(4; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }
        field(30; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "Order No", "Order Line No.", "Serial No.", "Lot No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

