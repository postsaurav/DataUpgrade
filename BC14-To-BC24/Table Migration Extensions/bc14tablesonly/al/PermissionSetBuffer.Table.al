table 9009 "Permission Set Buffer"
{
    Caption = 'Permission Set Buffer';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; Scope; Option)
        {
            Caption = 'Scope';
            DataClassification = SystemMetadata;
            OptionCaption = 'System,Tenant';
            OptionMembers = System,Tenant;
        }
        field(2; "App ID"; Guid)
        {
            Caption = 'App ID';
            DataClassification = SystemMetadata;
        }
        field(3; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
            DataClassification = SystemMetadata;
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(5; "App Name"; Text[250])
        {
            Caption = 'App Name';
            DataClassification = SystemMetadata;
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'User-Defined,Extension,System';
            OptionMembers = "User-Defined",Extension,System;
        }
    }

    keys
    {
        key(Key1; Type, "Role ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

