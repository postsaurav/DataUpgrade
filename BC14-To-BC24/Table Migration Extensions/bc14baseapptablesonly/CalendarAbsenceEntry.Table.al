table 99000760 "Calendar Absence Entry"
{
    Caption = 'Calendar Absence Entry';

    fields
    {
        field(1; "Capacity Type"; Option)
        {
            Caption = 'Capacity Type';
            Editable = false;
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
        field(6; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(7; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
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
        field(21; Capacity; Decimal)
        {
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
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
        field(31; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(32; Updated; Boolean)
        {
            Caption = 'Updated';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Capacity Type", "No.", Date, "Starting Time", "Ending Time")
        {
            Clustered = true;
        }
        key(Key2; "Work Center No.")
        {
        }
        key(Key3; "Capacity Type", "No.", Date, "Starting Date-Time", "Ending Date-Time")
        {
        }
    }

    fieldgroups
    {
    }
}

