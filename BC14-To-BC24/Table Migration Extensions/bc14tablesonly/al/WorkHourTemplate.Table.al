table 5954 "Work-Hour Template"
{
    Caption = 'Work-Hour Template';
    ReplicateData = false;

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
        field(3; Monday; Decimal)
        {
            Caption = 'Monday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(4; Tuesday; Decimal)
        {
            Caption = 'Tuesday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(5; Wednesday; Decimal)
        {
            Caption = 'Wednesday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(6; Thursday; Decimal)
        {
            Caption = 'Thursday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(7; Friday; Decimal)
        {
            Caption = 'Friday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(8; Saturday; Decimal)
        {
            Caption = 'Saturday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(9; Sunday; Decimal)
        {
            Caption = 'Sunday';
            DecimalPlaces = 0 : 5;
            MaxValue = 24;
            MinValue = 0;
        }
        field(10; "Total per Week"; Decimal)
        {
            Caption = 'Total per Week';
            DecimalPlaces = 0 : 5;
            Editable = false;
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

