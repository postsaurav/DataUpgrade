table 60 "Document Sending Profile"
{
    Caption = 'Document Sending Profile';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; Printer; Option)
        {
            Caption = 'Printer';
            OptionCaption = 'No,Yes (Prompt for Settings),Yes (Use Default Settings)';
            OptionMembers = No,"Yes (Prompt for Settings)","Yes (Use Default Settings)";
        }
        field(11; "E-Mail"; Option)
        {
            Caption = 'Email';
            OptionCaption = 'No,Yes (Prompt for Settings),Yes (Use Default Settings)';
            OptionMembers = No,"Yes (Prompt for Settings)","Yes (Use Default Settings)";
        }
        field(12; "E-Mail Attachment"; Option)
        {
            Caption = 'Email Attachment';
            OptionCaption = 'PDF,Electronic Document,PDF & Electronic Document';
            OptionMembers = PDF,"Electronic Document","PDF & Electronic Document";
        }
        field(13; "E-Mail Format"; Code[20])
        {
            Caption = 'Email Format';
            TableRelation = "Electronic Document Format".Code;
        }
        field(15; Disk; Option)
        {
            Caption = 'Disk';
            OptionCaption = 'No,PDF,Electronic Document,PDF & Electronic Document';
            OptionMembers = No,PDF,"Electronic Document","PDF & Electronic Document";
        }
        field(16; "Disk Format"; Code[20])
        {
            Caption = 'Disk Format';
            TableRelation = "Electronic Document Format".Code;
        }
        field(20; "Electronic Document"; Option)
        {
            Caption = 'Electronic Document';
            OptionCaption = 'No,Through Document Exchange Service';
            OptionMembers = No,"Through Document Exchange Service";
        }
        field(21; "Electronic Format"; Code[20])
        {
            Caption = 'Electronic Format';
            TableRelation = "Electronic Document Format".Code;
        }
        field(30; Default; Boolean)
        {
            Caption = 'Default';
        }
        field(50; "Send To"; Option)
        {
            Caption = 'Send To';
            OptionCaption = 'Disk,Email,Print,Electronic Document';
            OptionMembers = Disk,Email,Print,"Electronic Document";
        }
        field(51; Usage; Option)
        {
            Caption = 'Usage';
            OptionCaption = 'Sales Invoice,Sales Credit Memo,,Service Invoice,Service Credit Memo,Job Quote';
            OptionMembers = "Sales Invoice","Sales Credit Memo",,"Service Invoice","Service Credit Memo","Job Quote";
        }
        field(52; "One Related Party Selected"; Boolean)
        {
            Caption = 'One Related Party Selected';
            InitValue = true;
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

