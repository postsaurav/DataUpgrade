table 5645 "FA Date Type"
{
    Caption = 'FA Date Type';

    fields
    {
        field(1; "FA Date Type No."; Integer)
        {
            Caption = 'FA Date Type No.';
        }
        field(2; "FA Date Type Name"; Text[50])
        {
            Caption = 'FA Date Type Name';
        }
        field(3; "FA Entry"; Boolean)
        {
            Caption = 'FA Entry';
        }
        field(4; "G/L Entry"; Boolean)
        {
            Caption = 'G/L Entry';
        }
        field(5; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(Key1; "FA Date Type No.", "FA Date Type Name")
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

