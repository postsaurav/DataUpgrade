table 1600 "Office Add-in Context"
{
    Caption = 'Office Add-in Context';

    fields
    {
        field(1; Email; Text[80])
        {
            Caption = 'Email';
            Description = 'Email address of the Outlook contact.';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            Description = 'Display name of the Outlook contact.';
        }
        field(3; "Document Type"; Text[20])
        {
            Caption = 'Document Type';
            Description = 'Type of the referenced document.';
        }
        field(4; "Document No."; Code[250])
        {
            Caption = 'Document No.';
            Description = 'No. of the referenced document.';
        }
        field(5; "Regular Expression Match"; Text[250])
        {
            Caption = 'Regular Expression Match';
            Description = 'Raw regular expression match.';
        }
        field(6; Duration; Text[20])
        {
            Caption = 'Duration';
            Description = 'Duration of the meeting.';
        }
        field(8; Command; Text[30])
        {
            Caption = 'Command';
            Description = 'Outlook add-in command.';
        }
        field(12; "Item ID"; Text[250])
        {
            Caption = 'Item ID';
            Description = 'Exchange item ID.';
        }
        field(13; Version; Text[20])
        {
            Caption = 'Version';
            Description = 'Add-in version';
        }
        field(14; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
        }
        field(15; Subject; Text[250])
        {
            Caption = 'Subject';
            Description = 'Subject of the appointment or message.';
        }
        field(16; "Item Type"; Option)
        {
            Caption = 'Item Type';
            OptionCaption = 'Message,Appointment';
            OptionMembers = Message,Appointment;
        }
        field(18; Mode; Option)
        {
            Caption = 'Mode';
            OptionCaption = 'Read,Compose';
            OptionMembers = Read,Compose;
        }
    }

    keys
    {
        key(Key1; Email)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

