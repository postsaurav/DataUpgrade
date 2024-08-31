table 1263 "No. Series Tenant"
{
    Caption = 'No. Series Tenant';
    DataPerCompany = false;
    Permissions = TableData "No. Series Tenant" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(3; "Last Used number"; Code[10])
        {
            Caption = 'Last Used number';
            DataClassification = SystemMetadata;
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

