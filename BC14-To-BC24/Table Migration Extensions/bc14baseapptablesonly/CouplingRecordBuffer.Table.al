table 5332 "Coupling Record Buffer"
{
    Caption = 'Coupling Record Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "NAV Name"; Text[250])
        {
            Caption = 'NAV Name';
            DataClassification = SystemMetadata;
        }
        field(2; "CRM Name"; Text[250])
        {
            Caption = 'CRM Name';
            DataClassification = SystemMetadata;
        }
        field(3; "NAV Table ID"; Integer)
        {
            Caption = 'NAV Table ID';
            DataClassification = SystemMetadata;
        }
        field(4; "CRM Table ID"; Integer)
        {
            Caption = 'CRM Table ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Sync Action"; Option)
        {
            Caption = 'Sync Action';
            DataClassification = SystemMetadata;
            OptionCaption = 'Do Not Synchronize,To Integration Table,From Integration Table';
            OptionMembers = "Do Not Synchronize","To Integration Table","From Integration Table";
        }
        field(8; "NAV Record ID"; RecordID)
        {
            Caption = 'NAV Record ID';
            DataClassification = SystemMetadata;
        }
        field(9; "CRM ID"; Guid)
        {
            Caption = 'CRM ID';
            DataClassification = SystemMetadata;
        }
        field(10; "Create New"; Boolean)
        {
            Caption = 'Create New';
            DataClassification = SystemMetadata;
        }
        field(11; "Saved Sync Action"; Option)
        {
            Caption = 'Saved Sync Action';
            DataClassification = SystemMetadata;
            OptionCaption = 'Do Not Synchronize,To Integration Table,From Integration Table';
            OptionMembers = "Do Not Synchronize","To Integration Table","From Integration Table";
        }
        field(12; "Saved CRM ID"; Guid)
        {
            Caption = 'Saved CRM ID';
            DataClassification = SystemMetadata;
        }
        field(13; "CRM Table Name"; Code[20])
        {
            Caption = 'CRM Table Name';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "NAV Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

