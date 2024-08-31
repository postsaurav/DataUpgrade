table 205 "Resource Unit of Measure"
{
    Caption = 'Resource Unit of Measure';

    fields
    {
        field(1; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            NotBlank = true;
            TableRelation = Resource;
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
        field(4; "Related to Base Unit of Meas."; Boolean)
        {
            Caption = 'Related to Base Unit of Meas.';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Resource No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

