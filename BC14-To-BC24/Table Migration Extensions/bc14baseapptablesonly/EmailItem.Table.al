table 9500 "Email Item"
{
    Caption = 'Email Item';

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; "From Name"; Text[100])
        {
            Caption = 'From Name';
        }
        field(3; "From Address"; Text[250])
        {
            Caption = 'From Address';
        }
        field(4; "Send to"; Text[250])
        {
            Caption = 'Send to';
        }
        field(5; "Send CC"; Text[250])
        {
            Caption = 'Send CC';
        }
        field(6; "Send BCC"; Text[250])
        {
            Caption = 'Send BCC';
        }
        field(7; Subject; Text[250])
        {
            Caption = 'Subject';
        }
        field(8; Body; BLOB)
        {
            Caption = 'Body';
        }
        field(9; "Attachment File Path"; Text[250])
        {
            Caption = 'Attachment File Path';
        }
        field(10; "Attachment Name"; Text[250])
        {
            Caption = 'Attachment Name';
        }
        field(11; "Plaintext Formatted"; Boolean)
        {
            Caption = 'Plaintext Formatted';
            InitValue = true;
        }
        field(12; "Body File Path"; Text[250])
        {
            Caption = 'Body File Path';
        }
        field(13; "Message Type"; Option)
        {
            Caption = 'Message Type';
            OptionCaption = 'Custom Message,From Email Body Template';
            OptionMembers = "Custom Message","From Email Body Template";
        }
        field(21; "Attachment File Path 2"; Text[250])
        {
            Caption = 'Attachment File Path 2';
        }
        field(22; "Attachment Name 2"; Text[50])
        {
            Caption = 'Attachment Name 2';
        }
        field(23; "Attachment File Path 3"; Text[250])
        {
            Caption = 'Attachment File Path 3';
        }
        field(24; "Attachment Name 3"; Text[50])
        {
            Caption = 'Attachment Name 3';
        }
        field(25; "Attachment File Path 4"; Text[250])
        {
            Caption = 'Attachment File Path 4';
        }
        field(26; "Attachment Name 4"; Text[50])
        {
            Caption = 'Attachment Name 4';
        }
        field(27; "Attachment File Path 5"; Text[250])
        {
            Caption = 'Attachment File Path 5';
        }
        field(28; "Attachment Name 5"; Text[50])
        {
            Caption = 'Attachment Name 5';
        }
        field(29; "Attachment File Path 6"; Text[250])
        {
            Caption = 'Attachment File Path 6';
        }
        field(30; "Attachment Name 6"; Text[50])
        {
            Caption = 'Attachment Name 6';
        }
        field(31; "Attachment File Path 7"; Text[250])
        {
            Caption = 'Attachment File Path 7';
        }
        field(32; "Attachment Name 7"; Text[50])
        {
            Caption = 'Attachment Name 7';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

