table 5468 "Picture Entity"
{
    Caption = 'Picture Entity';

    fields
    {
        field(1; Id; Guid)
        {
            Caption = 'Id';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(11; Width; Integer)
        {
            Caption = 'Width';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(12; Height; Integer)
        {
            Caption = 'Height';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(13; "Mime Type"; Text[100])
        {
            Caption = 'Mime Type';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(20; Content; BLOB)
        {
            Caption = 'Content';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

