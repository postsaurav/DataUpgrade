table 5802 "Value Entry"
{
    Caption = 'Value Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Item Ledger Entry Type"; Option)
        {
            Caption = 'Item Ledger Entry Type';
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
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
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(9; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(10; "Source Posting Group"; Code[20])
        {
            Caption = 'Source Posting Group';
            TableRelation = IF ("Source Type" = CONST (Customer)) "Customer Posting Group"
            ELSE
            IF ("Source Type" = CONST (Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Source Type" = CONST (Item)) "Inventory Posting Group";
        }
        field(11; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(12; "Valued Quantity"; Decimal)
        {
            Caption = 'Valued Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(13; "Item Ledger Entry Quantity"; Decimal)
        {
            Caption = 'Item Ledger Entry Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(14; "Invoiced Quantity"; Decimal)
        {
            Caption = 'Invoiced Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(15; "Cost per Unit"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Cost per Unit';
        }
        field(17; "Sales Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales Amount (Actual)';
        }
        field(22; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(23; "Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Discount Amount';
        }
        field(24; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(28; "Applies-to Entry"; Integer)
        {
            Caption = 'Applies-to Entry';
        }
        field(33; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(34; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(41; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Item';
            OptionMembers = " ",Customer,Vendor,Item;
        }
        field(43; "Cost Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual)';
        }
        field(45; "Cost Posted to G/L"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Posted to G/L';
        }
        field(46; "Reason Code"; Code[10])
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(47; "Drop Shipment"; Boolean)
        {
            Caption = 'Drop Shipment';
        }
        field(48; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(57; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(58; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(60; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(61; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(68; "Cost Amount (Actual) (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual) (ACY)';
        }
        field(70; "Cost Posted to G/L (ACY)"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Cost Posted to G/L (ACY)';
        }
        field(72; "Cost per Unit (ACY)"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 2;
            Caption = 'Cost per Unit (ACY)';
        }
        field(79; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly';
            OptionMembers = " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo","Transfer Shipment","Transfer Receipt","Service Shipment","Service Invoice","Service Credit Memo","Posted Assembly";
        }
        field(80; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(90; "Order Type"; Option)
        {
            Caption = 'Order Type';
            Editable = false;
            OptionCaption = ' ,Production,Transfer,Service,Assembly';
            OptionMembers = " ",Production,Transfer,Service,Assembly;
        }
        field(91; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            Editable = false;
        }
        field(92; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
            Editable = false;
        }
        field(98; "Expected Cost"; Boolean)
        {
            Caption = 'Expected Cost';
        }
        field(99; "Item Charge No."; Code[20])
        {
            Caption = 'Item Charge No.';
            TableRelation = "Item Charge";
        }
        field(100; "Valued By Average Cost"; Boolean)
        {
            Caption = 'Valued By Average Cost';
        }
        field(102; "Partial Revaluation"; Boolean)
        {
            Caption = 'Partial Revaluation';
        }
        field(103; Inventoriable; Boolean)
        {
            Caption = 'Inventoriable';
        }
        field(104; "Valuation Date"; Date)
        {
            Caption = 'Valuation Date';
        }
        field(105; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            Editable = false;
            OptionCaption = 'Direct Cost,Revaluation,Rounding,Indirect Cost,Variance';
            OptionMembers = "Direct Cost",Revaluation,Rounding,"Indirect Cost",Variance;
        }
        field(106; "Variance Type"; Option)
        {
            Caption = 'Variance Type';
            Editable = false;
            OptionCaption = ' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead,Subcontracted';
            OptionMembers = " ",Purchase,Material,Capacity,"Capacity Overhead","Manufacturing Overhead",Subcontracted;
        }
        field(148; "Purchase Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Purchase Amount (Actual)';
        }
        field(149; "Purchase Amount (Expected)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            Caption = 'Purchase Amount (Expected)';
        }
        field(150; "Sales Amount (Expected)"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            Caption = 'Sales Amount (Expected)';
        }
        field(151; "Cost Amount (Expected)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected)';
        }
        field(152; "Cost Amount (Non-Invtbl.)"; Decimal)
        {
            AccessByPermission = TableData "Item Charge" = R;
            AutoFormatType = 1;
            Caption = 'Cost Amount (Non-Invtbl.)';
        }
        field(156; "Cost Amount (Expected) (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected) (ACY)';
        }
        field(157; "Cost Amount (Non-Invtbl.)(ACY)"; Decimal)
        {
            AccessByPermission = TableData "Item Charge" = R;
            AutoFormatType = 1;
            Caption = 'Cost Amount (Non-Invtbl.)(ACY)';
        }
        field(158; "Expected Cost Posted to G/L"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Cost Posted to G/L';
        }
        field(159; "Exp. Cost Posted to G/L (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Exp. Cost Posted to G/L (ACY)';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1000; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job."No.";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(1002; "Job Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Ledger Entry No.';
            TableRelation = "Job Ledger Entry"."Entry No.";
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(5818; Adjustment; Boolean)
        {
            Caption = 'Adjustment';
            Editable = false;
        }
        field(5819; "Average Cost Exception"; Boolean)
        {
            Caption = 'Average Cost Exception';
        }
        field(5831; "Capacity Ledger Entry No."; Integer)
        {
            Caption = 'Capacity Ledger Entry No.';
            TableRelation = "Capacity Ledger Entry";
        }
        field(5832; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Work Center,Machine Center, ,Resource';
            OptionMembers = "Work Center","Machine Center"," ",Resource;
        }
        field(5834; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST ("Machine Center")) "Machine Center"
            ELSE
            IF (Type = CONST ("Work Center")) "Work Center"
            ELSE
            IF (Type = CONST (Resource)) Resource;
        }
        field(6602; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Item Ledger Entry No.", "Entry Type")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)", "Cost Amount (Non-Invtbl.)(ACY)", "Purchase Amount (Actual)", "Purchase Amount (Expected)", "Discount Amount";
        }
        key(Key3; "Item Ledger Entry No.", "Document No.", "Document Line No.")
        {
            Enabled = false;
            MaintainSQLIndex = false;
        }
        key(Key4; "Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Purchase Amount (Actual)", "Expected Cost Posted to G/L", "Cost Posted to G/L", "Item Ledger Entry Quantity";
        }
        key(Key5; "Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Source Type", "Source No.")
        {
            Enabled = false;
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Purchase Amount (Actual)", "Expected Cost Posted to G/L", "Cost Posted to G/L", "Item Ledger Entry Quantity";
        }
        key(Key6; "Document No.")
        {
        }
        key(Key7; "Item No.", "Valuation Date", "Location Code", "Variant Code")
        {
            SumIndexFields = "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)", "Item Ledger Entry Quantity";
        }
        key(Key8; "Source Type", "Source No.", "Item No.", "Posting Date", "Entry Type", Adjustment, "Item Ledger Entry Type")
        {
            SumIndexFields = "Discount Amount", "Cost Amount (Non-Invtbl.)", "Cost Amount (Actual)", "Cost Amount (Expected)", "Sales Amount (Actual)", "Sales Amount (Expected)", "Invoiced Quantity";
        }
        key(Key9; "Item Charge No.", "Inventory Posting Group", "Item No.")
        {
        }
        key(Key10; "Capacity Ledger Entry No.", "Entry Type")
        {
            SumIndexFields = "Cost Amount (Actual)", "Cost Amount (Actual) (ACY)";
        }
        key(Key11; "Order Type", "Order No.", "Order Line No.")
        {
        }
        key(Key12; "Source Type", "Source No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Item No.", "Posting Date", "Entry Type", Adjustment)
        {
            Enabled = false;
            SumIndexFields = "Discount Amount", "Cost Amount (Non-Invtbl.)", "Cost Amount (Actual)", "Cost Amount (Expected)", "Sales Amount (Actual)", "Sales Amount (Expected)", "Invoiced Quantity";
        }
        key(Key13; "Job No.", "Job Task No.", "Document No.")
        {
        }
        key(Key14; "Item Ledger Entry Type", "Posting Date", "Item No.", "Inventory Posting Group", "Dimension Set ID")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Actual)", "Purchase Amount (Actual)";
        }
        key(Key15; "Item Ledger Entry No.", "Valuation Date")
        {
            Enabled = false;
        }
        key(Key16; "Location Code", "Inventory Posting Group")
        {
        }
        key(Key17; "Item Ledger Entry Type", "Order No.", "Valuation Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Item Ledger Entry Type", "Item Ledger Entry No.", "Item No.", "Posting Date", "Source No.", "Document No.")
        {
        }
    }
}

