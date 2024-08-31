table 5509 "Attachment Entity Buffer"
{
    Caption = 'Attachment Entity Buffer';
    ReplicateData = false;

    fields
    {
        field(3; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
            DataClassification = SystemMetadata;
        }
        field(5; "File Name"; Text[250])
        {
            Caption = 'File Name';
            DataClassification = SystemMetadata;
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
            OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
        }
        field(8; Content; BLOB)
        {
            Caption = 'Content';
            DataClassification = SystemMetadata;
            SubType = Bitmap;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
            DataClassification = SystemMetadata;
        }
        field(8001; "Document Id"; Guid)
        {
            Caption = 'Document Id';
            DataClassification = SystemMetadata;
        }
        field(8002; "Byte Size"; Integer)
        {
            Caption = 'Byte Size';
            DataClassification = SystemMetadata;
        }
        field(8003; "G/L Entry No."; Integer)
        {
            Caption = 'G/L Entry No.';
            DataClassification = SystemMetadata;
            TableRelation = "G/L Entry";
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

