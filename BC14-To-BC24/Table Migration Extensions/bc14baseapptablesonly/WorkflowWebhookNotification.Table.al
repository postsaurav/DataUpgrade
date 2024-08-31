table 468 "Workflow Webhook Notification"
{
    Caption = 'Workflow Webhook Notification';

    fields
    {
        field(1; "Notification No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Notification No.';
        }
        field(2; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
        }
        field(3; "Date-Time Created"; DateTime)
        {
            Caption = 'Date-Time Created';
        }
        field(4; "Created By User ID"; Code[50])
        {
            Caption = 'Created By User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Pending,Sent,Failed';
            OptionMembers = Pending,Sent,Failed;
        }
        field(6; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }
        field(7; "Error Details"; BLOB)
        {
            Caption = 'Error Details';
        }
    }

    keys
    {
        key(Key1; "Notification No.")
        {
            Clustered = true;
        }
        key(Key2; "Workflow Step Instance ID")
        {
        }
    }

    fieldgroups
    {
    }
}

