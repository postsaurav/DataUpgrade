table 5452 "Graph Integration Rec. Archive"
{
    Caption = 'Graph Integration Rec. Archive';

    fields
    {
        field(2; "Graph ID"; Text[250])
        {
            Caption = 'Graph ID';
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
        field(5; "Last Synch. Graph Modified On"; DateTime)
        {
            Caption = 'Last Synch. Graph Modified On';
        }
        field(6; "Table ID"; Integer)
        {
            CalcFormula = Lookup ("Integration Record"."Table ID" WHERE ("Integration ID" = FIELD ("Integration ID")));
            Caption = 'Table ID';
            FieldClass = FlowField;
        }
        field(7; ChangeKey; Text[250])
        {
            Caption = 'ChangeKey';
        }
        field(194; "Webhook Notification"; BLOB)
        {
            Caption = 'Webhook Notification';
        }
    }

    keys
    {
        key(Key1; "Graph ID", "Integration ID")
        {
            Clustered = true;
        }
        key(Key2; "Integration ID")
        {
        }
        key(Key3; "Last Synch. Modified On", "Integration ID")
        {
        }
        key(Key4; "Last Synch. Graph Modified On", "Graph ID")
        {
        }
    }

    fieldgroups
    {
    }
}

