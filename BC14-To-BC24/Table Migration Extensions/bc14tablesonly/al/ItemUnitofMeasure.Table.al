table 5404 "Item Unit of Measure"
{
    Caption = 'Item Unit of Measure';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Unit of Measure";
        }
        field(3; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            InitValue = 1;
        }
        field(7300; Length; Decimal)
        {
            Caption = 'Length';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(7301; Width; Decimal)
        {
            Caption = 'Width';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(7302; Height; Decimal)
        {
            Caption = 'Height';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(7303; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(7304; Weight; Decimal)
        {
            Caption = 'Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Qty. per Unit of Measure")
        {
        }
        key(Key3; "Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Qty. per Unit of Measure")
        {
        }
    }
}

