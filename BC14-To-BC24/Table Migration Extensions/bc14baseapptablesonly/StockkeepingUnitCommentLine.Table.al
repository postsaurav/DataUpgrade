table 5701 "Stockkeeping Unit Comment Line"
{
    Caption = 'Stockkeeping Unit Comment Line';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
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
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(4; "Line No."; Integer)
        {
            BlankZero = false;
            Caption = 'Line No.';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Variant Code", "Location Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

