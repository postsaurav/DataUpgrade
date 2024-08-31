table 1514 "Sent Notification Entry"
{
    Caption = 'Sent Notification Entry';
    Permissions = TableData "Sent Notification Entry" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'New Record,Approval,Overdue';
            OptionMembers = "New Record",Approval,Overdue;
        }
        field(4; "Recipient User ID"; Code[50])
        {
            Caption = 'Recipient User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(5; "Triggered By Record"; RecordID)
        {
            Caption = 'Triggered By Record';
            DataClassification = SystemMetadata;
        }
        field(6; "Link Target Page"; Integer)
        {
            Caption = 'Link Target Page';
            TableRelation = "Page Metadata".ID;
        }
        field(7; "Custom Link"; Text[250])
        {
            Caption = 'Custom Link';
            ExtendedDatatype = URL;
        }
        field(9; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }
        field(10; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
        }
        field(11; "Sent Date-Time"; DateTime)
        {
            Caption = 'Sent Date-Time';
        }
        field(12; "Notification Content"; BLOB)
        {
            Caption = 'Notification Content';
        }
        field(13; "Notification Method"; Option)
        {
            Caption = 'Notification Method';
            OptionCaption = 'Email,Note';
            OptionMembers = Email,Note;
        }
        field(14; "Aggregated with Entry"; Integer)
        {
            Caption = 'Aggregated with Entry';
            TableRelation = "Sent Notification Entry";
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

