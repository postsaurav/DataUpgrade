table 65 "Merge Duplicates Line Buffer"
{
    Caption = 'Merge Duplicates Line Buffer';
    ReplicateData = false;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = ',Field,Table';
            OptionMembers = ,"Field","Table";
        }
        field(2; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
        field(3; Name; Text[30])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(4; "Duplicate Value"; Text[2048])
        {
            Caption = 'Duplicate Value';
            DataClassification = SystemMetadata;
        }
        field(5; "Current Value"; Text[2048])
        {
            Caption = 'Current Value';
            DataClassification = SystemMetadata;
        }
        field(6; Override; Boolean)
        {
            Caption = 'Override';
            DataClassification = SystemMetadata;
        }
        field(7; "Duplicate Count"; Integer)
        {
            Caption = 'Duplicate Count';
            DataClassification = SystemMetadata;
        }
        field(8; "Current Count"; Integer)
        {
            Caption = 'Current Count';
            DataClassification = SystemMetadata;
        }
        field(9; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
        }
        field(10; "Table Name"; Text[30])
        {
            Caption = 'Table Name';
            DataClassification = SystemMetadata;
        }
        field(11; "In Primary Key"; Option)
        {
            Caption = 'In Primary Key';
            DataClassification = SystemMetadata;
            InitValue = No;
            OptionCaption = 'Yes,No';
            OptionMembers = Yes,No;
        }
        field(12; Conflicts; Integer)
        {
            Caption = 'Conflicts';
            DataClassification = SystemMetadata;
        }
        field(13; Modified; Boolean)
        {
            Caption = 'Modified';
            DataClassification = SystemMetadata;
        }
        field(14; "Data Type"; Text[30])
        {
            Caption = 'Data Type';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(15; "Can Be Renamed"; Boolean)
        {
            Caption = 'Can Be Renamed';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Type, "Table ID", ID)
        {
            Clustered = true;
        }
        key(Key2; "In Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

