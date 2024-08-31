table 7334 "Whse. Internal Pick Line"
{
    Caption = 'Whse. Internal Pick Line';

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
        field(12; "To Bin Code"; Code[20])
        {
            Caption = 'To Bin Code';
            TableRelation = IF ("To Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("To Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                  "Zone Code" = FIELD ("To Zone Code"));
        }
        field(13; "To Zone Code"; Code[10])
        {
            Caption = 'To Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
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
        field(27; "Pick Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Activity Type" = CONST (Pick),
                                                                                  "Whse. Document Type" = CONST ("Internal Pick"),
                                                                                  "Whse. Document No." = FIELD ("No."),
                                                                                  "Whse. Document Line No." = FIELD ("Line No."),
                                                                                  "Action Type" = FILTER (" " | Place),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Original Breakbulk" = CONST (false),
                                                                                  "Breakbulk No." = CONST (0)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Pick Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = CONST (Pick),
                                                                                         "Whse. Document Type" = CONST ("Internal Pick"),
                                                                                         "Whse. Document No." = FIELD ("No."),
                                                                                         "Whse. Document Line No." = FIELD ("Line No."),
                                                                                         "Action Type" = FILTER (" " | Place),
                                                                                         "Original Breakbulk" = CONST (false),
                                                                                         "Breakbulk No." = CONST (0)));
            Caption = 'Pick Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            NotBlank = true;
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
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(32; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(33; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(34; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = ' ,Partially Picked,Completely Picked';
            OptionMembers = " ","Partially Picked","Completely Picked";
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
        field(37; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
        }
        field(38; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
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
        }
        key(Key3; "No.", "Item No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key4; "No.", "Shelf No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; "No.", "To Bin Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key6; "No.", "Due Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key7; "To Bin Code", "Location Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. Outstanding", Cubage, Weight;
        }
    }

    fieldgroups
    {
    }
}

