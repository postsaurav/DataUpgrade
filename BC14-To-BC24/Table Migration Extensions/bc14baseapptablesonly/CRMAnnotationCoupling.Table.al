table 5392 "CRM Annotation Coupling"
{
    Caption = 'CRM Annotation Coupling';

    fields
    {
        field(2; "Record Link Record ID"; RecordID)
        {
            Caption = 'Record Link Record ID';
            DataClassification = SystemMetadata;
        }
        field(3; "CRM Annotation ID"; Guid)
        {
            Caption = 'CRM Annotation ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Last Synch. DateTime"; DateTime)
        {
            Caption = 'Last Synch. DateTime';
            DataClassification = SystemMetadata;
        }
        field(5; "CRM Created On"; DateTime)
        {
            Caption = 'CRM Created On';
            DataClassification = SystemMetadata;
        }
        field(6; "CRM Modified On"; DateTime)
        {
            Caption = 'CRM Modified On';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Record Link Record ID", "CRM Annotation ID")
        {
            Clustered = true;
        }
        key(Key2; "Last Synch. DateTime")
        {
        }
        key(Key3; "CRM Created On")
        {
        }
        key(Key4; "CRM Modified On")
        {
        }
    }

    fieldgroups
    {
    }
}

