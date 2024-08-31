table 5767 "Warehouse Activity Line"
{
    Caption = 'Warehouse Activity Line';
    Permissions = TableData "Whse. Item Tracking Line" = rmd;

    fields
    {
        field(1; "Activity Type"; Option)
        {
            Caption = 'Activity Type';
            Editable = false;
            OptionCaption = ' ,Put-away,Pick,Movement,Invt. Put-away,Invt. Pick,Invt. Movement';
            OptionMembers = " ","Put-away",Pick,Movement,"Invt. Put-away","Invt. Pick","Invt. Movement";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(4; "Source Type"; Integer)
        {
            Caption = 'Source Type';
            Editable = false;
        }
        field(5; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            Editable = false;
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(6; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            Editable = false;
        }
        field(7; "Source Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Source Line No.';
            Editable = false;
        }
        field(8; "Source Subline No."; Integer)
        {
            BlankZero = true;
            Caption = 'Source Subline No.';
            Editable = false;
        }
        field(9; "Source Document"; Option)
        {
            BlankZero = true;
            Caption = 'Source Document';
            Editable = false;
            OptionCaption = ' ,Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer,Outbound Transfer,Prod. Consumption,Prod. Output,,,,,,Service Order,,Assembly Consumption,Assembly Order';
            OptionMembers = " ","Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer","Outbound Transfer","Prod. Consumption","Prod. Output",,,,,,"Service Order",,"Assembly Consumption","Assembly Order";
        }
        field(11; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            Editable = false;
            TableRelation = Location;
        }
        field(12; "Shelf No."; Code[10])
        {
            Caption = 'Shelf No.';
        }
        field(13; "Sorting Sequence No."; Integer)
        {
            Caption = 'Sorting Sequence No.';
            Editable = false;
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            Editable = false;
            TableRelation = Item;
        }
        field(15; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            Editable = false;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(16; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            Editable = false;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(17; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(18; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(19; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            Editable = false;
        }
        field(20; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(21; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(24; "Qty. Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(25; "Qty. Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(26; "Qty. to Handle"; Decimal)
        {
            Caption = 'Qty. to Handle';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(27; "Qty. to Handle (Base)"; Decimal)
        {
            Caption = 'Qty. to Handle (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(28; "Qty. Handled"; Decimal)
        {
            Caption = 'Qty. Handled';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(29; "Qty. Handled (Base)"; Decimal)
        {
            Caption = 'Qty. Handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(31; "Shipping Advice"; Option)
        {
            Caption = 'Shipping Advice';
            Editable = false;
            FieldClass = Normal;
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;
        }
        field(34; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(39; "Destination Type"; Option)
        {
            Caption = 'Destination Type';
            Editable = false;
            OptionCaption = ' ,Customer,Vendor,Location,Item,Family,Sales Order';
            OptionMembers = " ",Customer,Vendor,Location,Item,Family,"Sales Order";
        }
        field(40; "Destination No."; Code[20])
        {
            Caption = 'Destination No.';
            Editable = false;
            TableRelation = IF ("Destination Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Destination Type" = CONST (Customer)) Customer
            ELSE
            IF ("Destination Type" = CONST (Location)) Location
            ELSE
            IF ("Destination Type" = CONST (Item)) Item
            ELSE
            IF ("Destination Type" = CONST (Family)) Family
            ELSE
            IF ("Destination Type" = CONST ("Sales Order")) "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(42; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(43; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
        field(44; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(47; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(900; "Assemble to Order"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Assemble to Order';
            Editable = false;
        }
        field(901; "ATO Component"; Boolean)
        {
            Caption = 'ATO Component';
            Editable = false;
        }
        field(6500; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(6501; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }
        field(6502; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(6503; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(6504; "Serial No. Blocked"; Boolean)
        {
            CalcFormula = Lookup ("Serial No. Information".Blocked WHERE ("Item No." = FIELD ("Item No."),
                                                                         "Variant Code" = FIELD ("Variant Code"),
                                                                         "Serial No." = FIELD ("Serial No.")));
            Caption = 'Serial No. Blocked';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6505; "Lot No. Blocked"; Boolean)
        {
            CalcFormula = Lookup ("Lot No. Information".Blocked WHERE ("Item No." = FIELD ("Item No."),
                                                                      "Variant Code" = FIELD ("Variant Code"),
                                                                      "Lot No." = FIELD ("Lot No.")));
            Caption = 'Lot No. Blocked';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7300; "Bin Code"; Code[20])
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Bin Code';
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(7301; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(7305; "Action Type"; Option)
        {
            Caption = 'Action Type';
            Editable = false;
            OptionCaption = ' ,Take,Place';
            OptionMembers = " ",Take,Place;
        }
        field(7306; "Whse. Document Type"; Option)
        {
            Caption = 'Whse. Document Type';
            Editable = false;
            OptionCaption = ' ,Receipt,Shipment,Internal Put-away,Internal Pick,Production,Movement Worksheet,,Assembly';
            OptionMembers = " ",Receipt,Shipment,"Internal Put-away","Internal Pick",Production,"Movement Worksheet",,Assembly;
        }
        field(7307; "Whse. Document No."; Code[20])
        {
            Caption = 'Whse. Document No.';
            Editable = false;
            TableRelation = IF ("Whse. Document Type" = CONST (Receipt)) "Posted Whse. Receipt Header"."No." WHERE ("No." = FIELD ("Whse. Document No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Shipment)) "Warehouse Shipment Header"."No." WHERE ("No." = FIELD ("Whse. Document No."))
            ELSE
            IF ("Whse. Document Type" = CONST ("Internal Put-away")) "Whse. Internal Put-away Header"."No." WHERE ("No." = FIELD ("Whse. Document No."))
            ELSE
            IF ("Whse. Document Type" = CONST ("Internal Pick")) "Whse. Internal Pick Header"."No." WHERE ("No." = FIELD ("Whse. Document No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Production)) "Production Order"."No." WHERE ("No." = FIELD ("Whse. Document No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Assembly)) "Assembly Header"."No." WHERE ("Document Type" = CONST (Order),
                                                                                                           "No." = FIELD ("Whse. Document No."));
        }
        field(7308; "Whse. Document Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Whse. Document Line No.';
            Editable = false;
            TableRelation = IF ("Whse. Document Type" = CONST (Receipt)) "Posted Whse. Receipt Line"."Line No." WHERE ("No." = FIELD ("Whse. Document No."),
                                                                                                                    "Line No." = FIELD ("Whse. Document Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Shipment)) "Warehouse Shipment Line"."Line No." WHERE ("No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                "Line No." = FIELD ("Whse. Document Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST ("Internal Put-away")) "Whse. Internal Put-away Line"."Line No." WHERE ("No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                                                                                                                            "Line No." = FIELD ("Whse. Document Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST ("Internal Pick")) "Whse. Internal Pick Line"."Line No." WHERE ("No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                                                                                                                                                                                                                                "Line No." = FIELD ("Whse. Document Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Production)) "Prod. Order Line"."Line No." WHERE ("Prod. Order No." = FIELD ("No."),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "Line No." = FIELD ("Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Assembly)) "Assembly Line"."Line No." WHERE ("Document Type" = CONST (Order),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "Document No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "Line No." = FIELD ("Whse. Document Line No."));
        }
        field(7309; "Bin Ranking"; Integer)
        {
            Caption = 'Bin Ranking';
            Editable = false;
        }
        field(7310; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
        }
        field(7311; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
        }
        field(7312; "Special Equipment Code"; Code[10])
        {
            Caption = 'Special Equipment Code';
            TableRelation = "Special Equipment";
        }
        field(7313; "Bin Type Code"; Code[10])
        {
            Caption = 'Bin Type Code';
            TableRelation = "Bin Type";
        }
        field(7314; "Breakbulk No."; Integer)
        {
            BlankZero = true;
            Caption = 'Breakbulk No.';
        }
        field(7315; "Original Breakbulk"; Boolean)
        {
            Caption = 'Original Breakbulk';
        }
        field(7316; Breakbulk; Boolean)
        {
            Caption = 'Breakbulk';
        }
        field(7317; "Cross-Dock Information"; Option)
        {
            Caption = 'Cross-Dock Information';
            OptionCaption = ' ,Cross-Dock Items,Some Items Cross-Docked';
            OptionMembers = " ","Cross-Dock Items","Some Items Cross-Docked";
        }
        field(7318; Dedicated; Boolean)
        {
            Caption = 'Dedicated';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Activity Type", "No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "No.", "Line No.", "Activity Type")
        {
        }
        key(Key3; "Source Type", "Source Subtype", "Source No.", "Source Line No.", "Source Subline No.", "Unit of Measure Code", "Action Type", "Breakbulk No.", "Original Breakbulk", "Activity Type", "Assemble to Order")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding", "Qty. Outstanding (Base)";
        }
        key(Key4; "Activity Type", "No.", "Sorting Sequence No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "Activity Type", "No.", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key6; "Activity Type", "No.", "Location Code", "Source Document", "Source No.", "Action Type", "Zone Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "Activity Type", "No.", "Due Date", "Action Type", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key8; "Activity Type", "No.", "Bin Code", "Breakbulk No.", "Action Type")
        {
            MaintainSQLIndex = false;
        }
        key(Key9; "Activity Type", "No.", "Bin Ranking", "Breakbulk No.", "Action Type")
        {
            MaintainSQLIndex = false;
        }
        key(Key10; "Activity Type", "No.", "Destination Type", "Destination No.", "Action Type", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Activity Type", "No.", "Whse. Document Type", "Whse. Document No.", "Whse. Document Line No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key12; "Activity Type", "No.", "Action Type", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key13; "Activity Type", "No.", "Item No.", "Variant Code", "Action Type", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key14; "Whse. Document No.", "Whse. Document Type", "Activity Type", "Whse. Document Line No.", "Action Type", "Unit of Measure Code", "Original Breakbulk", "Breakbulk No.", "Lot No.", "Serial No.", "Assemble to Order")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding (Base)", "Qty. Outstanding";
        }
        key(Key15; "Item No.", "Bin Code", "Location Code", "Action Type", "Variant Code", "Unit of Measure Code", "Breakbulk No.", "Activity Type", "Lot No.", "Serial No.", "Original Breakbulk", "Assemble to Order", "ATO Component")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = Quantity, "Qty. (Base)", "Qty. Outstanding", "Qty. Outstanding (Base)", Cubage, Weight;
        }
        key(Key16; "Item No.", "Location Code", "Activity Type", "Bin Type Code", "Unit of Measure Code", "Variant Code", "Breakbulk No.", "Action Type", "Lot No.", "Serial No.", "Assemble to Order")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding (Base)";
        }
        key(Key17; "Bin Code", "Location Code", "Action Type", "Breakbulk No.")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = Cubage, Weight;
        }
        key(Key18; "Location Code", "Activity Type")
        {
        }
        key(Key19; "Source No.", "Source Line No.", "Source Subline No.", "Serial No.", "Lot No.")
        {
            MaintainSQLIndex = false;
        }
    }

    fieldgroups
    {
    }
}

