table 1803 "Assisted Setup"
{
    Caption = 'Assisted Setup';
    ReplicateData = false;

    fields
    {
        field(1; "Page ID"; Integer)
        {
            Caption = 'Page ID';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; "Order"; Integer)
        {
            Caption = 'Order';
        }
        field(4; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Not Completed,Completed,Not Started,Seen,Watched,Read, ';
            OptionMembers = "Not Completed",Completed,"Not Started",Seen,Watched,Read," ";
        }
        field(5; Visible; Boolean)
        {
            Caption = 'Visible';
        }
        field(6; Parent; Integer)
        {
            Caption = 'Parent';
        }
        field(7; "Video Url"; Text[250])
        {
            Caption = 'Video Url';
        }
        field(8; Icon; Media)
        {
            Caption = 'Icon';
        }
        field(9; "Item Type"; Option)
        {
            Caption = 'Item Type';
            InitValue = "Setup and Help";
            OptionCaption = ' ,Group,Setup and Help';
            OptionMembers = " ",Group,"Setup and Help";
        }
        field(10; Featured; Boolean)
        {
            Caption = 'Featured';
        }
        field(11; "Help Url"; Text[250])
        {
            Caption = 'Help Url';
        }
        field(12; "Assisted Setup Page ID"; Integer)
        {
            Caption = 'Assisted Setup Page ID';
        }
        field(13; "Tour Id"; Integer)
        {
            Caption = 'Tour Id';
        }
        field(14; "Video Status"; Boolean)
        {
            Caption = 'Video Status';
        }
        field(15; "Help Status"; Boolean)
        {
            Caption = 'Help Status';
        }
        field(16; "Tour Status"; Boolean)
        {
            Caption = 'Tour Status';
        }
    }

    keys
    {
        key(Key1; "Page ID")
        {
            Clustered = true;
        }
        key(Key2; "Order", Visible)
        {
        }
    }

    fieldgroups
    {
    }
}

