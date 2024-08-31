table 1900 "Cancelled Document"
{
    Caption = 'Cancelled Document';
    Permissions = TableData "Cancelled Document" = rimd;

    fields
    {
        field(1; "Source ID"; Integer)
        {
            Caption = 'Source ID';
        }
        field(2; "Cancelled Doc. No."; Code[20])
        {
            Caption = 'Cancelled Doc. No.';
            TableRelation = IF ("Source ID" = CONST (112)) "Sales Invoice Header"."No."
            ELSE
            IF ("Source ID" = CONST (122)) "Purch. Inv. Header"."No."
            ELSE
            IF ("Source ID" = CONST (114)) "Sales Cr.Memo Header"."No."
            ELSE
            IF ("Source ID" = CONST (124)) "Purch. Cr. Memo Hdr."."No.";
        }
        field(3; "Cancelled By Doc. No."; Code[20])
        {
            Caption = 'Cancelled By Doc. No.';
            TableRelation = IF ("Source ID" = CONST (114)) "Sales Invoice Header"."No."
            ELSE
            IF ("Source ID" = CONST (124)) "Purch. Inv. Header"."No."
            ELSE
            IF ("Source ID" = CONST (112)) "Sales Cr.Memo Header"."No."
            ELSE
            IF ("Source ID" = CONST (122)) "Purch. Cr. Memo Hdr."."No.";
        }
    }

    keys
    {
        key(Key1; "Source ID", "Cancelled Doc. No.")
        {
            Clustered = true;
        }
        key(Key2; "Cancelled By Doc. No.")
        {
        }
    }

    fieldgroups
    {
    }
}

