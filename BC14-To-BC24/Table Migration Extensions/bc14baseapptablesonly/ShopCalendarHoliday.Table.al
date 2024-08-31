table 99000753 "Shop Calendar Holiday"
{
    Caption = 'Shop Calendar Holiday';

    fields
    {
        field(1; "Shop Calendar Code"; Code[10])
        {
            Caption = 'Shop Calendar Code';
            NotBlank = true;
            TableRelation = "Shop Calendar";
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
            NotBlank = true;
        }
        field(3; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(4; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(5; "Starting Date-Time"; DateTime)
        {
            Caption = 'Starting Date-Time';
        }
        field(6; "Ending Date-Time"; DateTime)
        {
            Caption = 'Ending Date-Time';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Shop Calendar Code", Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

