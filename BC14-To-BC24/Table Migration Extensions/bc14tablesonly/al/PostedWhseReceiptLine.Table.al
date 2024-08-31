table 7319 "Posted Whse. Receipt Line"
{
    Caption = 'Posted Whse. Receipt Line';

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
            OptionCaption = ',Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer';
            OptionMembers = ,"Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer";
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
        }
        field(16; "Qty. (Base)"; Decimal)
        {
            Caption = 'Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(25; "Qty. Put Away"; Decimal)
        {
            Caption = 'Qty. Put Away';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(26; "Qty. Put Away (Base)"; Decimal)
        {
            Caption = 'Qty. Put Away (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Put-away Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Activity Type" = CONST ("Put-away"),
                                                                                  "Whse. Document Type" = CONST (Receipt),
                                                                                  "Whse. Document No." = FIELD ("No."),
                                                                                  "Whse. Document Line No." = FIELD ("Line No."),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER (" " | Take),
                                                                                  "Original Breakbulk" = CONST (false)));
            Caption = 'Put-away Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Put-away Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = CONST ("Put-away"),
                                                                                         "Whse. Document Type" = CONST (Receipt),
                                                                                         "Whse. Document No." = FIELD ("No."),
                                                                                         "Whse. Document Line No." = FIELD ("Line No."),
                                                                                         "Action Type" = FILTER (" " | Take),
                                                                                         "Original Breakbulk" = CONST (false)));
            Caption = 'Put-away Qty. (Base)';
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
        field(36; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(37; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(50; "Qty. Cross-Docked"; Decimal)
        {
            Caption = 'Qty. Cross-Docked';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(51; "Qty. Cross-Docked (Base)"; Decimal)
        {
            Caption = 'Qty. Cross-Docked (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(52; "Cross-Dock Zone Code"; Code[10])
        {
            Caption = 'Cross-Dock Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(53; "Cross-Dock Bin Code"; Code[20])
        {
            Caption = 'Cross-Dock Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(60; "Posted Source Document"; Option)
        {
            Caption = 'Posted Source Document';
            OptionCaption = ' ,Posted Receipt,,Posted Return Receipt,,Posted Shipment,,Posted Return Shipment,,Posted Transfer Receipt';
            OptionMembers = " ","Posted Receipt",,"Posted Return Receipt",,"Posted Shipment",,"Posted Return Shipment",,"Posted Transfer Receipt";
        }
        field(61; "Posted Source No."; Code[20])
        {
            Caption = 'Posted Source No.';
        }
        field(62; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(63; "Vendor Shipment No."; Code[35])
        {
            Caption = 'Vendor Shipment No.';
        }
        field(64; "Whse. Receipt No."; Code[20])
        {
            Caption = 'Whse. Receipt No.';
            Editable = false;
        }
        field(65; "Whse Receipt Line No."; Integer)
        {
            Caption = 'Whse Receipt Line No.';
            Editable = false;
        }
        field(66; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = ' ,Partially Put Away,Completely Put Away';
            OptionMembers = " ","Partially Put Away","Completely Put Away";
        }
        field(6500; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            Editable = false;
        }
        field(6501; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(6502; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(6503; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Posted Source No.", "Posting Date")
        {
        }
        key(Key3; "Item No.", "Location Code", "Variant Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. (Base)", "Qty. Put Away (Base)";
        }
        key(Key4; "Source Type", "Source Subtype", "Source No.", "Source Line No.", "Posted Source Document", "Posted Source No.")
        {
        }
        key(Key5; "Lot No.")
        {
            Enabled = false;
        }
        key(Key6; "Serial No.")
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }
}

