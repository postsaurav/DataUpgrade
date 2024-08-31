table 9900 "Web Service Aggregate"
{
    Caption = 'Web Service Aggregate';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(3; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionCaption = ',,,,,Codeunit,,,Page,Query';
            OptionMembers = ,,,,,"Codeunit",,,"Page","Query";
        }
        field(6; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = FIELD ("Object Type"));
        }
        field(9; "Service Name"; Text[240])
        {
            Caption = 'Service Name';
        }
        field(12; Published; Boolean)
        {
            Caption = 'Published';
        }
        field(15; "All Tenants"; Boolean)
        {
            Caption = 'All Tenants';
        }
    }

    keys
    {
        key(Key1; "Object Type", "Service Name")
        {
            Clustered = true;
        }
        key(Key2; "Object Type", "Object ID")
        {
        }
    }

    fieldgroups
    {
    }
}

