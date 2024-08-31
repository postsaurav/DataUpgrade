table 7308 "Put-away Template Line"
{
    Caption = 'Put-away Template Line';
    ReplicateData = false;

    fields
    {
        field(1; "Put-away Template Code"; Code[10])
        {
            Caption = 'Put-away Template Code';
            NotBlank = true;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Find Fixed Bin"; Boolean)
        {
            Caption = 'Find Fixed Bin';
        }
        field(5; "Find Floating Bin"; Boolean)
        {
            Caption = 'Find Floating Bin';
            InitValue = true;
        }
        field(6; "Find Same Item"; Boolean)
        {
            Caption = 'Find Same Item';
        }
        field(7; "Find Unit of Measure Match"; Boolean)
        {
            Caption = 'Find Unit of Measure Match';
        }
        field(8; "Find Bin w. Less than Min. Qty"; Boolean)
        {
            Caption = 'Find Bin w. Less than Min. Qty';
        }
        field(9; "Find Empty Bin"; Boolean)
        {
            Caption = 'Find Empty Bin';
        }
    }

    keys
    {
        key(Key1; "Put-away Template Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

