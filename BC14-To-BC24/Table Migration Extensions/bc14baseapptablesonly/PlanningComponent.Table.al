table 99000829 "Planning Component"
{
    Caption = 'Planning Component';

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            TableRelation = "Req. Wksh. Template";
        }
        field(2; "Worksheet Batch Name"; Code[10])
        {
            Caption = 'Worksheet Batch Name';
            TableRelation = "Requisition Wksh. Name".Name WHERE ("Worksheet Template Name" = FIELD ("Worksheet Template Name"));
        }
        field(3; "Worksheet Line No."; Integer)
        {
            Caption = 'Worksheet Line No.';
            TableRelation = "Requisition Line"."Line No." WHERE ("Worksheet Template Name" = FIELD ("Worksheet Template Name"),
                                                                 "Journal Batch Name" = FIELD ("Worksheet Batch Name"));
        }
        field(5; "Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Line No.';
        }
        field(11; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item WHERE (Type = FILTER (Inventory | "Non-Inventory"));
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(14; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(15; Position; Code[10])
        {
            Caption = 'Position';
        }
        field(16; "Position 2"; Code[10])
        {
            Caption = 'Position 2';
        }
        field(17; "Position 3"; Code[10])
        {
            Caption = 'Position 3';
        }
        field(18; "Lead-Time Offset"; DateFormula)
        {
            Caption = 'Lead-Time Offset';
        }
        field(19; "Routing Link Code"; Code[10])
        {
            Caption = 'Routing Link Code';
            TableRelation = "Routing Link";
        }
        field(20; "Scrap %"; Decimal)
        {
            BlankNumbers = BlankNeg;
            Caption = 'Scrap %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
        }
        field(21; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(25; "Expected Quantity"; Decimal)
        {
            Caption = 'Expected Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(28; "Flushing Method"; Option)
        {
            Caption = 'Flushing Method';
            OptionCaption = 'Manual,Forward,Backward,Pick + Forward,Pick + Backward';
            OptionMembers = Manual,Forward,Backward,"Pick + Forward","Pick + Backward";
        }
        field(30; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(31; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(32; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(33; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(35; "Supplied-by Line No."; Integer)
        {
            Caption = 'Supplied-by Line No.';
            TableRelation = "Requisition Line"."Line No." WHERE ("Worksheet Template Name" = FIELD ("Worksheet Template Name"),
                                                                 "Journal Batch Name" = FIELD ("Worksheet Batch Name"),
                                                                 "Line No." = FIELD ("Supplied-by Line No."));
        }
        field(36; "Planning Level Code"; Integer)
        {
            Caption = 'Planning Level Code';
            Editable = false;
        }
        field(37; "Ref. Order Status"; Option)
        {
            Caption = 'Ref. Order Status';
            OptionCaption = 'Simulated,Planned,Firm Planned,Released';
            OptionMembers = Simulated,Planned,"Firm Planned",Released;
        }
        field(38; "Ref. Order No."; Code[20])
        {
            Caption = 'Ref. Order No.';
        }
        field(39; "Ref. Order Line No."; Integer)
        {
            Caption = 'Ref. Order Line No.';
        }
        field(40; Length; Decimal)
        {
            Caption = 'Length';
            DecimalPlaces = 0 : 5;
        }
        field(41; Width; Decimal)
        {
            Caption = 'Width';
            DecimalPlaces = 0 : 5;
        }
        field(42; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
        }
        field(43; Depth; Decimal)
        {
            Caption = 'Depth';
            DecimalPlaces = 0 : 5;
        }
        field(44; "Calculation Formula"; Option)
        {
            Caption = 'Calculation Formula';
            OptionCaption = ' ,Length,Length * Width,Length * Width * Depth,Weight';
            OptionMembers = " ",Length,"Length * Width","Length * Width * Depth",Weight;
        }
        field(45; "Quantity per"; Decimal)
        {
            Caption = 'Quantity per';
            DecimalPlaces = 0 : 5;
        }
        field(46; "Ref. Order Type"; Option)
        {
            Caption = 'Ref. Order Type';
            Editable = false;
            OptionCaption = ' ,Purchase,Prod. Order,Transfer,Assembly';
            OptionMembers = " ",Purchase,"Prod. Order",Transfer,Assembly;
        }
        field(50; "Unit Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Unit Cost';
        }
        field(51; "Cost Amount"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Cost Amount';
        }
        field(52; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(53; "Due Time"; Time)
        {
            Caption = 'Due Time';
        }
        field(55; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
            DecimalPlaces = 2 : 5;
        }
        field(56; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
        }
        field(57; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 0 : 5;
        }
        field(58; "Direct Cost Amount"; Decimal)
        {
            Caption = 'Direct Cost Amount';
            DecimalPlaces = 2 : 2;
        }
        field(59; "Overhead Amount"; Decimal)
        {
            Caption = 'Overhead Amount';
            DecimalPlaces = 2 : 2;
        }
        field(60; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(62; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(63; "Reserved Qty. (Base)"; Decimal)
        {
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Source ID" = FIELD ("Worksheet Template Name"),
                                                                            "Source Ref. No." = FIELD ("Line No."),
                                                                            "Source Type" = CONST (99000829),
                                                                            "Source Subtype" = CONST ("0"),
                                                                            "Source Batch Name" = FIELD ("Worksheet Batch Name"),
                                                                            "Source Prod. Order Line" = FIELD ("Worksheet Line No."),
                                                                            "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(71; "Reserved Quantity"; Decimal)
        {
            CalcFormula = - Sum ("Reservation Entry".Quantity WHERE ("Source ID" = FIELD ("Worksheet Template Name"),
                                                                   "Source Ref. No." = FIELD ("Line No."),
                                                                   "Source Type" = CONST (99000829),
                                                                   "Source Subtype" = CONST ("0"),
                                                                   "Source Batch Name" = FIELD ("Worksheet Batch Name"),
                                                                   "Source Prod. Order Line" = FIELD ("Worksheet Line No."),
                                                                   "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(73; "Expected Quantity (Base)"; Decimal)
        {
            Caption = 'Expected Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(74; "Original Expected Qty. (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Original Expected Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(75; "Net Quantity (Base)"; Decimal)
        {
            Caption = 'Net Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(76; "Due Date-Time"; DateTime)
        {
            Caption = 'Due Date-Time';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(99000875; Critical; Boolean)
        {
            Caption = 'Critical';
        }
        field(99000915; "Planning Line Origin"; Option)
        {
            Caption = 'Planning Line Origin';
            Editable = false;
            OptionCaption = ' ,Action Message,Planning,Order Planning';
            OptionMembers = " ","Action Message",Planning,"Order Planning";
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", "Worksheet Batch Name", "Worksheet Line No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Variant Code", "Location Code", "Due Date", "Planning Line Origin")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Expected Quantity (Base)", "Cost Amount";
        }
        key(Key3; "Item No.", "Variant Code", "Location Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Planning Line Origin", "Due Date")
        {
            Enabled = false;
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Expected Quantity (Base)", "Cost Amount";
        }
        key(Key4; "Worksheet Template Name", "Worksheet Batch Name", "Worksheet Line No.", "Item No.")
        {
            MaintainSQLIndex = false;
        }
    }

    fieldgroups
    {
    }
}

