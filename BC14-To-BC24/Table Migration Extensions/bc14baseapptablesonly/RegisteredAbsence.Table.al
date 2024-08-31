table 99000848 "Registered Absence"
{
    Caption = 'Registered Absence';

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
            TableRelation = IF ("Capacity Type" = CONST ("Work Center")) "Work Center"
            ELSE
            IF ("Capacity Type" = CONST ("Machine Center")) "Machine Center";
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(5; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; Capacity; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Capacity';
            MinValue = 0;
        }
        field(8; "Starting Date-Time"; DateTime)
        {
            Caption = 'Starting Date-Time';
        }
        field(9; "Ending Date-Time"; DateTime)
        {
            Caption = 'Ending Date-Time';
        }
    }

    keys
    {
        key(Key1; "Capacity Type", "No.", Date, "Starting Time", "Ending Time")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

