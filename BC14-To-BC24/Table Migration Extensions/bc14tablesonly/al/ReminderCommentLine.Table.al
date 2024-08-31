table 299 "Reminder Comment Line"
{
    Caption = 'Reminder Comment Line';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Reminder,Issued Reminder';
            OptionMembers = Reminder,"Issued Reminder";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF (Type = CONST (Reminder)) "Reminder Header"
            ELSE
            IF (Type = CONST ("Issued Reminder")) "Issued Reminder Header";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; Type, "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

