table 6710 "Tenant Web Service OData"
{
    Caption = 'Tenant Web Service OData';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; TenantWebServiceID; RecordID)
        {
            Caption = 'TenantWebServiceID';
            DataClassification = SystemMetadata;
        }
        field(2; ODataSelectClause; BLOB)
        {
            Caption = 'ODataSelectClause';
        }
        field(3; ODataFilterClause; BLOB)
        {
            Caption = 'ODataFilterClause';
        }
        field(4; ODataV4FilterClause; BLOB)
        {
            Caption = 'ODataV4FilterClause';
        }
    }

    keys
    {
        key(Key1; TenantWebServiceID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

