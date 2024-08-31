table 24 "Vendor Invoice Disc."
{
    Caption = 'Vendor Invoice Disc.';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Minimum Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Minimum Amount';
            MinValue = 0;
        }
        field(3; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(4; "Service Charge"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Service Charge';
            MinValue = 0;
        }
        field(5; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
    }

    keys
    {
        key(Key1; "Code", "Currency Code", "Minimum Amount")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

