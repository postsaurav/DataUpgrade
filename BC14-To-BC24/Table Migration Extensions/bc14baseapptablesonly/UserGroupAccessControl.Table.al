table 9002 "User Group Access Control"
{
    Caption = 'User Group Access Control';
    DataPerCompany = false;
    Permissions = TableData "Access Control" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "User Group Code"; Code[20])
        {
            Caption = 'User Group Code';
            TableRelation = "User Group";
        }
        field(2; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            DataClassification = EndUserPseudonymousIdentifiers;
            TableRelation = User;
        }
        field(3; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
            Editable = false;
            TableRelation = "Aggregate Permission Set"."Role ID";
        }
        field(4; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company;
        }
        field(5; "User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'User Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; Scope; Option)
        {
            Caption = 'Scope';
            OptionCaption = 'System,Tenant';
            OptionMembers = System,Tenant;
        }
        field(7; "App ID"; Guid)
        {
            Caption = 'App ID';
        }
    }

    keys
    {
        key(Key1; "User Group Code", "User Security ID", "Role ID", "Company Name", Scope, "App ID")
        {
            Clustered = true;
        }
        key(Key2; "User Security ID", "Role ID", "Company Name", Scope, "App ID")
        {
        }
    }

    fieldgroups
    {
    }
}

