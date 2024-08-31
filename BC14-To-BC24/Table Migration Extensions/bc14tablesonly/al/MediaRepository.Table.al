table 9400 "Media Repository"
{
    Caption = 'Media Repository';
    DataPerCompany = false;

    fields
    {
        field(1; "File Name"; Text[250])
        {
            Caption = 'File Name';
        }
        field(2; "Display Target"; Code[50])
        {
            Caption = 'Display Target';
        }
        field(3; Image; Media)
        {
            Caption = 'Image';
        }
        field(4; "Media Resources Ref"; Code[50])
        {
            Caption = 'Media Resources Ref';
        }
    }

    keys
    {
        key(Key1; "File Name", "Display Target")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

