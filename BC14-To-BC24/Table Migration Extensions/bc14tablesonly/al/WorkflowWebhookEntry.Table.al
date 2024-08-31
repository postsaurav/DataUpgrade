table 467 "Workflow Webhook Entry"
{
    Caption = 'Workflow Webhook Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(3; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
        }
        field(5; "Initiated By User ID"; Code[50])
        {
            Caption = 'Initiated By User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(7; Response; Option)
        {
            Caption = 'Response';
            OptionCaption = 'NotExpected,Pending,Cancel,Continue,Reject';
            OptionMembers = NotExpected,Pending,Cancel,Continue,Reject;
        }
        field(8; "Response Argument"; Guid)
        {
            Caption = 'Response Argument';
        }
        field(9; "Date-Time Initiated"; DateTime)
        {
            Caption = 'Date-Time Initiated';
        }
        field(11; "Last Date-Time Modified"; DateTime)
        {
            Caption = 'Last Date-Time Modified';
        }
        field(13; "Last Modified By User ID"; Code[50])
        {
            Caption = 'Last Modified By User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(15; "Data ID"; Guid)
        {
            Caption = 'Data ID';
        }
        field(17; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Workflow Step Instance ID")
        {
        }
        key(Key3; "Data ID")
        {
        }
        key(Key4; Response, "Record ID")
        {
        }
        key(Key5; "Record ID")
        {
        }
    }

    fieldgroups
    {
    }
}

