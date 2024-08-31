table 7317 "Warehouse Receipt Line"
{
    Caption = 'Warehouse Receipt Line';

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
        field(21; "Qty. to Receive"; Decimal)
        {
            Caption = 'Qty. to Receive';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(22; "Qty. to Receive (Base)"; Decimal)
        {
            Caption = 'Qty. to Receive (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(23; "Qty. Received"; Decimal)
        {
            Caption = 'Qty. Received';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(24; "Qty. Received (Base)"; Decimal)
        {
            Caption = 'Qty. Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
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
            OptionCaption = ' ,Partially Received,Completely Received';
            OptionMembers = " ","Partially Received","Completely Received";
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
        field(37; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(38; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
        }
        field(39; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
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
        field(50; "Qty. to Cross-Dock"; Decimal)
        {
            Caption = 'Qty. to Cross-Dock';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(51; "Qty. to Cross-Dock (Base)"; Decimal)
        {
            Caption = 'Qty. to Cross-Dock (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(52; "Cross-Dock Zone Code"; Code[10])
        {
            Caption = 'Cross-Dock Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                             "Cross-Dock Bin Zone" = CONST (true));
        }
        field(53; "Cross-Dock Bin Code"; Code[20])
        {
            Caption = 'Cross-Dock Bin Code';
            TableRelation = IF ("Cross-Dock Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                   "Cross-Dock Bin" = CONST (true))
            ELSE
            IF ("Cross-Dock Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                                                                                 "Zone Code" = FIELD ("Cross-Dock Zone Code"),
                                                                                                                                                 "Cross-Dock Bin" = CONST (true));
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Source Type", "Source Subtype", "Source No.", "Source Line No.")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding (Base)";
        }
        key(Key3; "No.", "Source Type", "Source Subtype", "Source No.", "Source Line No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key4; "No.", "Sorting Sequence No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "No.", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key6; "No.", "Item No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "No.", "Source Document", "Source No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key8; "No.", "Due Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key9; "No.", "Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key10; "Item No.", "Location Code", "Variant Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding (Base)";
        }
        key(Key11; "Bin Code", "Location Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = Cubage, Weight;
        }
    }

    fieldgroups
    {
    }
}

