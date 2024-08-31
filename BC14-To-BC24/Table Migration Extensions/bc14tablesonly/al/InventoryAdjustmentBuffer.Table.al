table 5895 "Inventory Adjustment Buffer"
{
    Caption = 'Inventory Adjustment Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
            TableRelation = Item;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = SystemMetadata;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = SystemMetadata;
            TableRelation = Location;
        }
        field(11; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            DataClassification = SystemMetadata;
            TableRelation = "Item Ledger Entry";
        }
        field(13; "Item Ledger Entry Quantity"; Decimal)
        {
            Caption = 'Item Ledger Entry Quantity';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(43; "Cost Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual)';
            DataClassification = SystemMetadata;
        }
        field(68; "Cost Amount (Actual) (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual) (ACY)';
            DataClassification = SystemMetadata;
        }
        field(98; "Expected Cost"; Boolean)
        {
            Caption = 'Expected Cost';
            DataClassification = SystemMetadata;
        }
        field(100; "Valued By Average Cost"; Boolean)
        {
            Caption = 'Valued By Average Cost';
            DataClassification = SystemMetadata;
        }
        field(104; "Valuation Date"; Date)
        {
            Caption = 'Valuation Date';
            DataClassification = SystemMetadata;
        }
        field(105; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Direct Cost,Revaluation,Rounding,Indirect Cost,Variance';
            OptionMembers = "Direct Cost",Revaluation,Rounding,"Indirect Cost",Variance;
        }
        field(106; "Variance Type"; Option)
        {
            Caption = 'Variance Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead,Subcontracted';
            OptionMembers = " ",Purchase,Material,Capacity,"Capacity Overhead","Manufacturing Overhead",Subcontracted;
        }
        field(151; "Cost Amount (Expected)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected)';
            DataClassification = SystemMetadata;
        }
        field(156; "Cost Amount (Expected) (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected) (ACY)';
            DataClassification = SystemMetadata;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = SystemMetadata;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Item Ledger Entry No.")
        {
            SumIndexFields = "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)";
        }
        key(Key3; "Item No.", "Valuation Date", "Location Code", "Variant Code")
        {
            SumIndexFields = "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)", "Item Ledger Entry Quantity";
        }
    }

    fieldgroups
    {
    }
}

