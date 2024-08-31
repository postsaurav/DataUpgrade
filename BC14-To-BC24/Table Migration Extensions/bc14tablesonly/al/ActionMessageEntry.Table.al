table 99000849 "Action Message Entry"
{
    Caption = 'Action Message Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ',New,Change Qty.,Reschedule,Resched. & Chg. Qty.,Cancel';
            OptionMembers = ,New,"Change Qty.",Reschedule,"Resched. & Chg. Qty.",Cancel;
        }
        field(3; "Reservation Entry"; Integer)
        {
            Caption = 'Reservation Entry';
            TableRelation = "Reservation Entry"."Entry No.";
        }
        field(4; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(5; "New Date"; Date)
        {
            Caption = 'New Date';
        }
        field(6; Calculation; Option)
        {
            Caption = 'Calculation';
            OptionCaption = 'Sum,None';
            OptionMembers = "Sum","None";
        }
        field(7; "Suppressed Action Msg."; Boolean)
        {
            Caption = 'Suppressed Action Msg.';
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
        field(16; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(17; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(18; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(19; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Reservation Entry", Calculation)
        {
            SumIndexFields = Quantity;
        }
        key(Key3; "Source Type", "Source Subtype", "Source ID", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.", "Item No.", "Location Code", "Bin Code", "Variant Code")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}

