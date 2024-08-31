table 5644 "FA Posting Type"
{
    Caption = 'FA Posting Type';

    fields
    {
        field(1; "FA Posting Type No."; Integer)
        {
            Caption = 'FA Posting Type No.';
        }
        field(2; "FA Posting Type Name"; Text[50])
        {
            Caption = 'FA Posting Type Name';
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
        key(Key1; "FA Posting Type No.", "FA Posting Type Name")
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

