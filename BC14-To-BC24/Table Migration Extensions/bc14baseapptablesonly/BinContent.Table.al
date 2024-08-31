table 7302 "Bin Content"
{
    Caption = 'Bin Content';

    fields
    {
        field(1; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location;
        }
        field(2; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            Editable = false;
            NotBlank = true;
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(3; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            NotBlank = true;
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(10; "Bin Type Code"; Code[10])
        {
            Caption = 'Bin Type Code';
            Editable = false;
            TableRelation = "Bin Type";
        }
        field(11; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            Editable = false;
            TableRelation = "Warehouse Class";
        }
        field(12; "Block Movement"; Option)
        {
            Caption = 'Block Movement';
            OptionCaption = ' ,Inbound,Outbound,All';
            OptionMembers = " ",Inbound,Outbound,All;
        }
        field(15; "Min. Qty."; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(16; "Max. Qty."; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(21; "Bin Ranking"; Integer)
        {
            Caption = 'Bin Ranking';
            Editable = false;
        }
        field(26; Quantity; Decimal)
        {
            CalcFormula = Sum ("Warehouse Entry".Quantity WHERE ("Location Code" = FIELD ("Location Code"),
                                                                "Bin Code" = FIELD ("Bin Code"),
                                                                "Item No." = FIELD ("Item No."),
                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                "Lot No." = FIELD ("Lot No. Filter"),
                                                                "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Pick Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                  "Bin Code" = FIELD ("Bin Code"),
                                                                                  "Item No." = FIELD ("Item No."),
                                                                                  "Variant Code" = FIELD ("Variant Code"),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = CONST (Take),
                                                                                  "Lot No." = FIELD ("Lot No. Filter"),
                                                                                  "Serial No." = FIELD ("Serial No. Filter"),
                                                                                  "Assemble to Order" = CONST (false)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Neg. Adjmt. Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Journal Line"."Qty. (Absolute)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                "From Bin Code" = FIELD ("Bin Code"),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                "Lot No." = FIELD ("Lot No. Filter"),
                                                                                "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Neg. Adjmt. Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Put-away Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                  "Bin Code" = FIELD ("Bin Code"),
                                                                                  "Item No." = FIELD ("Item No."),
                                                                                  "Variant Code" = FIELD ("Variant Code"),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = CONST (Place),
                                                                                  "Lot No." = FIELD ("Lot No. Filter"),
                                                                                  "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Put-away Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Pos. Adjmt. Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Journal Line"."Qty. (Absolute)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                "To Bin Code" = FIELD ("Bin Code"),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                "Lot No." = FIELD ("Lot No. Filter"),
                                                                                "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Pos. Adjmt. Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Fixed"; Boolean)
        {
            Caption = 'Fixed';
        }
        field(40; "Cross-Dock Bin"; Boolean)
        {
            Caption = 'Cross-Dock Bin';
        }
        field(41; Default; Boolean)
        {
            Caption = 'Default';
        }
        field(50; "Quantity (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Entry"."Qty. (Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                     "Bin Code" = FIELD ("Bin Code"),
                                                                     "Item No." = FIELD ("Item No."),
                                                                     "Variant Code" = FIELD ("Variant Code"),
                                                                     "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                     "Lot No." = FIELD ("Lot No. Filter"),
                                                                     "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "Pick Quantity (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                         "Bin Code" = FIELD ("Bin Code"),
                                                                                         "Item No." = FIELD ("Item No."),
                                                                                         "Variant Code" = FIELD ("Variant Code"),
                                                                                         "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                                         "Action Type" = CONST (Take),
                                                                                         "Lot No." = FIELD ("Lot No. Filter"),
                                                                                         "Serial No." = FIELD ("Serial No. Filter"),
                                                                                         "Assemble to Order" = CONST (false)));
            Caption = 'Pick Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Negative Adjmt. Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Journal Line"."Qty. (Absolute, Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                      "From Bin Code" = FIELD ("Bin Code"),
                                                                                      "Item No." = FIELD ("Item No."),
                                                                                      "Variant Code" = FIELD ("Variant Code"),
                                                                                      "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                      "Lot No." = FIELD ("Lot No. Filter"),
                                                                                      "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Negative Adjmt. Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Put-away Quantity (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                         "Bin Code" = FIELD ("Bin Code"),
                                                                                         "Item No." = FIELD ("Item No."),
                                                                                         "Variant Code" = FIELD ("Variant Code"),
                                                                                         "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                         "Action Type" = CONST (Place),
                                                                                         "Lot No." = FIELD ("Lot No. Filter"),
                                                                                         "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Put-away Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Positive Adjmt. Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Journal Line"."Qty. (Absolute, Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                      "To Bin Code" = FIELD ("Bin Code"),
                                                                                      "Item No." = FIELD ("Item No."),
                                                                                      "Variant Code" = FIELD ("Variant Code"),
                                                                                      "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                      "Lot No." = FIELD ("Lot No. Filter"),
                                                                                      "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Positive Adjmt. Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "ATO Components Pick Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                  "Bin Code" = FIELD ("Bin Code"),
                                                                                  "Item No." = FIELD ("Item No."),
                                                                                  "Variant Code" = FIELD ("Variant Code"),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = CONST (Take),
                                                                                  "Lot No." = FIELD ("Lot No. Filter"),
                                                                                  "Serial No." = FIELD ("Serial No. Filter"),
                                                                                  "Assemble to Order" = CONST (true),
                                                                                  "ATO Component" = CONST (true)));
            Caption = 'ATO Components Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "ATO Components Pick Qty (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                         "Bin Code" = FIELD ("Bin Code"),
                                                                                         "Item No." = FIELD ("Item No."),
                                                                                         "Variant Code" = FIELD ("Variant Code"),
                                                                                         "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                         "Action Type" = CONST (Take),
                                                                                         "Lot No." = FIELD ("Lot No. Filter"),
                                                                                         "Serial No." = FIELD ("Serial No. Filter"),
                                                                                         "Assemble to Order" = CONST (true),
                                                                                         "ATO Component" = CONST (true)));
            Caption = 'ATO Components Pick Qty (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            NotBlank = true;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(6500; "Lot No. Filter"; Code[50])
        {
            Caption = 'Lot No. Filter';
            FieldClass = FlowFilter;
        }
        field(6501; "Serial No. Filter"; Code[50])
        {
            Caption = 'Serial No. Filter';
            FieldClass = FlowFilter;
        }
        field(6502; Dedicated; Boolean)
        {
            Caption = 'Dedicated';
            Editable = false;
        }
        field(6503; "Unit of Measure Filter"; Code[10])
        {
            Caption = 'Unit of Measure Filter';
            FieldClass = FlowFilter;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
    }

    keys
    {
        key(Key1; "Location Code", "Bin Code", "Item No.", "Variant Code", "Unit of Measure Code")
        {
            Clustered = true;
        }
        key(Key2; "Bin Type Code")
        {
        }
        key(Key3; "Location Code", "Item No.", "Variant Code", "Cross-Dock Bin", "Qty. per Unit of Measure", "Bin Ranking")
        {
        }
        key(Key4; "Location Code", "Warehouse Class Code", "Fixed", "Bin Ranking")
        {
        }
        key(Key5; "Location Code", "Item No.", "Variant Code", "Warehouse Class Code", "Fixed", "Bin Ranking")
        {
        }
        key(Key6; "Item No.")
        {
        }
        key(Key7; Default, "Location Code", "Item No.", "Variant Code", "Bin Code")
        {
        }
    }

    fieldgroups
    {
    }
}

