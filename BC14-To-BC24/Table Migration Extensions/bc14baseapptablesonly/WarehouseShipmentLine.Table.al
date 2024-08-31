table 7321 "Warehouse Shipment Line"
{
    Caption = 'Warehouse Shipment Line';

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
        field(3; "Source Type"; Integer)
        {
            Caption = 'Source Type';
            Editable = false;
        }
        field(4; "Source Subtype"; Option)
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
            Caption = 'Source Line No.';
            Editable = false;
        }
        field(9; "Source Document"; Option)
        {
            Caption = 'Source Document';
            Editable = false;
            OptionCaption = ',Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,,Outbound Transfer,,,,,,,,Service Order';
            OptionMembers = ,"Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order",,"Outbound Transfer",,,,,,,,"Service Order";
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
        field(12; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(13; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            Editable = false;
            TableRelation = Item;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(16; "Qty. (Base)"; Decimal)
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
        field(21; "Qty. to Ship"; Decimal)
        {
            Caption = 'Qty. to Ship';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(22; "Qty. to Ship (Base)"; Decimal)
        {
            Caption = 'Qty. to Ship (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(23; "Qty. Picked"; Decimal)
        {
            Caption = 'Qty. Picked';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
        }
        field(24; "Qty. Picked (Base)"; Decimal)
        {
            Caption = 'Qty. Picked (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(25; "Qty. Shipped"; Decimal)
        {
            Caption = 'Qty. Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(26; "Qty. Shipped (Base)"; Decimal)
        {
            Caption = 'Qty. Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Pick Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Activity Type" = CONST (Pick),
                                                                                  "Whse. Document Type" = CONST (Shipment),
                                                                                  "Whse. Document No." = FIELD ("No."),
                                                                                  "Whse. Document Line No." = FIELD ("Line No."),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER (" " | Place),
                                                                                  "Original Breakbulk" = CONST (false),
                                                                                  "Breakbulk No." = CONST (0),
                                                                                  "Assemble to Order" = CONST (false)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Pick Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = CONST (Pick),
                                                                                         "Whse. Document Type" = CONST (Shipment),
                                                                                         "Whse. Document No." = FIELD ("No."),
                                                                                         "Whse. Document Line No." = FIELD ("Line No."),
                                                                                         "Action Type" = FILTER (" " | Place),
                                                                                         "Original Breakbulk" = CONST (false),
                                                                                         "Breakbulk No." = CONST (0),
                                                                                         "Assemble to Order" = CONST (false)));
            Caption = 'Pick Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            Editable = false;
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
            Editable = false;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(32; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(33; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            Editable = false;
        }
        field(34; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = ' ,Partially Picked,Partially Shipped,Completely Picked,Completely Shipped';
            OptionMembers = " ","Partially Picked","Partially Shipped","Completely Picked","Completely Shipped";
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
        field(41; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
        }
        field(42; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
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
        field(46; "Completely Picked"; Boolean)
        {
            Caption = 'Completely Picked';
            Editable = false;
        }
        field(48; "Not upd. by Src. Doc. Post."; Boolean)
        {
            Caption = 'Not upd. by Src. Doc. Post.';
            Editable = false;
        }
        field(49; "Posting from Whse. Ref."; Integer)
        {
            Caption = 'Posting from Whse. Ref.';
            Editable = false;
        }
        field(900; "Assemble to Order"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Assemble to Order';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "No.", "Sorting Sequence No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key3; "No.", "Item No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key4; "No.", "Source Document", "Source No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "No.", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key6; "No.", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "No.", "Due Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key8; "No.", "Destination Type", "Destination No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key9; "Source Type", "Source Subtype", "Source No.", "Source Line No.", "Assemble to Order")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding", "Qty. Outstanding (Base)";
        }
        key(Key10; "No.", "Source Type", "Source Subtype", "Source No.", "Source Line No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Item No.", "Location Code", "Variant Code", "Due Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding (Base)", "Qty. Picked (Base)", "Qty. Shipped (Base)";
        }
        key(Key12; "Bin Code", "Location Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = Cubage, Weight;
        }
    }

    fieldgroups
    {
    }
}

