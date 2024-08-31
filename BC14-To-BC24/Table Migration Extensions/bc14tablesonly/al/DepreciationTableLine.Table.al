table 5643 "Depreciation Table Line"
{
    Caption = 'Depreciation Table Line';

    fields
    {
        field(1; "Depreciation Table Code"; Code[10])
        {
            Caption = 'Depreciation Table Code';
            NotBlank = true;
            TableRelation = "Depreciation Table Header";
        }
        field(2; "Period No."; Integer)
        {
            Caption = 'Period No.';
            MinValue = 1;
            NotBlank = true;
        }
        field(3; "Period Depreciation %"; Decimal)
        {
            Caption = 'Period Depreciation %';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
        field(4; "No. of Units in Period"; Decimal)
        {
            Caption = 'No. of Units in Period';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Depreciation Table Code", "Period No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

