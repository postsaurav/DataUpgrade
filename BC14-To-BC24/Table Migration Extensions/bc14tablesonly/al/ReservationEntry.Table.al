table 337 "Reservation Entry"
{
    Caption = 'Reservation Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
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
        field(5; "Reservation Status"; Option)
        {
            Caption = 'Reservation Status';
            OptionCaption = 'Reservation,Tracking,Surplus,Prospect';
            OptionMembers = Reservation,Tracking,Surplus,Prospect;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(9; "Transferred from Entry No."; Integer)
        {
            Caption = 'Transferred from Entry No.';
            TableRelation = "Reservation Entry";
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
            Editable = false;
            TableRelation = "Item Ledger Entry";
        }
        field(22; "Expected Receipt Date"; Date)
        {
            Caption = 'Expected Receipt Date';
        }
        field(23; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(24; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(25; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(27; "Changed By"; Code[50])
        {
            Caption = 'Changed By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(28; Positive; Boolean)
        {
            Caption = 'Positive';
            Editable = false;
        }
        field(29; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(30; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(31; "Action Message Adjustment"; Decimal)
        {
            CalcFormula = Sum ("Action Message Entry".Quantity WHERE ("Reservation Entry" = FIELD ("Entry No."),
                                                                     Calculation = CONST (Sum)));
            Caption = 'Action Message Adjustment';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; Binding; Option)
        {
            Caption = 'Binding';
            Editable = false;
            OptionCaption = ' ,Order-to-Order';
            OptionMembers = " ","Order-to-Order";
        }
        field(33; "Suppressed Action Msg."; Boolean)
        {
            Caption = 'Suppressed Action Msg.';
        }
        field(34; "Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            OptionCaption = 'Unlimited,None';
            OptionMembers = Unlimited,"None";
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            Caption = 'Appl.-to Item Entry';
        }
        field(40; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
            Editable = false;
        }
        field(41; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            Editable = false;
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
        field(53; "Quantity Invoiced (Base)"; Decimal)
        {
            Caption = 'Quantity Invoiced (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(80; "New Serial No."; Code[50])
        {
            Caption = 'New Serial No.';
            Editable = false;
        }
        field(81; "New Lot No."; Code[50])
        {
            Caption = 'New Lot No.';
            Editable = false;
        }
        field(900; "Disallow Cancellation"; Boolean)
        {
            Caption = 'Disallow Cancellation';
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
            Editable = false;
        }
        field(6510; "Item Tracking"; Option)
        {
            Caption = 'Item Tracking';
            Editable = false;
            OptionCaption = 'None,Lot No.,Lot and Serial No.,Serial No.';
            OptionMembers = "None","Lot No.","Lot and Serial No.","Serial No.";
        }
        field(6511; "Untracked Surplus"; Boolean)
        {
            Caption = 'Untracked Surplus';
        }
    }

    keys
    {
        key(Key1; "Entry No.", Positive)
        {
            Clustered = true;
        }
        key(Key2; "Source ID", "Source Ref. No.", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Reservation Status", "Shipment Date", "Expected Receipt Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Quantity (Base)", Quantity, "Qty. to Handle (Base)", "Qty. to Invoice (Base)";
        }
        key(Key3; "Item No.", "Variant Code", "Location Code")
        {
            MaintainSIFTIndex = false;
        }
        key(Key4; "Item No.", "Variant Code", "Location Code", "Reservation Status", "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Quantity (Base)";
        }
        key(Key5; "Item No.", "Source Type", "Source Subtype", "Reservation Status", "Location Code", "Variant Code", "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Quantity (Base)", Quantity;
        }
        key(Key6; "Item No.", "Variant Code", "Location Code", "Item Tracking", "Reservation Status", "Lot No.", "Serial No.")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Quantity (Base)";
        }
        key(Key7; "Lot No.")
        {
            Enabled = false;
        }
        key(Key8; "Serial No.")
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Positive, "Item No.", Description, Quantity)
        {
        }
    }
}

