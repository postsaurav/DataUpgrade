table 5531 "Inventory Page Data"
{
    Caption = 'Inventory Page Data';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(3; "Period Type"; Option)
        {
            Caption = 'Period Type';
            Editable = false;
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(4; "Period Start"; Date)
        {
            Caption = 'Period Start';
            Editable = false;
        }
        field(5; "Period End"; Date)
        {
            Caption = 'Period End';
            Editable = false;
        }
        field(6; "Period No."; Integer)
        {
            Caption = 'Period No.';
            Editable = false;
        }
        field(7; Level; Integer)
        {
            Caption = 'Level';
            Editable = false;
        }
        field(9; "Source Line ID"; RecordID)
        {
            Caption = 'Source Line ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            Editable = false;
            TableRelation = Item;
        }
        field(11; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            Editable = false;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(12; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            Editable = false;
            TableRelation = Location;
        }
        field(13; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(14; "Availability Date"; Date)
        {
            Caption = 'Availability Date';
            Editable = false;
        }
        field(15; Type; Option)
        {
            Caption = 'Type';
            Editable = false;
            OptionCaption = ' ,Purchase,Sale,Purch. Return,Sales Return,Transfer,Component,Production,Service,Job,Forecast,Blanket Sales Order,Plan,Plan Revert,Assembly Order,Assembly Component';
            OptionMembers = " ",Purchase,Sale,"Purch. Return","Sales Return",Transfer,Component,Production,Service,Job,Forecast,"Blanket Sales Order",Plan,"Plan Revert","Assembly Order","Assembly Component";
        }
        field(16; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(19; Source; Text[100])
        {
            Caption = 'Source';
            Editable = false;
        }
        field(20; "Remaining Quantity (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Remaining Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(21; Positive; Boolean)
        {
            Caption = 'Positive';
            Editable = false;
        }
        field(22; "Gross Requirement"; Decimal)
        {
            BlankZero = true;
            Caption = 'Gross Requirement';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(23; "Scheduled Receipt"; Decimal)
        {
            BlankZero = true;
            Caption = 'Scheduled Receipt';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(24; Forecast; Decimal)
        {
            BlankZero = true;
            Caption = 'Forecast';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(25; "Remaining Forecast"; Decimal)
        {
            BlankZero = true;
            Caption = 'Remaining Forecast';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(26; "Action Message Qty."; Decimal)
        {
            BlankZero = true;
            Caption = 'Action Message Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(29; "Action Message"; Option)
        {
            Caption = 'Action Message';
            Editable = false;
            OptionCaption = ' ,New,Change Qty.,Reschedule,Resched. & Chg. Qty.,Cancel';
            OptionMembers = " ",New,"Change Qty.",Reschedule,"Resched. & Chg. Qty.",Cancel;
        }
        field(30; "Source Document ID"; RecordID)
        {
            Caption = 'Source Document ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(31; "Attached to Line No."; Integer)
        {
            Caption = 'Attached to Line No.';
            Editable = false;
        }
        field(34; "Ref. Order No."; Code[20])
        {
            Caption = 'Ref. Order No.';
            Editable = false;
        }
        field(36; "Projected Inventory"; Decimal)
        {
            Caption = 'Projected Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(37; "Forecasted Projected Inventory"; Decimal)
        {
            Caption = 'Forecasted Projected Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(38; "Suggested Projected Inventory"; Decimal)
        {
            Caption = 'Suggested Projected Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(39; "Reserved Requirement"; Decimal)
        {
            BlankZero = true;
            Caption = 'Reserved Requirement';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(40; "Reserved Receipt"; Decimal)
        {
            BlankZero = true;
            Caption = 'Reserved Receipt';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
        }
        key(Key2; "Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key3; "Period Start", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

