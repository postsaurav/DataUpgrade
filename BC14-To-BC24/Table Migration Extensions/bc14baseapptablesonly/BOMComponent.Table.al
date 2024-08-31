table 90 "BOM Component"
{
    Caption = 'BOM Component';

    fields
    {
        field(1; "Parent Item No."; Code[20])
        {
            Caption = 'Parent Item No.';
            NotBlank = true;
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Item,Resource';
            OptionMembers = " ",Item,Resource;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Item)) Item WHERE (Type = FILTER (Inventory | "Non-Inventory"))
            ELSE
            IF (Type = CONST (Resource)) Resource;
        }
        field(5; "Assembly BOM"; Boolean)
        {
            CalcFormula = Exist ("BOM Component" WHERE ("Parent Item No." = FIELD ("No.")));
            Caption = 'Assembly BOM';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            IF (Type = CONST (Resource)) "Resource Unit of Measure".Code WHERE ("Resource No." = FIELD ("No."));
        }
        field(8; "Quantity per"; Decimal)
        {
            Caption = 'Quantity per';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(9; Position; Code[10])
        {
            Caption = 'Position';
        }
        field(10; "Position 2"; Code[10])
        {
            Caption = 'Position 2';
        }
        field(11; "Position 3"; Code[10])
        {
            Caption = 'Position 3';
        }
        field(12; "Machine No."; Code[10])
        {
            Caption = 'Machine No.';
        }
        field(13; "Lead-Time Offset"; DateFormula)
        {
            Caption = 'Lead-Time Offset';
        }
        field(14; "BOM Description"; Text[100])
        {
            CalcFormula = Lookup (Item.Description WHERE ("No." = FIELD ("Parent Item No.")));
            Caption = 'BOM Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Resource Usage Type"; Option)
        {
            Caption = 'Resource Usage Type';
            OptionCaption = 'Direct,Fixed';
            OptionMembers = Direct,"Fixed";
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5900; "Installed in Line No."; Integer)
        {
            Caption = 'Installed in Line No.';
        }
        field(5901; "Installed in Item No."; Code[20])
        {
            Caption = 'Installed in Item No.';
            TableRelation = IF (Type = CONST (Item)) Item;
        }
    }

    keys
    {
        key(Key1; "Parent Item No.", "Line No.")
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

