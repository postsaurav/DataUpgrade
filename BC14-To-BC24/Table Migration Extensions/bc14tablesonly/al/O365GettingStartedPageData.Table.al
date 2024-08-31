table 1308 "O365 Getting Started Page Data"
{
    Caption = 'O365 Getting Started Page Data';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "Display Target"; Code[20])
        {
            Caption = 'Display Target';
        }
        field(3; "Wizard ID"; Integer)
        {
            Caption = 'Wizard ID';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ',Image,Text';
            OptionMembers = ,Image,Text;
        }
        field(11; Image; Media)
        {
            Caption = 'Image';
        }
        field(12; "Body Text"; BLOB)
        {
            Caption = 'Body Text';
        }
        field(13; "Media Resources Ref"; Code[50])
        {
            Caption = 'Media Resources Ref';
        }
    }

    keys
    {
        key(Key1; "No.", "Display Target", "Wizard ID", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

