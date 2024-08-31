table 99 "Item Vendor"
{
    Caption = 'Item Vendor';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            NotBlank = true;
            TableRelation = Vendor;
        }
        field(6; "Lead Time Calculation"; DateFormula)
        {
            Caption = 'Lead Time Calculation';
        }
        field(7; "Vendor Item No."; Text[20])
        {
            Caption = 'Vendor Item No.';
        }
        field(5700; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Item No.", "Variant Code")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Variant Code", "Vendor No.")
        {
        }
        key(Key3; "Vendor No.", "Vendor Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

