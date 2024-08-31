table 6550 "Whse. Item Tracking Line"
{
    Caption = 'Whse. Item Tracking Line';

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
        field(24; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(29; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
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
        field(70; "Buffer Status"; Option)
        {
            Caption = 'Buffer Status';
            Editable = false;
            OptionCaption = ' ,MODIFY';
            OptionMembers = " ",MODIFY;
        }
        field(71; "Buffer Status2"; Option)
        {
            Caption = 'Buffer Status2';
            Editable = false;
            OptionCaption = ',ExpDate blocked';
            OptionMembers = ,"ExpDate blocked";
        }
        field(80; "New Serial No."; Code[50])
        {
            Caption = 'New Serial No.';
        }
        field(81; "New Lot No."; Code[50])
        {
            Caption = 'New Lot No.';
        }
        field(90; "Source Type Filter"; Option)
        {
            Caption = 'Source Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Receipt,Shipment,Internal Put-away,Internal Pick,Production,Movement Worksheet,Assembly';
            OptionMembers = " ",Receipt,Shipment,"Internal Put-away","Internal Pick",Production,"Movement Worksheet",Assembly;
        }
        field(91; "Qty. Registered (Base)"; Decimal)
        {
            Caption = 'Qty. Registered (Base)';
        }
        field(92; "Put-away Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = FILTER ("Put-away"),
                                                                                         "Whse. Document Type" = FIELD ("Source Type Filter"),
                                                                                         "Whse. Document No." = FIELD ("Source ID"),
                                                                                         "Whse. Document Line No." = FIELD ("Source Ref. No."),
                                                                                         "Serial No." = FIELD ("Serial No."),
                                                                                         "Lot No." = FIELD ("Lot No."),
                                                                                         "Action Type" = FILTER (" " | Take)));
            Caption = 'Put-away Qty. (Base)';
            FieldClass = FlowField;
        }
        field(93; "Pick Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = FILTER (Pick | Movement),
                                                                                         "Whse. Document Type" = FIELD ("Source Type Filter"),
                                                                                         "Whse. Document No." = FIELD ("Source ID"),
                                                                                         "Whse. Document Line No." = FIELD ("Source Ref. No."),
                                                                                         "Serial No." = FIELD ("Serial No."),
                                                                                         "Lot No." = FIELD ("Lot No."),
                                                                                         "Action Type" = FILTER (" " | Place)));
            Caption = 'Pick Qty. (Base)';
            FieldClass = FlowField;
        }
        field(94; "Created by Whse. Activity Line"; Boolean)
        {
            Caption = 'Created by Whse. Activity Line';
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
        field(6505; "New Expiration Date"; Date)
        {
            Caption = 'New Expiration Date';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Source ID", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.", "Location Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Quantity (Base)", "Qty. to Handle (Base)", "Qty. to Invoice (Base)", "Quantity Handled (Base)", "Quantity Invoiced (Base)";
        }
        key(Key3; "Serial No.", "Lot No.")
        {
        }
    }

    fieldgroups
    {
    }
}

