table 5876 "Phys. Invt. Order Line"
{
    Caption = 'Phys. Invt. Order Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Phys. Invt. Order Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(12; "On Recording Lines"; Boolean)
        {
            Caption = 'On Recording Lines';
            Editable = false;
        }
        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(21; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(22; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(23; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(31; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(32; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
        }
        field(40; "Base Unit of Measure Code"; Code[10])
        {
            Caption = 'Base Unit of Measure Code';
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(50; "Qty. Expected (Base)"; Decimal)
        {
            Caption = 'Qty. Expected (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(51; "Qty. Exp. Calculated"; Boolean)
        {
            Caption = 'Qty. Exp. Calculated';
            Editable = false;
        }
        field(52; "Qty. Exp. Item Tracking (Base)"; Decimal)
        {
            CalcFormula = Sum ("Exp. Phys. Invt. Tracking"."Quantity (Base)" WHERE ("Order No" = FIELD ("Document No."),
                                                                                   "Order Line No." = FIELD ("Line No.")));
            Caption = 'Qty. Exp. Item Tracking (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Use Item Tracking"; Boolean)
        {
            Caption = 'Use Item Tracking';
        }
        field(55; "Last Item Ledger Entry No."; Integer)
        {
            Caption = 'Last Item Ledger Entry No.';
            Editable = false;
            TableRelation = "Item Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(60; "Unit Amount"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Amount';
        }
        field(62; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(70; "No. Finished Rec.-Lines"; Integer)
        {
            Caption = 'No. Finished Rec.-Lines';
            Editable = false;
        }
        field(71; "Qty. Recorded (Base)"; Decimal)
        {
            Caption = 'Qty. Recorded (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(72; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(73; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            Editable = false;
            OptionCaption = ' ,Positive Adjmt.,Negative Adjmt.';
            OptionMembers = " ","Positive Adjmt.","Negative Adjmt.";
        }
        field(74; "Pos. Qty. (Base)"; Decimal)
        {
            Caption = 'Pos. Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(75; "Neg. Qty. (Base)"; Decimal)
        {
            Caption = 'Neg. Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(76; "Without Difference"; Boolean)
        {
            Caption = 'Without Difference';
            Editable = false;
        }
        field(80; "Recorded Without Order"; Boolean)
        {
            Caption = 'Recorded Without Order';
            Editable = false;
        }
        field(90; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(91; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(100; "Shelf No."; Code[10])
        {
            Caption = 'Shelf No.';
        }
        field(110; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(111; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(112; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(5704; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(7380; "Phys Invt Counting Period Code"; Code[10])
        {
            Caption = 'Phys Invt Counting Period Code';
            Editable = false;
            TableRelation = "Phys. Invt. Counting Period";
        }
        field(7381; "Phys Invt Counting Period Type"; Option)
        {
            Caption = 'Phys Invt Counting Period Type';
            Editable = false;
            OptionCaption = ' ,Item,SKU';
            OptionMembers = " ",Item,SKU;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.", "Item No.", "Variant Code", "Location Code", "Bin Code")
        {
        }
        key(Key3; "Document No.", "Entry Type", "Without Difference")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No.", "Line No.", Description)
        {
        }
    }
}

