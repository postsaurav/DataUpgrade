table 9003 "User Group Permission Set"
{
    Caption = 'User Group Permission Set';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "User Group Code"; Code[20])
        {
            Caption = 'User Group Code';
            TableRelation = "User Group";
        }
        field(2; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
            Editable = false;
            TableRelation = "Aggregate Permission Set"."Role ID";
        }
        field(3; "User Group Name"; Text[50])
        {
            CalcFormula = Lookup ("User Group".Name WHERE (Code = FIELD ("User Group Code")));
            Caption = 'User Group Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Role Name"; Text[30])
        {
            CalcFormula = Lookup ("Permission Set".Name WHERE ("Role ID" = FIELD ("Role ID")));
            Caption = 'Role Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "App ID"; Guid)
        {
            Caption = 'App ID';
        }
        field(6; Scope; Option)
        {
            Caption = 'Scope';
            OptionCaption = 'System,Tenant';
            OptionMembers = System,Tenant;
        }
        field(7; "Extension Name"; Text[250])
        {
            CalcFormula = Lookup ("NAV App".Name WHERE (ID = FIELD ("App ID")));
            Caption = 'Extension Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "User Group Code", "Role ID", Scope, "App ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

