table 762 "Account Schedules Chart Setup"
{
    Caption = 'Account Schedules Chart Setup';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(10; "Account Schedule Name"; Code[10])
        {
            Caption = 'Account Schedule Name';
            TableRelation = "Acc. Schedule Name".Name;
        }
        field(20; "Column Layout Name"; Code[10])
        {
            Caption = 'Column Layout Name';
            TableRelation = "Column Layout Name".Name;
        }
        field(30; "Base X-Axis on"; Option)
        {
            Caption = 'Base X-Axis on';
            OptionCaption = 'Period,Acc. Sched. Line,Acc. Sched. Column';
            OptionMembers = Period,"Acc. Sched. Line","Acc. Sched. Column";
        }
        field(31; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(32; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(41; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(42; "No. of Periods"; Integer)
        {
            Caption = 'No. of Periods';
            InitValue = 12;
        }
        field(50; "Last Viewed"; Boolean)
        {
            Caption = 'Last Viewed';
            Editable = false;
        }
        field(51; "Look Ahead"; Boolean)
        {
            Caption = 'Look Ahead';
        }
    }

    keys
    {
        key(Key1; "User ID", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

