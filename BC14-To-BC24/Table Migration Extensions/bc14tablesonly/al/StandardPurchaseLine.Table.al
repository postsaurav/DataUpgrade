table 174 "Standard Purchase Line"
{
    Caption = 'Standard Purchase Line';

    fields
    {
        field(1; "Standard Purchase Code"; Code[10])
        {
            Caption = 'Standard Purchase Code';
            Editable = false;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (" ")) "Standard Text"
            ELSE
            IF (Type = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST (Item)) Item WHERE (Blocked = CONST (false))
            ELSE
            IF (Type = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST ("Charge (Item)")) "Item Charge";
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Quantity; Decimal)
        {
            BlankZero = true;
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(7; "Amount Excl. VAT"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Amount Excl. VAT';
        }
        field(8; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(9; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(11; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Standard Purchase Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

