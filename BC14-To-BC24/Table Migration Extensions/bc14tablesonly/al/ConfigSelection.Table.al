table 8621 "Config. Selection"
{
    Caption = 'Config. Selection';
    ReplicateData = false;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = false;
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(4; "Line Type"; Option)
        {
            Caption = 'Line Type';
            Editable = false;
            OptionCaption = 'Area,Group,Table';
            OptionMembers = "Area",Group,"Table";
        }
        field(5; "Parent Line No."; Integer)
        {
            Caption = 'Parent Line No.';
            Editable = false;
        }
        field(6; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(25; "Vertical Sorting"; Integer)
        {
            Caption = 'Vertical Sorting';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Vertical Sorting")
        {
        }
    }

    fieldgroups
    {
    }
}

