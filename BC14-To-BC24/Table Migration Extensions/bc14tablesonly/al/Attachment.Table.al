table 5062 Attachment
{
    Caption = 'Attachment';

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; "Attachment File"; BLOB)
        {
            Caption = 'Attachment File';
        }
        field(3; "Storage Type"; Option)
        {
            Caption = 'Storage Type';
            OptionCaption = 'Embedded,Disk File,Exchange Storage';
            OptionMembers = Embedded,"Disk File","Exchange Storage";
        }
        field(4; "Storage Pointer"; Text[250])
        {
            Caption = 'Storage Pointer';
        }
        field(5; "File Extension"; Text[250])
        {
            Caption = 'File Extension';
        }
        field(6; "Read Only"; Boolean)
        {
            Caption = 'Read Only';
        }
        field(7; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(8; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
        }
        field(13; "Merge Source"; BLOB)
        {
            Caption = 'Merge Source';
        }
        field(14; "Email Message ID"; BLOB)
        {
            Caption = 'Email Message ID';
        }
        field(15; "Email Entry ID"; BLOB)
        {
            Caption = 'Email Entry ID';
        }
        field(16; "Email Message Checksum"; Integer)
        {
            Caption = 'Email Message Checksum';
        }
        field(17; "Email Message Url"; BLOB)
        {
            Caption = 'Email Message Url';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Email Message Checksum")
        {
        }
    }

    fieldgroups
    {
    }
}

