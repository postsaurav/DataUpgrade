table 5339 "Integration Synch. Job Errors"
{
    Caption = 'Integration Synch. Job Errors';

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(2; "Integration Synch. Job ID"; Guid)
        {
            Caption = 'Integration Synch. Job ID';
            TableRelation = "Integration Synch. Job".ID;
        }
        field(3; "Source Record ID"; RecordID)
        {
            Caption = 'Source Record ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Destination Record ID"; RecordID)
        {
            Caption = 'Destination Record ID';
            DataClassification = SystemMetadata;
        }
        field(5; Message; Text[250])
        {
            Caption = 'Message';
        }
        field(6; "Date/Time"; DateTime)
        {
            Caption = 'Date/Time';
        }
        field(7; "Exception Detail"; BLOB)
        {
            Caption = 'Exception Detail';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Integration Synch. Job ID", "Date/Time")
        {
        }
        key(Key3; "Date/Time", "Integration Synch. Job ID")
        {
        }
    }

    fieldgroups
    {
    }
}

