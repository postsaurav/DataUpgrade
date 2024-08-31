table 7347 "Internal Movement Line"
{
    Caption = 'Internal Movement Line';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(10; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            Editable = false;
            TableRelation = Location;
        }
        field(11; "Shelf No."; Code[10])
        {
            Caption = 'Shelf No.';
        }
        field(12; "From Bin Code"; Code[20])
        {
            Caption = 'From Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(13; "To Bin Code"; Code[20])
        {
            Caption = 'To Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(16; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(29; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
        }
        field(30; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(31; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(32; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(33; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(35; "Sorting Sequence No."; Integer)
        {
            Caption = 'Sorting Sequence No.';
            Editable = false;
        }
        field(36; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(37; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
        }
        field(38; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "No.", "Item No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key3; "No.", "From Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key4; "No.", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "No.", "Sorting Sequence No.")
        {
        }
        key(Key6; "No.", "Due Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "Item No.", "From Bin Code", "Location Code", "Unit of Measure Code", "Variant Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. (Base)";
        }
    }

    fieldgroups
    {
    }
}

