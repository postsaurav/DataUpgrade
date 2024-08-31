table 5338 "Integration Synch. Job"
{
    Caption = 'Integration Synch. Job';

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; "Start Date/Time"; DateTime)
        {
            Caption = 'Start Date/Time';
        }
        field(3; "Finish Date/Time"; DateTime)
        {
            Caption = 'Finish Date/Time';
        }
        field(4; Message; Text[250])
        {
            Caption = 'Message';
        }
        field(5; "Integration Table Mapping Name"; Code[20])
        {
            Caption = 'Integration Table Mapping Name';
            TableRelation = "Integration Table Mapping".Name;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(6; Inserted; Integer)
        {
            Caption = 'Inserted';
        }
        field(7; Modified; Integer)
        {
            Caption = 'Modified';
        }
        field(8; Deleted; Integer)
        {
            Caption = 'Deleted';
        }
        field(9; Unchanged; Integer)
        {
            Caption = 'Unchanged';
        }
        field(10; Skipped; Integer)
        {
            Caption = 'Skipped';
        }
        field(11; Failed; Integer)
        {
            Caption = 'Failed';
        }
        field(12; "Synch. Direction"; Option)
        {
            Caption = 'Synch. Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
            OptionMembers = Bidirectional,ToIntegrationTable,FromIntegrationTable;
        }
        field(13; "Job Queue Log Entry No."; Integer)
        {
            Caption = 'Job Queue Log Entry No.';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Start Date/Time", ID)
        {
        }
    }

    fieldgroups
    {
    }
}

