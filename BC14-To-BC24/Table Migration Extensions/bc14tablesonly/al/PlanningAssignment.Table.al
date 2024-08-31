table 99000850 "Planning Assignment"
{
    Caption = 'Planning Assignment';
    Permissions = TableData "Planning Assignment" = rimd;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
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
        field(10; "Latest Date"; Date)
        {
            Caption = 'Latest Date';
        }
        field(12; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
        field(13; "Action Msg. Response Planning"; Boolean)
        {
            Caption = 'Action Msg. Response Planning';
        }
        field(14; "Net Change Planning"; Boolean)
        {
            Caption = 'Net Change Planning';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Variant Code", "Location Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

