table 9000 "User Group"
{
    Caption = 'User Group';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Default Profile ID"; Code[30])
        {
            Caption = 'Default Profile ID';
            TableRelation = "All Profile"."Profile ID";
        }
        field(4; "Assign to All New Users"; Boolean)
        {
            Caption = 'Assign to All New Users';
        }
        field(5; Customized; Boolean)
        {
            Caption = 'Customized';
            Editable = false;
        }
        field(6; "Default Profile App ID"; Guid)
        {
            Caption = 'Default Profile App ID';
        }
        field(7; "Default Profile Scope"; Option)
        {
            Caption = 'Default Profile Scope';
            OptionCaption = 'System,Tenant';
            OptionMembers = System,Tenant;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

