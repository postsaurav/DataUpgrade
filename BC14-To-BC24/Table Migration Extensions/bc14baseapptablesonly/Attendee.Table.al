table 5199 Attendee
{
    Caption = 'Attendee';

    fields
    {
        field(1; "To-do No."; Code[20])
        {
            Caption = 'Task No.';
            TableRelation = "To-do";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Attendance Type"; Option)
        {
            Caption = 'Attendance Type';
            OptionCaption = 'Required,Optional,To-do Organizer';
            OptionMembers = Required,Optional,"To-do Organizer";
        }
        field(4; "Attendee Type"; Option)
        {
            Caption = 'Attendee Type';
            OptionCaption = 'Contact,Salesperson';
            OptionMembers = Contact,Salesperson;
        }
        field(5; "Attendee No."; Code[20])
        {
            Caption = 'Attendee No.';
            TableRelation = IF ("Attendee Type" = CONST (Contact)) Contact WHERE ("No." = FIELD ("Attendee No."))
            ELSE
            IF ("Attendee Type" = CONST (Salesperson)) "Salesperson/Purchaser" WHERE (Code = FIELD ("Attendee No."));
        }
        field(6; "Attendee Name"; Text[100])
        {
            Caption = 'Attendee Name';
            Editable = false;
        }
        field(7; "Send Invitation"; Boolean)
        {
            Caption = 'Send Invitation';
        }
        field(8; "Invitation Response Type"; Option)
        {
            Caption = 'Invitation Response Type';
            OptionCaption = 'None,Accepted,Declined,Tentative';
            OptionMembers = "None",Accepted,Declined,Tentative;
        }
        field(9; "Invitation Sent"; Boolean)
        {
            Caption = 'Invitation Sent';
        }
    }

    keys
    {
        key(Key1; "To-do No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "To-do No.", "Attendee Type", "Attendee No.")
        {
        }
        key(Key3; "To-do No.", "Attendance Type")
        {
        }
    }

    fieldgroups
    {
    }
}

