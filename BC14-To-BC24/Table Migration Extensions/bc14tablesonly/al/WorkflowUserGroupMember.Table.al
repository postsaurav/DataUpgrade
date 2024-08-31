table 1541 "Workflow User Group Member"
{
    Caption = 'Workflow User Group Member';
    ReplicateData = false;

    fields
    {
        field(1; "Workflow User Group Code"; Code[20])
        {
            Caption = 'Workflow User Group Code';
            TableRelation = "Workflow User Group".Code;
        }
        field(2; "User Name"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(3; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
            MinValue = 1;
        }
    }

    keys
    {
        key(Key1; "Workflow User Group Code", "User Name")
        {
            Clustered = true;
        }
        key(Key2; "Workflow User Group Code", "Sequence No.", "User Name")
        {
        }
    }

    fieldgroups
    {
    }
}

