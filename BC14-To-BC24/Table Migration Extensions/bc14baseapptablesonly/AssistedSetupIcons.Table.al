table 1810 "Assisted Setup Icons"
{
    Caption = 'Assisted Setup Icons';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
        }
        field(2; Image; Media)
        {
            Caption = 'Image';
        }
        field(3; "Media Resources Ref"; Code[50])
        {
            Caption = 'Media Resources Ref';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

