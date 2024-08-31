table 5804 "Avg. Cost Adjmt. Entry Point"
{
    Caption = 'Avg. Cost Adjmt. Entry Point';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(4; "Valuation Date"; Date)
        {
            Caption = 'Valuation Date';
        }
        field(5; "Cost Is Adjusted"; Boolean)
        {
            Caption = 'Cost Is Adjusted';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Variant Code", "Location Code", "Valuation Date")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Cost Is Adjusted", "Valuation Date")
        {
        }
    }

    fieldgroups
    {
    }
}

