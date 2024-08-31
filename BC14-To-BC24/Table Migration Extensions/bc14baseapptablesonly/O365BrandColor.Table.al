table 2121 "O365 Brand Color"
{
    Caption = 'O365 Brand Color';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(6; "Color Value"; Code[10])
        {
            Caption = 'Color Value';
        }
        field(15; "Sample Picture"; Media)
        {
            Caption = 'Sample Picture';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; Name, "Sample Picture")
        {
        }
    }
}

