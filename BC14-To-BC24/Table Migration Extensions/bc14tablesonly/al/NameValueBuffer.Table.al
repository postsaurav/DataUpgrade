table 823 "Name/Value Buffer"
{
    Caption = 'Name/Value Buffer';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(3; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
        field(4; "Value BLOB"; BLOB)
        {
            Caption = 'Value BLOB';
            DataClassification = SystemMetadata;
        }
        field(5; "Value Long"; Text[2048])
        {
            Caption = 'Value Long';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name)
        {
        }
        fieldgroup(Brick; Name, Value)
        {
        }
    }
}

