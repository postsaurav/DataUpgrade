table 6712 "Tenant Web Service Filter"
{
    Caption = 'Tenant Web Service Filter';
    DataPerCompany = false;

    fields
    {
        field(1; "Entry ID"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry ID';
        }
        field(2; "Filter"; BLOB)
        {
            Caption = 'Filter';
        }
        field(3; TenantWebServiceID; RecordID)
        {
            Caption = 'TenantWebServiceID';
            DataClassification = SystemMetadata;
        }
        field(4; "Data Item"; Integer)
        {
            Caption = 'Data Item';
        }
    }

    keys
    {
        key(Key1; "Entry ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

