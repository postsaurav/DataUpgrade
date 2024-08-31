table 292 "Reminder Terms"
{
    Caption = 'Reminder Terms';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Post Interest"; Boolean)
        {
            Caption = 'Post Interest';
        }
        field(4; "Post Additional Fee"; Boolean)
        {
            Caption = 'Post Additional Fee';
        }
        field(5; "Max. No. of Reminders"; Integer)
        {
            Caption = 'Max. No. of Reminders';
            MinValue = 0;
        }
        field(6; "Minimum Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Minimum Amount (LCY)';
            MinValue = 0;
        }
        field(7; "Post Add. Fee per Line"; Boolean)
        {
            Caption = 'Post Add. Fee per Line';
        }
        field(8; "Note About Line Fee on Report"; Text[150])
        {
            Caption = 'Note About Line Fee on Report';
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
    }
}

