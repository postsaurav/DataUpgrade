table 64 "Merge Duplicates Buffer"
{
    Caption = 'Merge Duplicates Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
        }
        field(2; Duplicate; Code[20])
        {
            Caption = 'Duplicate';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Table ID" = CONST (18)) Customer
            ELSE
            IF ("Table ID" = CONST (23)) Vendor
            ELSE
            IF ("Table ID" = CONST (5050)) Contact;
        }
        field(3; Current; Code[20])
        {
            Caption = 'Current';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Table ID" = CONST (18)) Customer;
        }
        field(4; "Table Name"; Text[30])
        {
            Caption = 'Table Name';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(5; Conflicts; Integer)
        {
            Caption = 'Conflicts';
            DataClassification = SystemMetadata;
        }
        field(6; "Duplicate Record ID"; RecordID)
        {
            Caption = 'Duplicate Record ID';
            DataClassification = SystemMetadata;
        }
        field(7; "Current Record ID"; RecordID)
        {
            Caption = 'Current Record ID';
            DataClassification = SystemMetadata;
        }
        field(8; "Conflict Field ID"; Integer)
        {
            Caption = 'Conflict Field ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Table ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

