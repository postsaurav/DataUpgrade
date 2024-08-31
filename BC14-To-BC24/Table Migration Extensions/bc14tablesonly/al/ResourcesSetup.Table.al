table 314 "Resources Setup"
{
    Caption = 'Resources Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Resource Nos."; Code[20])
        {
            Caption = 'Resource Nos.';
            TableRelation = "No. Series";
        }
        field(950; "Time Sheet Nos."; Code[20])
        {
            Caption = 'Time Sheet Nos.';
            TableRelation = "No. Series";
        }
        field(951; "Time Sheet First Weekday"; Option)
        {
            Caption = 'Time Sheet First Weekday';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(952; "Time Sheet by Job Approval"; Option)
        {
            Caption = 'Time Sheet by Job Approval';
            OptionCaption = 'Never,Machine Only,Always';
            OptionMembers = Never,"Machine Only",Always;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

