table 1513 "Notification Schedule"
{
    Caption = 'Notification Schedule';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(2; "Notification Type"; Option)
        {
            Caption = 'Notification Type';
            OptionCaption = 'New Record,Approval,Overdue';
            OptionMembers = "New Record",Approval,Overdue;
        }
        field(3; Recurrence; Option)
        {
            Caption = 'Recurrence';
            InitValue = Instantly;
            OptionCaption = 'Instantly,Daily,Weekly,Monthly';
            OptionMembers = Instantly,Daily,Weekly,Monthly;
        }
        field(4; Time; Time)
        {
            Caption = 'Time';
            InitValue = 120000T;
        }
        field(5; "Daily Frequency"; Option)
        {
            Caption = 'Daily Frequency';
            InitValue = Weekday;
            OptionCaption = 'Weekday,Daily';
            OptionMembers = Weekday,Daily;
        }
        field(6; Monday; Boolean)
        {
            Caption = 'Monday';
            InitValue = true;
        }
        field(7; Tuesday; Boolean)
        {
            Caption = 'Tuesday';
            InitValue = true;
        }
        field(8; Wednesday; Boolean)
        {
            Caption = 'Wednesday';
            InitValue = true;
        }
        field(9; Thursday; Boolean)
        {
            Caption = 'Thursday';
            InitValue = true;
        }
        field(10; Friday; Boolean)
        {
            Caption = 'Friday';
            InitValue = true;
        }
        field(11; Saturday; Boolean)
        {
            Caption = 'Saturday';
        }
        field(12; Sunday; Boolean)
        {
            Caption = 'Sunday';
        }
        field(13; "Date of Month"; Integer)
        {
            Caption = 'Date of Month';
            MaxValue = 31;
            MinValue = 1;
        }
        field(14; "Monthly Notification Date"; Option)
        {
            Caption = 'Monthly Notification Date';
            OptionCaption = 'First Workday,Last Workday,Custom';
            OptionMembers = "First Workday","Last Workday",Custom;
        }
        field(15; "Last Scheduled Job"; Guid)
        {
            Caption = 'Last Scheduled Job';
            TableRelation = "Job Queue Entry";
        }
    }

    keys
    {
        key(Key1; "User ID", "Notification Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

