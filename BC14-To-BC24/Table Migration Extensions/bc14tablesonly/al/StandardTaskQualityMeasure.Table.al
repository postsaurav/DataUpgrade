table 99000784 "Standard Task Quality Measure"
{
    Caption = 'Standard Task Quality Measure';

    fields
    {
        field(1; "Standard Task Code"; Code[10])
        {
            Caption = 'Standard Task Code';
            NotBlank = true;
            TableRelation = "Standard Task";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(9; "Qlty Measure Code"; Code[10])
        {
            Caption = 'Qlty Measure Code';
            TableRelation = "Quality Measure";
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Min. Value"; Decimal)
        {
            Caption = 'Min. Value';
            DecimalPlaces = 0 : 5;
        }
        field(12; "Max. Value"; Decimal)
        {
            Caption = 'Max. Value';
            DecimalPlaces = 0 : 5;
        }
        field(13; "Mean Tolerance"; Decimal)
        {
            Caption = 'Mean Tolerance';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "Standard Task Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

