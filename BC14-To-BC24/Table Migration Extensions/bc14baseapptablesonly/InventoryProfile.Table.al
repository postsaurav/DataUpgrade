table 99000853 "Inventory Profile"
{
    Caption = 'Inventory Profile';

    fields
    {
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Attribute Priority"; Integer)
        {
            Caption = 'Attribute Priority';
        }
        field(5; "Order Priority"; Integer)
        {
            Caption = 'Order Priority';
        }
        field(11; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(12; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."),
                                                       Code = FIELD ("Variant Code"));
        }
        field(13; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(14; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(15; IsSupply; Boolean)
        {
            Caption = 'IsSupply';
        }
        field(16; "Order Relation"; Option)
        {
            Caption = 'Order Relation';
            OptionCaption = 'Normal,Safety Stock,Reorder Point';
            OptionMembers = Normal,"Safety Stock","Reorder Point";
        }
        field(21; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(22; "Source Order Status"; Integer)
        {
            Caption = 'Source Order Status';
        }
        field(23; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(24; "Source Batch Name"; Code[10])
        {
            Caption = 'Source Batch Name';
        }
        field(25; "Source Ref. No."; Integer)
        {
            Caption = 'Source Ref. No.';
        }
        field(26; "Source Prod. Order Line"; Integer)
        {
            Caption = 'Source Prod. Order Line';
        }
        field(27; "Primary Order Status"; Integer)
        {
            Caption = 'Primary Order Status';
        }
        field(28; "Primary Order No."; Code[20])
        {
            Caption = 'Primary Order No.';
        }
        field(29; "Primary Order Line"; Integer)
        {
            Caption = 'Primary Order Line';
        }
        field(30; "Primary Order Type"; Integer)
        {
            Caption = 'Primary Order Type';
        }
        field(31; "Original Quantity"; Decimal)
        {
            Caption = 'Original Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(32; "Remaining Quantity (Base)"; Decimal)
        {
            Caption = 'Remaining Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(33; "Untracked Quantity"; Decimal)
        {
            Caption = 'Untracked Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(34; "Original Due Date"; Date)
        {
            Caption = 'Original Due Date';
        }
        field(35; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(36; "Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            OptionCaption = 'Unlimited,None,Reduce Only';
            OptionMembers = Unlimited,"None","Reduce Only";
        }
        field(37; "Fixed Date"; Date)
        {
            Caption = 'Fixed Date';
        }
        field(38; "Action Message"; Option)
        {
            Caption = 'Action Message';
            OptionCaption = ' ,New,Change Qty.,Reschedule,Resched.& Chg. Qty.,Cancel';
            OptionMembers = " ",New,"Change Qty.",Reschedule,"Resched.& Chg. Qty.",Cancel;
        }
        field(39; Binding; Option)
        {
            Caption = 'Binding';
            Editable = false;
            OptionCaption = ' ,Order-to-Order';
            OptionMembers = " ","Order-to-Order";
        }
        field(40; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(41; "Min. Quantity"; Decimal)
        {
            Caption = 'Min. Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(42; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(43; "Planning Line No."; Integer)
        {
            Caption = 'Planning Line No.';
        }
        field(44; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
        }
        field(45; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
        }
        field(46; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(47; "Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(48; "Finished Quantity"; Decimal)
        {
            Caption = 'Finished Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(50; "Planning Level Code"; Integer)
        {
            Caption = 'Planning Level Code';
            Editable = false;
        }
        field(51; "Planning Line Phase"; Option)
        {
            Caption = 'Planning Line Phase';
            OptionCaption = ' ,Line Created,Routing Created,Exploded';
            OptionMembers = " ","Line Created","Routing Created",Exploded;
        }
        field(52; "Due Time"; Time)
        {
            Caption = 'Due Time';
        }
        field(53; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
        }
        field(54; "Drop Shipment"; Boolean)
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Drop Shipment';
        }
        field(55; "Special Order"; Boolean)
        {
            Caption = 'Special Order';
        }
        field(56; "Ref. Order No."; Code[20])
        {
            Caption = 'Ref. Order No.';
            Editable = false;
        }
        field(57; "Ref. Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Ref. Line No.';
            Editable = false;
        }
        field(58; "Derived from Blanket Order"; Boolean)
        {
            Caption = 'Derived from Blanket Order';
        }
        field(59; "Ref. Blanket Order No."; Code[20])
        {
            Caption = 'Ref. Blanket Order No.';
        }
        field(60; "Tracking Reference"; Integer)
        {
            Caption = 'Tracking Reference';
        }
        field(61; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }
        field(62; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(63; "Max. Quantity"; Decimal)
        {
            Caption = 'Max. Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(64; "Safety Stock Quantity"; Decimal)
        {
            Caption = 'Safety Stock Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(65; "Is Exception Order"; Boolean)
        {
            Caption = 'Is Exception Order';
        }
        field(66; "Transfer Location Not Planned"; Boolean)
        {
            Caption = 'Transfer Location Not Planned';
        }
        field(67; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            Editable = false;
        }
        field(68; "Ref. Order Type"; Option)
        {
            Caption = 'Ref. Order Type';
            Editable = false;
            OptionCaption = ' ,Purchase,Prod. Order,Transfer,Assembly';
            OptionMembers = " ",Purchase,"Prod. Order",Transfer,Assembly;
        }
        field(69; "Disallow Cancellation"; Boolean)
        {
            Caption = 'Disallow Cancellation';
        }
        field(70; "MPS Order"; Boolean)
        {
            Caption = 'MPS Order';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Variant Code", "Location Code", "Due Date", "Attribute Priority", "Order Priority")
        {
        }
        key(Key3; "Item No.", "Variant Code", "Location Code", IsSupply, "Primary Order Status", "Primary Order No.", "Due Date", "Order Priority")
        {
        }
        key(Key4; "Source Type", "Source Order Status", "Source ID", "Source Batch Name", "Source Ref. No.", "Source Prod. Order Line", IsSupply, "Due Date")
        {
        }
    }

    fieldgroups
    {
    }
}

