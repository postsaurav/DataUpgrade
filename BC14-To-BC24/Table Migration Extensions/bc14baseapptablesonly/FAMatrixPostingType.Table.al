table 5647 "FA Matrix Posting Type"
{
    Caption = 'FA Matrix Posting Type';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "FA Posting Type Name"; Text[50])
        {
            Caption = 'FA Posting Type Name';
        }
    }

    keys
    {
        key(Key1; "Entry No.", "FA Posting Type Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

