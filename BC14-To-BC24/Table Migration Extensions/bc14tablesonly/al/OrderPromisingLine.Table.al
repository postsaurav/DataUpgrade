table 99000880 "Order Promising Line"
{
    Caption = 'Order Promising Line';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
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
        field(13; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(14; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            Editable = false;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(15; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(16; "Unavailable Quantity"; Decimal)
        {
            Caption = 'Unavailable Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(17; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(18; "Unavailable Quantity (Base)"; Decimal)
        {
            Caption = 'Unavailable Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(19; "Required Quantity (Base)"; Decimal)
        {
            Caption = 'Required Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(20; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Sales,Requisition Line,Purchase,Item Journal,BOM Journal,Item Ledger Entry,Prod. Order Line,Prod. Order Component,Planning Line,Planning Component,Transfer,Service Order,Job';
            OptionMembers = " ",Sales,"Requisition Line",Purchase,"Item Journal","BOM Journal","Item Ledger Entry","Prod. Order Line","Prod. Order Component","Planning Line","Planning Component",Transfer,"Service Order",Job;
        }
        field(21; "Source Subtype"; Integer)
        {
            Caption = 'Source Subtype';
        }
        field(22; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(23; "Source Batch Name"; Code[10])
        {
            Caption = 'Source Batch Name';
        }
        field(25; "Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(31; "Required Quantity"; Decimal)
        {
            Caption = 'Required Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(40; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
        }
        field(41; "Planned Delivery Date"; Date)
        {
            Caption = 'Planned Delivery Date';
        }
        field(42; "Original Shipment Date"; Date)
        {
            Caption = 'Original Shipment Date';
        }
        field(43; "Earliest Shipment Date"; Date)
        {
            Caption = 'Earliest Shipment Date';
        }
        field(44; "Requested Shipment Date"; Date)
        {
            Caption = 'Requested Shipment Date';
            Editable = false;
        }
        field(45; "Unavailability Date"; Date)
        {
            Caption = 'Unavailability Date';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Requested Shipment Date")
        {
        }
    }

    fieldgroups
    {
    }
}

