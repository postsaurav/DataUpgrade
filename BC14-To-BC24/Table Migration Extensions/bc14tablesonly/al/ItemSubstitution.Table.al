table 5715 "Item Substitution"
{
    Caption = 'Item Substitution';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF (Type = CONST (Item)) Item."No."
            ELSE
            IF (Type = CONST ("Nonstock Item")) "Nonstock Item"."Entry No.";
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(3; "Substitute No."; Code[20])
        {
            Caption = 'Substitute No.';
            NotBlank = true;
            TableRelation = IF ("Substitute Type" = CONST (Item)) Item."No."
            ELSE
            IF ("Substitute Type" = CONST ("Nonstock Item")) "Nonstock Item"."Entry No.";
        }
        field(4; "Substitute Variant Code"; Code[10])
        {
            Caption = 'Substitute Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Substitute No."));
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; Inventory; Decimal)
        {
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
        }
        field(7; Interchangeable; Boolean)
        {
            Caption = 'Interchangeable';
        }
        field(8; Condition; Boolean)
        {
            CalcFormula = Exist ("Substitution Condition" WHERE (Type = FIELD (Type),
                                                                "No." = FIELD ("No."),
                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                "Substitute Type" = FIELD ("Substitute Type"),
                                                                "Substitute No." = FIELD ("Substitute No."),
                                                                "Substitute Variant Code" = FIELD ("Substitute Variant Code")));
            Caption = 'Condition';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(100; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Catalog Item';
            OptionMembers = Item,"Nonstock Item";
        }
        field(101; "Substitute Type"; Option)
        {
            Caption = 'Substitute Type';
            OptionCaption = 'Item,Catalog Item';
            OptionMembers = Item,"Nonstock Item";
        }
        field(102; "Sub. Item No."; Code[20])
        {
            CalcFormula = Lookup ("Nonstock Item"."Item No." WHERE ("Entry No." = FIELD ("Substitute No.")));
            Caption = 'Sub. Item No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(103; "Relations Level"; Integer)
        {
            Caption = 'Relations Level';
            Editable = false;
        }
        field(104; "Quantity Avail. on Shpt. Date"; Decimal)
        {
            Caption = 'Quantity Avail. on Shpt. Date';
            DecimalPlaces = 0 : 5;
        }
        field(105; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
    }

    keys
    {
        key(Key1; Type, "No.", "Variant Code", "Substitute Type", "Substitute No.", "Substitute Variant Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

