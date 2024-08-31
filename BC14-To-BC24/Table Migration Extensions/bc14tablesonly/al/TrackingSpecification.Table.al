table 336 "Tracking Specification"
{
    Caption = 'Tracking Specification';

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
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(4; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(10; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(11; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(12; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(13; "Source Batch Name"; Code[10])
        {
            Caption = 'Source Batch Name';
        }
        field(14; "Source Prod. Order Line"; Integer)
        {
            Caption = 'Source Prod. Order Line';
        }
        field(15; "Source Ref. No."; Integer)
        {
            Caption = 'Source Ref. No.';
        }
        field(16; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(17; "Transfer Item Entry No."; Integer)
        {
            Caption = 'Transfer Item Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(24; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(28; Positive; Boolean)
        {
            Caption = 'Positive';
        }
        field(29; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            Caption = 'Appl.-to Item Entry';
        }
        field(40; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(41; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(50; "Qty. to Handle (Base)"; Decimal)
        {
            Caption = 'Qty. to Handle (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(51; "Qty. to Invoice (Base)"; Decimal)
        {
            Caption = 'Qty. to Invoice (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(52; "Quantity Handled (Base)"; Decimal)
        {
            Caption = 'Quantity Handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(53; "Quantity Invoiced (Base)"; Decimal)
        {
            Caption = 'Quantity Invoiced (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(60; "Qty. to Handle"; Decimal)
        {
            Caption = 'Qty. to Handle';
            DecimalPlaces = 0 : 5;
        }
        field(61; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;
        }
        field(70; "Buffer Status"; Option)
        {
            Caption = 'Buffer Status';
            Editable = false;
            OptionCaption = ' ,MODIFY,INSERT';
            OptionMembers = " ",MODIFY,INSERT;
        }
        field(71; "Buffer Status2"; Option)
        {
            Caption = 'Buffer Status2';
            Editable = false;
            OptionCaption = ',ExpDate blocked';
            OptionMembers = ,"ExpDate blocked";
        }
        field(72; "Buffer Value1"; Decimal)
        {
            Caption = 'Buffer Value1';
            Editable = false;
        }
        field(73; "Buffer Value2"; Decimal)
        {
            Caption = 'Buffer Value2';
            Editable = false;
        }
        field(74; "Buffer Value3"; Decimal)
        {
            Caption = 'Buffer Value3';
            Editable = false;
        }
        field(75; "Buffer Value4"; Decimal)
        {
            Caption = 'Buffer Value4';
            Editable = false;
        }
        field(76; "Buffer Value5"; Decimal)
        {
            Caption = 'Buffer Value5';
            Editable = false;
        }
        field(80; "New Serial No."; Code[50])
        {
            Caption = 'New Serial No.';
        }
        field(81; "New Lot No."; Code[50])
        {
            Caption = 'New Lot No.';
        }
        field(900; "Prohibit Cancellation"; Boolean)
        {
            Caption = 'Prohibit Cancellation';
        }
        field(5400; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }
        field(5401; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(5402; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(5811; "Appl.-from Item Entry"; Integer)
        {
            Caption = 'Appl.-from Item Entry';
            MinValue = 0;
        }
        field(5817; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(6505; "New Expiration Date"; Date)
        {
            Caption = 'New Expiration Date';
        }
        field(7300; "Quantity actual Handled (Base)"; Decimal)
        {
            Caption = 'Quantity actual Handled (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Source ID", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Qty. to Handle (Base)", "Qty. to Invoice (Base)", "Quantity Handled (Base)", "Quantity Invoiced (Base)";
        }
        key(Key3; "Lot No.", "Serial No.")
        {
        }
    }

    fieldgroups
    {
    }
}

