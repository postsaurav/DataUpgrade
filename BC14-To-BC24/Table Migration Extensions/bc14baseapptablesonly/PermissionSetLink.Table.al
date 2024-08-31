table 9802 "Permission Set Link"
{
    Caption = 'Permission Set Link';
    DataPerCompany = false;
    Permissions = TableData "Permission Set Link" = rmd;
    ReplicateData = false;

    fields
    {
        field(1; "Permission Set ID"; Code[20])
        {
            Caption = 'Permission Set ID';
            DataClassification = SystemMetadata;
            TableRelation = "Permission Set"."Role ID";
        }
        field(2; "Linked Permission Set ID"; Code[20])
        {
            Caption = 'Linked Permission Set ID';
            DataClassification = SystemMetadata;
            TableRelation = "Tenant Permission Set"."Role ID";
        }
        field(3; "Source Hash"; Text[250])
        {
            Caption = 'Source Hash';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Permission Set ID", "Linked Permission Set ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

