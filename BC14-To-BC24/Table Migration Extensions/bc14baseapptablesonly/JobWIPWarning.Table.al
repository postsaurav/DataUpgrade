table 1007 "Job WIP Warning"
{
    Caption = 'Job WIP Warning';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(2; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(3; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No.";
        }
        field(4; "Job WIP Total Entry No."; Integer)
        {
            Caption = 'Job WIP Total Entry No.';
            Editable = false;
            TableRelation = "Job WIP Total";
        }
        field(5; "Warning Message"; Text[250])
        {
            Caption = 'Warning Message';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Job No.", "Job Task No.")
        {
        }
        key(Key3; "Job WIP Total Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

