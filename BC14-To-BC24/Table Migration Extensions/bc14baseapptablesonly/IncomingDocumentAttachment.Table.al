table 133 "Incoming Document Attachment"
{
    Caption = 'Incoming Document Attachment';

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
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Image,PDF,Word,Excel,PowerPoint,Email,XML,Other';
            OptionMembers = " ",Image,PDF,Word,Excel,PowerPoint,Email,XML,Other;
        }
        field(7; "File Extension"; Text[30])
        {
            Caption = 'File Extension';
        }
        field(8; Content; BLOB)
        {
            Caption = 'Content';
            SubType = Bitmap;
        }
        field(9; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(11; "Document Table No. Filter"; Integer)
        {
            Caption = 'Document Table No. Filter';
            FieldClass = FlowFilter;
        }
        field(12; "Document Type Filter"; Option)
        {
            Caption = 'Document Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(13; "Document No. Filter"; Code[20])
        {
            Caption = 'Document No. Filter';
            FieldClass = FlowFilter;
        }
        field(14; "Journal Template Name Filter"; Code[20])
        {
            Caption = 'Journal Template Name Filter';
            FieldClass = FlowFilter;
        }
        field(15; "Journal Batch Name Filter"; Code[20])
        {
            Caption = 'Journal Batch Name Filter';
            FieldClass = FlowFilter;
        }
        field(16; "Journal Line No. Filter"; Integer)
        {
            Caption = 'Journal Line No. Filter';
            FieldClass = FlowFilter;
        }
        field(17; Default; Boolean)
        {
            Caption = 'Default';
        }
        field(18; "Use for OCR"; Boolean)
        {
            Caption = 'Use for OCR';
        }
        field(19; "External Document Reference"; Text[50])
        {
            Caption = 'External Document Reference';
        }
        field(20; "OCR Service Document Reference"; Text[50])
        {
            Caption = 'OCR Service Document Reference';
        }
        field(21; "Generated from OCR"; Boolean)
        {
            Caption = 'Generated from OCR';
            Editable = false;
        }
        field(22; "Main Attachment"; Boolean)
        {
            Caption = 'Main Attachment';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; "Incoming Document Entry No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.", "Posting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Created Date-Time", Name, "File Extension", Type)
        {
        }
    }
}

