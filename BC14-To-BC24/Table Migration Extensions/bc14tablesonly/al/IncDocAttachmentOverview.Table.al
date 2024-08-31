table 137 "Inc. Doc. Attachment Overview"
{
    Caption = 'Inc. Doc. Attachment Overview';

    fields
    {
        field(1; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            InitValue = 0;
        }
        field(3; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }
        field(4; "Created By User Name"; Code[50])
        {
            Caption = 'Created By User Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(5; Name; Text[250])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            Editable = false;
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
            OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
        }
        field(7; "File Extension"; Text[30])
        {
            Caption = 'File Extension';
            Editable = false;
        }
        field(100; "Attachment Type"; Option)
        {
            Caption = 'Attachment Type';
            Editable = false;
            OptionCaption = ',Group,Main Attachment,OCR Result,Supporting Attachment,Link';
            OptionMembers = ,Group,"Main Attachment","OCR Result","Supporting Attachment",Link;
        }
        field(101; "Sorting Order"; Integer)
        {
            Caption = 'Sorting Order';
        }
        field(102; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
    }

    keys
    {
        key(Key1; "Sorting Order", "Incoming Document Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Created Date-Time", Name, "File Extension")
        {
        }
    }
}

