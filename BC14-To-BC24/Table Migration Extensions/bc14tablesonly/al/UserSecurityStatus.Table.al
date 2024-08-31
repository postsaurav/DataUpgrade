table 9062 "User Security Status"
{
    Caption = 'User Security Status';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            TableRelation = User."User Security ID";
        }
        field(2; "User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'User Name';
            FieldClass = FlowField;
        }
        field(3; "Full Name"; Text[80])
        {
            CalcFormula = Lookup (User."Full Name" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'Full Name';
            FieldClass = FlowField;
        }
        field(13; Reviewed; Boolean)
        {
            Caption = 'Reviewed';
        }
        field(14; "Belongs To Subscription Plan"; Boolean)
        {
            CalcFormula = Exist ("User Plan" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'Belongs To Subscription Plan';
            FieldClass = FlowField;
            ObsoleteReason = 'The table User Plan will be marked as internal so it will not be possible to query it using a CalcFormaula';
            ObsoleteState = Pending;
        }
        field(15; "Belongs to User Group"; Boolean)
        {
            CalcFormula = Exist ("User Group Member" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'Belongs to User Group';
            FieldClass = FlowField;
        }
        field(20; "Users - To review"; Integer)
        {
            CalcFormula = Count ("User Security Status" WHERE (Reviewed = CONST (false),
                                                              "User Security ID" = FILTER (<> '{00000000-0000-0000-0000-000000000000}')));
            Caption = 'Users - To review';
            FieldClass = FlowField;
        }
        field(21; "Users - Without Subscriptions"; Integer)
        {
            CalcFormula = Count ("User Security Status" WHERE ("Belongs To Subscription Plan" = CONST (false),
                                                              "User Security ID" = FILTER (<> '{00000000-0000-0000-0000-000000000000}')));
            Caption = 'Users - Without Subscriptions';
            FieldClass = FlowField;
            ObsoleteReason = 'The field refers to Belongs To Subscription Plan which is marked as pending';
            ObsoleteState = Pending;
        }
        field(22; "Users - Not Group Members"; Integer)
        {
            CalcFormula = Count ("User Security Status" WHERE ("Belongs to User Group" = CONST (false),
                                                              "User Security ID" = FILTER (<> '{00000000-0000-0000-0000-000000000000}')));
            Caption = 'Users - Not Group Members';
            FieldClass = FlowField;
        }
        field(25; "CDS Integration Errors"; Integer)
        {
            CalcFormula = Count ("Integration Synch. Job Errors");
            Caption = 'CDS Integration Errors';
            FieldClass = FlowField;
        }
        field(26; "Coupled Data Synch Errors"; Integer)
        {
            CalcFormula = Count ("CRM Integration Record" WHERE (Skipped = CONST (true)));
            Caption = 'Coupled Data Synch Errors';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "User Security ID")
        {
            Clustered = true;
        }
        key(Key2; Reviewed)
        {
        }
    }

    fieldgroups
    {
    }
}

