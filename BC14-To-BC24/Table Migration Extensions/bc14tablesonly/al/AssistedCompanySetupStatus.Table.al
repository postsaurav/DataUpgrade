table 1802 "Assisted Company Setup Status"
{
    Caption = 'Assisted Company Setup Status';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company;
        }
        field(2; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(3; "Package Imported"; Boolean)
        {
            Caption = 'Package Imported';
        }
        field(4; "Import Failed"; Boolean)
        {
            Caption = 'Import Failed';
        }
        field(5; "Company Setup Session ID"; Integer)
        {
            Caption = 'Company Setup Session ID';
        }
        field(6; "Task ID"; Guid)
        {
            Caption = 'Task ID';
        }
        field(7; "Server Instance ID"; Integer)
        {
            Caption = 'Server Instance ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Company Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

