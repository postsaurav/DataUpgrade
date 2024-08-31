table 5742 "Transfer Route"
{
    Caption = 'Transfer Route';
    DataCaptionFields = "Transfer-from Code", "Transfer-to Code";

    fields
    {
        field(1; "Transfer-from Code"; Code[10])
        {
            Caption = 'Transfer-from Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(2; "Transfer-to Code"; Code[10])
        {
            Caption = 'Transfer-to Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(4; "In-Transit Code"; Code[10])
        {
            Caption = 'In-Transit Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (true));
        }
        field(5; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(6; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
    }

    keys
    {
        key(Key1; "Transfer-from Code", "Transfer-to Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

