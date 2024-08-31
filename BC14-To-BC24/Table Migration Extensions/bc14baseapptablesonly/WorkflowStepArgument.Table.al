table 1523 "Workflow Step Argument"
{
    Caption = 'Workflow Step Argument';
    DataCaptionFields = "General Journal Template Name", "General Journal Batch Name", "Notification User ID";
    Permissions = TableData "Workflow Step Argument" = rim;
    ReplicateData = false;

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Event,Response';
            OptionMembers = "Event",Response;
            TableRelation = "Workflow Step".Type WHERE (Argument = FIELD (ID));
        }
        field(3; "General Journal Template Name"; Code[10])
        {
            Caption = 'General Journal Template Name';
            TableRelation = "Gen. Journal Template".Name;
        }
        field(4; "General Journal Batch Name"; Code[10])
        {
            Caption = 'General Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("General Journal Template Name"));
        }
        field(5; "Notification User ID"; Code[50])
        {
            Caption = 'Notification User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(6; "Notification User License Type"; Option)
        {
            CalcFormula = Lookup (User."License Type" WHERE ("User Name" = FIELD ("Notification User ID")));
            Caption = 'Notification User License Type';
            FieldClass = FlowField;
            OptionCaption = 'Full User,Limited User,Device Only User,Windows Group,External User';
            OptionMembers = "Full User","Limited User","Device Only User","Windows Group","External User";
        }
        field(7; "Response Function Name"; Code[128])
        {
            Caption = 'Response Function Name';
            TableRelation = "Workflow Response"."Function Name";
        }
        field(9; "Link Target Page"; Integer)
        {
            Caption = 'Link Target Page';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Page));
        }
        field(10; "Custom Link"; Text[250])
        {
            Caption = 'Custom Link';
            ExtendedDatatype = URL;
        }
        field(11; "Event Conditions"; BLOB)
        {
            Caption = 'Event Conditions';
        }
        field(12; "Approver Type"; Option)
        {
            Caption = 'Approver Type';
            OptionCaption = 'Salesperson/Purchaser,Approver,Workflow User Group';
            OptionMembers = "Salesperson/Purchaser",Approver,"Workflow User Group";
        }
        field(13; "Approver Limit Type"; Option)
        {
            Caption = 'Approver Limit Type';
            OptionCaption = 'Approver Chain,Direct Approver,First Qualified Approver,Specific Approver';
            OptionMembers = "Approver Chain","Direct Approver","First Qualified Approver","Specific Approver";
        }
        field(14; "Workflow User Group Code"; Code[20])
        {
            Caption = 'Workflow User Group Code';
            TableRelation = "Workflow User Group".Code;
        }
        field(15; "Due Date Formula"; DateFormula)
        {
            Caption = 'Due Date Formula';
        }
        field(16; Message; Text[250])
        {
            Caption = 'Message';
        }
        field(17; "Delegate After"; Option)
        {
            Caption = 'Delegate After';
            OptionCaption = 'Never,1 day,2 days,5 days';
            OptionMembers = Never,"1 day","2 days","5 days";
        }
        field(18; "Show Confirmation Message"; Boolean)
        {
            Caption = 'Show Confirmation Message';
        }
        field(19; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(20; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(21; "Field Caption"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Field No.")));
            Caption = 'Field Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Approver User ID"; Code[50])
        {
            Caption = 'Approver User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(23; "Response Type"; Option)
        {
            Caption = 'Response Type';
            OptionCaption = 'Not Expected,User ID';
            OptionMembers = "Not Expected","User ID";
        }
        field(24; "Response User ID"; Code[50])
        {
            Caption = 'Response User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(100; "Response Option Group"; Code[20])
        {
            CalcFormula = Lookup ("Workflow Response"."Response Option Group" WHERE ("Function Name" = FIELD ("Response Function Name")));
            Caption = 'Response Option Group';
            Editable = false;
            FieldClass = FlowField;
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

