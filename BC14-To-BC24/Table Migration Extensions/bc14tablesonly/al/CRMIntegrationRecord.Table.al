table 5331 "CRM Integration Record"
{
    Caption = 'CRM Integration Record';

    fields
    {
        field(2; "CRM ID"; Guid)
        {
            Caption = 'CRM ID';
            Description = 'An ID of a record in Microsoft Dynamics CRM';
        }
        field(3; "Integration ID"; Guid)
        {
            Caption = 'Integration ID';
            TableRelation = "Integration Record"."Integration ID";
        }
        field(4; "Last Synch. Modified On"; DateTime)
        {
            Caption = 'Last Synch. Modified On';
        }
        field(5; "Last Synch. CRM Modified On"; DateTime)
        {
            Caption = 'Last Synch. CRM Modified On';
        }
        field(6; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = false;
            FieldClass = Normal;
        }
        field(7; "Last Synch. Result"; Option)
        {
            Caption = 'Last Synch. Result';
            OptionCaption = ',Success,Failure';
            OptionMembers = ,Success,Failure;
        }
        field(8; "Last Synch. CRM Result"; Option)
        {
            Caption = 'Last Synch. CRM Result';
            OptionCaption = ',Success,Failure';
            OptionMembers = ,Success,Failure;
        }
        field(9; "Last Synch. Job ID"; Guid)
        {
            Caption = 'Last Synch. Job ID';
        }
        field(10; "Last Synch. CRM Job ID"; Guid)
        {
            Caption = 'Last Synch. CRM Job ID';
        }
        field(11; Skipped; Boolean)
        {
            Caption = 'Skipped';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "CRM ID", "Integration ID")
        {
            Clustered = true;
        }
        key(Key2; "Integration ID")
        {
        }
        key(Key3; "Last Synch. Modified On", "Integration ID")
        {
        }
        key(Key4; "Last Synch. CRM Modified On", "CRM ID")
        {
        }
        key(Key5; Skipped, "Table ID")
        {
        }
    }

    fieldgroups
    {
    }
}

