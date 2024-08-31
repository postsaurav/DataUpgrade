table 959 "Time Sheet Chart Setup"
{
    Caption = 'Time Sheet Chart Setup';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(3; "Show by"; Option)
        {
            Caption = 'Show by';
            OptionCaption = 'Status,Type,Posted';
            OptionMembers = Status,Type,Posted;
        }
        field(4; "Measure Type"; Option)
        {
            Caption = 'Measure Type';
            OptionCaption = 'Open,Submitted,Rejected,Approved,Scheduled,Posted,Not Posted,Resource,Job,Service,Absence,Assembly Order';
            OptionMembers = Open,Submitted,Rejected,Approved,Scheduled,Posted,"Not Posted",Resource,Job,Service,Absence,"Assembly Order";
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

