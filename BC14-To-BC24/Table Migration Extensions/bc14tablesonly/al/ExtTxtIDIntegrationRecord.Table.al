table 5377 "Ext Txt ID Integration Record"
{
    Caption = 'Ext Txt ID Integration Record';

    fields
    {
        field(1; "External ID"; Text[250])
        {
            Caption = 'External ID';
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
        field(5; "Last Synch. Ext Modified On"; DateTime)
        {
            Caption = 'Last Synch. Ext Modified On';
        }
        field(6; "Table ID"; Integer)
        {
            CalcFormula = Lookup ("Integration Record"."Table ID" WHERE ("Integration ID" = FIELD ("Integration ID")));
            Caption = 'Table ID';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "External ID", "Integration ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

