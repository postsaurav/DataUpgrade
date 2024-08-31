table 1470 "Product Video Buffer"
{
    Caption = 'Product Video Buffer';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; Title; Text[250])
        {
            Caption = 'Title';
            DataClassification = SystemMetadata;
            TableRelation = "Assisted Setup".Name;
        }
        field(3; "Video Url"; Text[250])
        {
            Caption = 'Video Url';
            DataClassification = SystemMetadata;
            TableRelation = "Assisted Setup"."Video Url";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "Assisted Setup ID"; Integer)
        {
            Caption = 'Assisted Setup ID';
            DataClassification = SystemMetadata;
        }
        field(5; Indentation; Integer)
        {
            Caption = 'Indentation';
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
    }
}

