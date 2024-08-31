table 5373 "CRM Full Synch. Review Line"
{
    Caption = 'CRM Full Synch. Review Line';

    fields
    {
        field(1; Name; Code[20])
        {
            Caption = 'Name';
        }
        field(2; "Dependency Filter"; Text[250])
        {
            Caption = 'Dependency Filter';
        }
        field(3; "Session ID"; Integer)
        {
            Caption = 'Session ID';
        }
        field(4; "To Int. Table Job ID"; Guid)
        {
            Caption = 'To Int. Table Job ID';
        }
        field(5; "To Int. Table Job Status"; Option)
        {
            Caption = 'To Int. Table Job Status';
            OptionCaption = ' ,Success,In Process,Error';
            OptionMembers = " ",Success,"In Process",Error;
        }
        field(6; "From Int. Table Job ID"; Guid)
        {
            Caption = 'From Int. Table Job ID';
        }
        field(7; "From Int. Table Job Status"; Option)
        {
            Caption = 'From Int. Table Job Status';
            OptionCaption = ' ,Success,In Process,Error';
            OptionMembers = " ",Success,"In Process",Error;
        }
        field(8; Direction; Option)
        {
            Caption = 'Direction';
            Editable = false;
            OptionCaption = 'Bidirectional,To Integration Table,From Integration Table';
            OptionMembers = Bidirectional,"To Integration Table","From Integration Table";
        }
        field(9; "Job Queue Entry ID"; Guid)
        {
            Caption = 'Job Queue Entry ID';
        }
        field(10; "Job Queue Entry Status"; Option)
        {
            Caption = 'Job Queue Entry Status';
            OptionCaption = ' ,Ready,In Process,Error,On Hold,Finished';
            OptionMembers = " ",Ready,"In Process",Error,"On Hold",Finished;
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

