table 99000757 "Calendar Entry"
{
    Caption = 'Calendar Entry';

    fields
    {
        field(1; "Capacity Type"; Option)
        {
            Caption = 'Capacity Type';
            OptionCaption = 'Work Center,Machine Center';
            OptionMembers = "Work Center","Machine Center";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF ("Capacity Type" = CONST ("Work Center")) "Work Center"
            ELSE
            IF ("Capacity Type" = CONST ("Machine Center")) "Machine Center";
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            NotBlank = true;
        }
        field(5; "Work Shift Code"; Code[10])
        {
            Caption = 'Work Shift Code';
            NotBlank = true;
            TableRelation = "Work Shift";
        }
        field(6; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
            NotBlank = true;
        }
        field(7; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
            NotBlank = true;
        }
        field(8; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            Editable = false;
            TableRelation = "Work Center";
        }
        field(9; "Work Center Group Code"; Code[10])
        {
            Caption = 'Work Center Group Code';
            Editable = false;
            TableRelation = "Work Center Group";
        }
        field(10; "Capacity (Total)"; Decimal)
        {
            Caption = 'Capacity (Total)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(11; "Capacity (Effective)"; Decimal)
        {
            Caption = 'Capacity (Effective)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(20; Efficiency; Decimal)
        {
            Caption = 'Efficiency';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(21; Capacity; Decimal)
        {
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(22; "Absence Efficiency"; Decimal)
        {
            Caption = 'Absence Efficiency';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(23; "Absence Capacity"; Decimal)
        {
            Caption = 'Absence Capacity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(24; "Starting Date-Time"; DateTime)
        {
            Caption = 'Starting Date-Time';
        }
        field(25; "Ending Date-Time"; DateTime)
        {
            Caption = 'Ending Date-Time';
        }
    }

    keys
    {
        key(Key1; "Capacity Type", "No.", Date, "Starting Time", "Ending Time", "Work Shift Code")
        {
            Clustered = true;
        }
        key(Key2; "Work Center No.", Date, "Work Shift Code")
        {
            SumIndexFields = "Capacity (Total)", "Capacity (Effective)";
        }
        key(Key3; "Work Center Group Code", Date, "Work Shift Code")
        {
            SumIndexFields = "Capacity (Total)", "Capacity (Effective)";
        }
        key(Key4; "Capacity Type", "No.", "Starting Date-Time", "Ending Date-Time", "Absence Capacity")
        {
        }
        key(Key5; "Capacity Type", "No.", "Ending Date-Time", "Starting Date-Time")
        {
        }
    }

    fieldgroups
    {
    }
}

