table 7326 "Whse. Worksheet Line"
{
    Caption = 'Whse. Worksheet Line';

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            NotBlank = true;
            TableRelation = "Whse. Worksheet Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
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
            OptionCaption = ',Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer,Outbound Transfer,Prod. Consumption,,,,,,,,,Assembly Consumption,Assembly Order';
            OptionMembers = ,"Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer","Outbound Transfer","Prod. Consumption",,,,,,,,,"Assembly Consumption","Assembly Order";
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
        field(12; "From Zone Code"; Code[10])
        {
            Caption = 'From Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(13; "From Bin Code"; Code[20])
        {
            Caption = 'From Bin Code';
        }
        field(14; "To Bin Code"; Code[20])
        {
            Caption = 'To Bin Code';
            TableRelation = IF ("To Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                           Code = FIELD ("To Bin Code"))
            ELSE
            IF ("To Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                                                                 "Zone Code" = FIELD ("To Zone Code"),
                                                                                                                                 Code = FIELD ("To Bin Code"));
        }
        field(15; "To Zone Code"; Code[10])
        {
            Caption = 'To Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(16; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(17; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(18; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(19; "Qty. Outstanding"; Decimal)
        {
            Caption = 'Qty. Outstanding';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(20; "Qty. Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(21; "Qty. to Handle"; Decimal)
        {
            Caption = 'Qty. to Handle';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(22; "Qty. to Handle (Base)"; Decimal)
        {
            Caption = 'Qty. to Handle (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(23; "Qty. Handled"; Decimal)
        {
            Caption = 'Qty. Handled';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(24; "Qty. Handled (Base)"; Decimal)
        {
            Caption = 'Qty. Handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "From Unit of Measure Code"; Code[10])
        {
            Caption = 'From Unit of Measure Code';
            NotBlank = true;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(28; "Qty. per From Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per From Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(29; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            NotBlank = true;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
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
        field(39; "Destination Type"; Option)
        {
            Caption = 'Destination Type';
            Editable = false;
            OptionCaption = ' ,Customer,Vendor,Location';
            OptionMembers = " ",Customer,Vendor,Location;
        }
        field(40; "Destination No."; Code[20])
        {
            Caption = 'Destination No.';
            Editable = false;
            TableRelation = IF ("Destination Type" = CONST (Customer)) Customer."No."
            ELSE
            IF ("Destination Type" = CONST (Vendor)) Vendor."No."
            ELSE
            IF ("Destination Type" = CONST (Location)) Location.Code;
        }
        field(41; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(42; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
        field(43; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(44; "Shipping Advice"; Option)
        {
            Caption = 'Shipping Advice';
            Editable = false;
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;
        }
        field(45; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(46; "Whse. Document Type"; Option)
        {
            Caption = 'Whse. Document Type';
            Editable = false;
            OptionCaption = ' ,Receipt,Shipment,Internal Put-away,Internal Pick,Production,Whse. Mov.-Worksheet,Internal Movement,Assembly';
            OptionMembers = " ",Receipt,Shipment,"Internal Put-away","Internal Pick",Production,"Whse. Mov.-Worksheet","Internal Movement",Assembly;
        }
        field(47; "Whse. Document No."; Code[20])
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
        field(48; "Whse. Document Line No."; Integer)
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
            IF ("Whse. Document Type" = CONST (Production)) "Prod. Order Line"."Line No." WHERE (Status = CONST (Released),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "Prod. Order No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "Line No." = FIELD ("Line No."))
            ELSE
            IF ("Whse. Document Type" = CONST (Assembly)) "Assembly Line"."Line No." WHERE ("Document Type" = CONST (Order),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "Document No." = FIELD ("Whse. Document No."),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         "Line No." = FIELD ("Whse. Document Line No."));
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", Name, "Location Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Worksheet Template Name", Name, "Location Code", "Sorting Sequence No.")
        {
        }
        key(Key3; "Item No.", "Location Code", "Worksheet Template Name", "Variant Code", "Unit of Measure Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. to Handle (Base)";
        }
        key(Key4; "Whse. Document Type", "Whse. Document No.", "Whse. Document Line No.")
        {
        }
        key(Key5; "Worksheet Template Name", Name, "Location Code", "Item No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key6; "Worksheet Template Name", Name, "Location Code", "Due Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "Worksheet Template Name", Name, "Location Code", "Destination Type", "Destination No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key8; "Worksheet Template Name", Name, "Location Code", "Source Document", "Source No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key9; "Worksheet Template Name", Name, "Location Code", "To Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key10; "Worksheet Template Name", Name, "Location Code", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Source Type", "Source Subtype", "Source No.", "Source Line No.", "Source Subline No.")
        {
        }
        key(Key12; "Item No.", "From Bin Code", "Location Code", "Variant Code", "From Unit of Measure Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. to Handle", "Qty. to Handle (Base)";
        }
    }

    fieldgroups
    {
    }
}

