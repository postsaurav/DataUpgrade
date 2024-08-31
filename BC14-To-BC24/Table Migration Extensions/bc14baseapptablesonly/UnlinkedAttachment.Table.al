table 138 "Unlinked Attachment"
{
    Caption = 'Unlinked Attachment';

    fields
    {
        field(3; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }
        field(5; "File Name"; Text[250])
        {
            Caption = 'File Name';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
            OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
        }
        field(8; Content; BLOB)
        {
            Caption = 'Content';
            SubType = Bitmap;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
        key(Key2; "Created Date-Time")
        {
        }
    }

    fieldgroups
    {
    }
}

