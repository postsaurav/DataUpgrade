table 5935 "Service Email Queue"
{
    Caption = 'Service Email Queue';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "To Address"; Text[80])
        {
            Caption = 'To Address';
        }
        field(3; "Copy-to Address"; Text[80])
        {
            Caption = 'Copy-to Address';
        }
        field(4; "Subject Line"; Text[250])
        {
            Caption = 'Subject Line';
        }
        field(5; "Body Line"; Text[250])
        {
            Caption = 'Body Line';
        }
        field(6; "Attachment Filename"; Text[80])
        {
            Caption = 'Attachment Filename';
        }
        field(7; "Sending Date"; Date)
        {
            Caption = 'Sending Date';
        }
        field(8; "Sending Time"; Time)
        {
            Caption = 'Sending Time';
        }
        field(9; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = ' ,Processed,Error';
            OptionMembers = " ",Processed,Error;
        }
        field(10; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Service Order';
            OptionMembers = " ","Service Order";
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; Status, "Sending Date", "Document Type", "Document No.")
        {
        }
        key(Key3; "Document Type", "Document No.", Status, "Sending Date")
        {
        }
    }

    fieldgroups
    {
    }
}

