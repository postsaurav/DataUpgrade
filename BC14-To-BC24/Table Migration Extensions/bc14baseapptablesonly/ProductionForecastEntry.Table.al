table 99000852 "Production Forecast Entry"
{
    Caption = 'Demand Forecast Entry';

    fields
    {
        field(1; "Production Forecast Name"; Code[10])
        {
            Caption = 'Demand Forecast Name';
            TableRelation = "Production Forecast Name";
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; "Forecast Date"; Date)
        {
            Caption = 'Forecast Date';
        }
        field(5; "Forecast Quantity"; Decimal)
        {
            Caption = 'Forecast Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(7; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(8; "Forecast Quantity (Base)"; Decimal)
        {
            Caption = 'Forecast Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(10; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(12; "Component Forecast"; Boolean)
        {
            Caption = 'Component Forecast';
        }
        field(13; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Production Forecast Name", "Item No.", "Location Code", "Forecast Date", "Component Forecast")
        {
            SumIndexFields = "Forecast Quantity (Base)";
        }
        key(Key3; "Production Forecast Name", "Item No.", "Component Forecast", "Forecast Date", "Location Code")
        {
            SumIndexFields = "Forecast Quantity (Base)";
        }
    }

    fieldgroups
    {
    }
}

