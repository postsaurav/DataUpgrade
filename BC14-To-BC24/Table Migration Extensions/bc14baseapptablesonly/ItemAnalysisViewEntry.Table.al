table 7154 "Item Analysis View Entry"
{
    Caption = 'Item Analysis View Entry';

    fields
    {
        field(1; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(2; "Analysis View Code"; Code[10])
        {
            Caption = 'Analysis View Code';
            NotBlank = true;
            TableRelation = "Item Analysis View".Code WHERE ("Analysis Area" = FIELD ("Analysis Area"),
                                                             Code = FIELD ("Analysis View Code"));
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Item';
            OptionMembers = " ",Customer,Vendor,Item;
        }
        field(5; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (Customer)) Customer
            ELSE
            IF ("Source Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Source Type" = CONST (Item)) Item;
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(9; "Dimension 1 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Value Code';
        }
        field(10; "Dimension 2 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Value Code';
        }
        field(11; "Dimension 3 Value Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Value Code';
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(13; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(14; "Item Ledger Entry Type"; Option)
        {
            Caption = 'Item Ledger Entry Type';
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        }
        field(15; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = 'Direct Cost,Revaluation,Rounding,Indirect Cost,Variance';
            OptionMembers = "Direct Cost",Revaluation,Rounding,"Indirect Cost",Variance;
        }
        field(21; "Invoiced Quantity"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Invoiced Quantity';
        }
        field(22; "Sales Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales Amount (Actual)';
        }
        field(23; "Cost Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual)';
        }
        field(24; "Cost Amount (Non-Invtbl.)"; Decimal)
        {
            AccessByPermission = TableData "Item Charge" = R;
            AutoFormatType = 1;
            Caption = 'Cost Amount (Non-Invtbl.)';
        }
        field(31; Quantity; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Quantity';
        }
        field(32; "Sales Amount (Expected)"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            Caption = 'Sales Amount (Expected)';
        }
        field(33; "Cost Amount (Expected)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected)';
        }
    }

    keys
    {
        key(Key1; "Analysis Area", "Analysis View Code", "Item No.", "Item Ledger Entry Type", "Entry Type", "Source Type", "Source No.", "Dimension 1 Value Code", "Dimension 2 Value Code", "Dimension 3 Value Code", "Location Code", "Posting Date", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

