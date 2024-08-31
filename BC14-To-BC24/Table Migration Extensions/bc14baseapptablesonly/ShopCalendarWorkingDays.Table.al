table 99000752 "Shop Calendar Working Days"
{
    Caption = 'Shop Calendar Working Days';
    DataCaptionFields = "Shop Calendar Code";

    fields
    {
        field(1; "Shop Calendar Code"; Code[10])
        {
            Caption = 'Shop Calendar Code';
            NotBlank = true;
            TableRelation = "Shop Calendar";
        }
        field(2; Day; Option)
        {
            Caption = 'Day';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(3; "Work Shift Code"; Code[10])
        {
            Caption = 'Work Shift Code';
            NotBlank = true;
            TableRelation = "Work Shift";
        }
        field(4; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(5; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
    }

    keys
    {
        key(Key1; "Shop Calendar Code", Day, "Starting Time", "Ending Time", "Work Shift Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

