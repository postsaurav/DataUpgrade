table 99000772 "Production BOM Line"
{
    Caption = 'Production BOM Line';

    fields
    {
        field(1; "Production BOM No."; Code[20])
        {
            Caption = 'Production BOM No.';
            NotBlank = true;
            TableRelation = "Production BOM Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
            TableRelation = "Production BOM Version"."Version Code" WHERE ("Production BOM No." = FIELD ("Production BOM No."));
        }
        field(10; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Item,Production BOM';
            OptionMembers = " ",Item,"Production BOM";
        }
        field(11; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Item)) Item WHERE (Type = FILTER (Inventory | "Non-Inventory"))
            ELSE
            IF (Type = CONST ("Production BOM")) "Production BOM Header";
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            IF (Type = CONST ("Production BOM")) "Unit of Measure";
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
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(22; Comment; Boolean)
        {
            CalcFormula = Exist ("Production BOM Comment Line" WHERE ("Production BOM No." = FIELD ("Production BOM No."),
                                                                     "Version Code" = FIELD ("Version Code"),
                                                                     "BOM Line No." = FIELD ("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(29; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
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
    }

    keys
    {
        key(Key1; "Production BOM No.", "Version Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Type, "No.")
        {
        }
    }

    fieldgroups
    {
    }
}

