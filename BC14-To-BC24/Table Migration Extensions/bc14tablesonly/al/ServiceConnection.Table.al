table 1400 "Service Connection"
{
    Caption = 'Service Connection';

    fields
    {
        field(1; "No."; Text[250])
        {
            Caption = 'No.';
        }
        field(2; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(4; "Host Name"; Text[250])
        {
            Caption = 'Host Name';
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = ' ,Enabled,Disabled,Connected,Error';
            OptionMembers = " ",Enabled,Disabled,Connected,Error;
        }
        field(10; "Page ID"; Integer)
        {
            Caption = 'Page ID';
        }
        field(11; "Assisted Setup Page ID"; Integer)
        {
            Caption = 'Assisted Setup Page ID';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

