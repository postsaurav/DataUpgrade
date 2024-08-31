table 832 "Workflows Entries Buffer"
{
    Caption = 'Workflows Entries Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Created by Application"; Option)
        {
            Caption = 'Created by Application';
            DataClassification = SystemMetadata;
            OptionCaption = 'Microsoft Flow,Dynamics 365,Dynamics NAV';
            OptionMembers = "Microsoft Flow","Dynamics 365","Dynamics NAV";
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Initiated By User ID"; Code[50])
        {
            Caption = 'Initiated By User ID';
            DataClassification = SystemMetadata;
        }
        field(6; "To Be Approved By User ID"; Code[50])
        {
            Caption = 'To Be Approved By User ID';
            DataClassification = SystemMetadata;
        }
        field(7; "Date-Time Initiated"; DateTime)
        {
            Caption = 'Date-Time Initiated';
            DataClassification = SystemMetadata;
        }
        field(8; "Last Date-Time Modified"; DateTime)
        {
            Caption = 'Last Date-Time Modified';
            DataClassification = SystemMetadata;
        }
        field(9; "Last Modified By User ID"; Code[50])
        {
            Caption = 'Last Modified By User ID';
            DataClassification = SystemMetadata;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            DataClassification = SystemMetadata;
            OptionCaption = 'Created,Open,Canceled,Rejected,Approved, ';
            OptionMembers = Created,Open,Canceled,Rejected,Approved," ";
        }
        field(11; Response; Option)
        {
            Caption = 'Response';
            DataClassification = SystemMetadata;
            OptionCaption = 'NotExpected,Pending,Cancel,Continue,Reject, ';
            OptionMembers = NotExpected,Pending,Cancel,Continue,Reject," ";
        }
        field(12; Amount; Integer)
        {
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(13; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Workflow Step Instance ID")
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

