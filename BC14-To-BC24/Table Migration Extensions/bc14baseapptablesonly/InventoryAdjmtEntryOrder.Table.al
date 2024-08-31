table 5896 "Inventory Adjmt. Entry (Order)"
{
    Caption = 'Inventory Adjmt. Entry (Order)';
    Permissions = TableData "Inventory Adjmt. Entry (Order)" = i;

    fields
    {
        field(1; "Order Type"; Option)
        {
            Caption = 'Order Type';
            OptionCaption = ' ,Production,Transfer,Service,Assembly';
            OptionMembers = " ",Production,Transfer,Service,Assembly;
        }
        field(2; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(3; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(7; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header"."No.";
        }
        field(8; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
        }
        field(21; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Overhead Rate"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Overhead Rate';
        }
        field(29; "Cost is Adjusted"; Boolean)
        {
            Caption = 'Cost is Adjusted';
            InitValue = true;
        }
        field(30; "Allow Online Adjustment"; Boolean)
        {
            Caption = 'Allow Online Adjustment';
            InitValue = true;
        }
        field(41; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(42; "Direct Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Cost';
        }
        field(43; "Indirect Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Indirect Cost';
        }
        field(44; "Single-Level Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Material Cost';
        }
        field(45; "Single-Level Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Capacity Cost';
        }
        field(46; "Single-Level Subcontrd. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Subcontrd. Cost';
        }
        field(47; "Single-Level Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Cap. Ovhd Cost';
        }
        field(48; "Single-Level Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Mfg. Ovhd Cost';
        }
        field(52; "Direct Cost (ACY)"; Decimal)
        {
            Caption = 'Direct Cost (ACY)';
        }
        field(53; "Indirect Cost (ACY)"; Decimal)
        {
            Caption = 'Indirect Cost (ACY)';
        }
        field(54; "Single-Lvl Material Cost (ACY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Material Cost (ACY)';
        }
        field(55; "Single-Lvl Capacity Cost (ACY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Capacity Cost (ACY)';
        }
        field(56; "Single-Lvl Subcontrd Cost(ACY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Subcontrd Cost(ACY)';
        }
        field(57; "Single-Lvl Cap. Ovhd Cost(ACY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Cap. Ovhd Cost(ACY)';
        }
        field(58; "Single-Lvl Mfg. Ovhd Cost(ACY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Mfg. Ovhd Cost(ACY)';
        }
        field(61; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely Invoiced';
        }
        field(62; "Is Finished"; Boolean)
        {
            Caption = 'Is Finished';
        }
    }

    keys
    {
        key(Key1; "Order Type", "Order No.", "Order Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Cost is Adjusted", "Allow Online Adjustment")
        {
        }
    }

    fieldgroups
    {
    }
}

