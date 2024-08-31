table 1020 "Job Usage Link"
{
    Caption = 'Job Usage Link';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            TableRelation = "Job Planning Line"."Line No." WHERE ("Job No." = FIELD ("Job No."),
                                                                  "Job Task No." = FIELD ("Job Task No."));
        }
        field(4; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Line No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

