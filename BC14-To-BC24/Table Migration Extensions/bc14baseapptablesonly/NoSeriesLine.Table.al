table 309 "No. Series Line"
{
    Caption = 'No. Series Line';

    fields
    {
        field(1; "Series Code"; Code[20])
        {
            Caption = 'Series Code';
            NotBlank = true;
            TableRelation = "No. Series";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(4; "Starting No."; Code[20])
        {
            Caption = 'Starting No.';
        }
        field(5; "Ending No."; Code[20])
        {
            Caption = 'Ending No.';
        }
        field(6; "Warning No."; Code[20])
        {
            Caption = 'Warning No.';
        }
        field(7; "Increment-by No."; Integer)
        {
            Caption = 'Increment-by No.';
            InitValue = 1;
            MinValue = 1;
        }
        field(8; "Last No. Used"; Code[20])
        {
            Caption = 'Last No. Used';
        }
        field(9; Open; Boolean)
        {
            Caption = 'Open';
            Editable = false;
            InitValue = true;
        }
        field(10; "Last Date Used"; Date)
        {
            Caption = 'Last Date Used';
        }
    }

    keys
    {
        key(Key1; "Series Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Series Code", "Starting Date", "Starting No.")
        {
        }
        key(Key3; "Starting No.")
        {
        }
    }

    fieldgroups
    {
    }
}

