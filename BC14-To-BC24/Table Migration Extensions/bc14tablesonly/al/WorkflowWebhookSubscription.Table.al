table 469 "Workflow Webhook Subscription"
{
    Caption = 'Workflow Webhook Subscription';

    fields
    {
        field(1; Id; Guid)
        {
            Caption = 'Id';
        }
        field(2; "WF Definition Id"; Code[20])
        {
            Caption = 'WF Definition Id';
        }
        field(3; Conditions; BLOB)
        {
            Caption = 'Conditions';
        }
        field(4; "Notification Url"; BLOB)
        {
            Caption = 'Notification Url';
        }
        field(5; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(6; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(7; "Client Id"; Guid)
        {
            Caption = 'Client Id';
        }
        field(8; "Client Type"; Text[50])
        {
            Caption = 'Client Type';
        }
        field(9; "Event Code"; Code[128])
        {
            Caption = 'Event Code';
        }
        field(10; "Created Date"; DateTime)
        {
            Caption = 'Created Date';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
        key(Key2; "WF Definition Id", Enabled)
        {
        }
    }

    fieldgroups
    {
    }
}

