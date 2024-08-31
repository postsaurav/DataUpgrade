table 130 "Incoming Document"
{
    Caption = 'Incoming Document';
    DataCaptionFields = "Vendor Name", "Vendor Invoice No.", Description;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
            Editable = false;
        }
        field(4; "Created By User ID"; Guid)
        {
            Caption = 'Created By User ID';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
            TableRelation = User;
        }
        field(5; "Created By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Created By User ID")));
            Caption = 'Created By User Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; Released; Boolean)
        {
            Caption = 'Released';
            Editable = false;
        }
        field(7; "Released Date-Time"; DateTime)
        {
            Caption = 'Released Date-Time';
            Editable = false;
        }
        field(8; "Released By User ID"; Guid)
        {
            Caption = 'Released By User ID';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
            TableRelation = User;
        }
        field(9; "Released By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Released By User ID")));
            Caption = 'Released By User Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Last Date-Time Modified"; DateTime)
        {
            Caption = 'Last Date-Time Modified';
            Editable = false;
        }
        field(11; "Last Modified By User ID"; Guid)
        {
            Caption = 'Last Modified By User ID';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
            TableRelation = User;
        }
        field(12; "Last Modified By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Last Modified By User ID")));
            Caption = 'Last Modified By User Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
        field(14; "Posted Date-Time"; DateTime)
        {
            Caption = 'Posted Date-Time';
            Editable = false;
        }
        field(15; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            InitValue = " ";
            OptionCaption = 'Journal,Sales Invoice,Sales Credit Memo,Purchase Invoice,Purchase Credit Memo, ';
            OptionMembers = Journal,"Sales Invoice","Sales Credit Memo","Purchase Invoice","Purchase Credit Memo"," ";
        }
        field(16; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(17; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
            Editable = false;
        }
        field(18; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'New,Released,Rejected,Posted,Created,Failed,Pending Approval';
            OptionMembers = New,Released,Rejected,Posted,Created,Failed,"Pending Approval";
        }
        field(19; URL1; Text[250])
        {
            Caption = 'URL1';
            Editable = false;
        }
        field(20; URL2; Text[250])
        {
            Caption = 'URL2';
            Editable = false;
            ObsoleteReason = 'Unecessary field after increasing max text length of URL1 to 1024';
            ObsoleteState = Pending;
        }
        field(21; URL3; Text[250])
        {
            Caption = 'URL3';
            Editable = false;
            ObsoleteReason = 'Unecessary field after increasing max text length of URL1 to 1024';
            ObsoleteState = Pending;
        }
        field(22; URL4; Text[250])
        {
            Caption = 'URL4';
            Editable = false;
            ObsoleteReason = 'Unecessary field after increasing max text length of URL1 to 1024';
            ObsoleteState = Pending;
        }
        field(23; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(24; "Vendor VAT Registration No."; Text[30])
        {
            Caption = 'Vendor VAT Registration No.';
        }
        field(25; "Vendor IBAN"; Code[50])
        {
            Caption = 'Vendor IBAN';
        }
        field(26; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(27; "Vendor Bank Branch No."; Text[20])
        {
            Caption = 'Vendor Bank Branch No.';
        }
        field(28; "Vendor Bank Account No."; Text[30])
        {
            Caption = 'Vendor Bank Account No.';
        }
        field(29; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(30; "Data Exchange Type"; Code[20])
        {
            Caption = 'Data Exchange Type';
            TableRelation = "Data Exchange Type";
        }
        field(31; "OCR Data Corrected"; Boolean)
        {
            Caption = 'OCR Data Corrected';
            InitValue = false;
        }
        field(32; "OCR Status"; Option)
        {
            Caption = 'OCR Status';
            Editable = false;
            OptionCaption = ' ,Ready,Sent,Error,Success,Awaiting Verification';
            OptionMembers = " ",Ready,Sent,Error,Success,"Awaiting Verification";
        }
        field(33; "OCR Track ID"; Text[20])
        {
            Caption = 'OCR Track ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(38; "OCR Service Doc. Template Code"; Code[20])
        {
            Caption = 'OCR Service Doc. Template Code';
            TableRelation = "OCR Service Document Template";
        }
        field(39; "OCR Service Doc. Template Name"; Text[50])
        {
            CalcFormula = Lookup ("OCR Service Document Template".Name WHERE (Code = FIELD ("OCR Service Doc. Template Code")));
            Caption = 'OCR Service Doc. Template Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "OCR Process Finished"; Boolean)
        {
            Caption = 'OCR Process Finished';
        }
        field(41; "Created Doc. Error Msg. Type"; Option)
        {
            Caption = 'Created Doc. Error Msg. Type';
            InitValue = Error;
            OptionCaption = ' ,Error,Warning';
            OptionMembers = " ",Error,Warning;
        }
        field(42; "Vendor Id"; Guid)
        {
            Caption = 'Vendor Id';
            TableRelation = Vendor.Id;
        }
        field(50; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
        field(51; "Amount Excl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Excl. VAT';
        }
        field(52; "Amount Incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Incl. VAT';
        }
        field(53; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(54; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(55; "Vendor Invoice No."; Code[35])
        {
            Caption = 'Vendor Invoice No.';
        }
        field(56; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(57; "Vendor Phone No."; Text[30])
        {
            Caption = 'Vendor Phone No.';
        }
        field(58; "Related Record ID"; RecordID)
        {
            Caption = 'Related Record ID';
            DataClassification = SystemMetadata;
        }
        field(160; "Job Queue Status"; Option)
        {
            Caption = 'Job Queue Status';
            Editable = false;
            OptionCaption = ' ,Scheduled,Error,Processing';
            OptionMembers = " ",Scheduled,Error,Processing;
        }
        field(161; "Job Queue Entry ID"; Guid)
        {
            Caption = 'Job Queue Entry ID';
            Editable = false;
        }
        field(162; Processed; Boolean)
        {
            Caption = 'Processed';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; Status)
        {
        }
        key(Key3; "Document No.", "Posting Date")
        {
        }
        key(Key4; "OCR Status")
        {
        }
        key(Key5; "Vendor No.")
        {
        }
        key(Key6; Processed)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Created Date-Time", Description, "Amount Incl. VAT", Status, "Currency Code")
        {
        }
    }
}

