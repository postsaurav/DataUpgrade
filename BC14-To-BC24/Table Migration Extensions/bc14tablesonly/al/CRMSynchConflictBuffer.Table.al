table 5374 "CRM Synch. Conflict Buffer"
{
    Caption = 'CRM Synch. Conflict Buffer';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Integration ID"; Guid)
        {
            Caption = 'Integration ID';
            DataClassification = SystemMetadata;
        }
        field(3; "CRM ID"; Guid)
        {
            Caption = 'CRM ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Table Name"; Text[250])
        {
            Caption = 'Table Name';
            DataClassification = SystemMetadata;
        }
        field(6; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(7; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(8; "Modified On"; DateTime)
        {
            Caption = 'Modified On';
            DataClassification = SystemMetadata;
        }
        field(9; "Int. Table ID"; Integer)
        {
            Caption = 'Int. Table ID';
            DataClassification = SystemMetadata;
        }
        field(10; "Int. Record ID"; RecordID)
        {
            Caption = 'Int. Record ID';
            DataClassification = SystemMetadata;
        }
        field(11; "Int. Description"; Text[250])
        {
            Caption = 'Int. Description';
            DataClassification = SystemMetadata;
        }
        field(12; "Int. Modified On"; DateTime)
        {
            Caption = 'Int. Modified On';
            DataClassification = SystemMetadata;
        }
        field(13; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            DataClassification = SystemMetadata;
        }
        field(14; "Failed On"; DateTime)
        {
            Caption = 'Failed On';
            DataClassification = SystemMetadata;
        }
        field(15; "Deleted On"; DateTime)
        {
            Caption = 'Deleted On';
            DataClassification = SystemMetadata;
        }
        field(16; "Record Exists"; Boolean)
        {
            Caption = 'Record Exists';
            DataClassification = SystemMetadata;
        }
        field(17; "Int. Record Exists"; Boolean)
        {
            Caption = 'Int. Record Exists';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

