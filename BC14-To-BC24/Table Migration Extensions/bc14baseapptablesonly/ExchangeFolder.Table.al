table 5320 "Exchange Folder"
{
    Caption = 'Exchange Folder';

    fields
    {
        field(1; "Unique ID"; BLOB)
        {
            Caption = 'Unique ID';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; FullPath; Text[250])
        {
            Caption = 'FullPath';
        }
        field(4; Depth; Integer)
        {
            Caption = 'Depth';
        }
        field(5; Cached; Boolean)
        {
            Caption = 'Cached';
        }
    }

    keys
    {
        key(Key1; FullPath)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

