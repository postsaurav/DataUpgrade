table 5642 "Depreciation Table Header"
{
    Caption = 'Depreciation Table Header';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Month,Period,Quarter,Year';
            OptionMembers = Month,Period,Quarter,Year;
        }
        field(4; "Total No. of Units"; Decimal)
        {
            Caption = 'Total No. of Units';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

