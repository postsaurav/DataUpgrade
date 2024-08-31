table 906 "Assembly Comment Line"
{
    Caption = 'Assembly Comment Line';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Assembly Order,,,Blanket Order,Posted Assembly';
            OptionMembers = Quote,"Assembly Order",,,"Blanket Order","Posted Assembly";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            NotBlank = true;
            TableRelation = IF ("Document Type" = FILTER ("Posted Assembly")) "Posted Assembly Header"."No."
            ELSE
            "Assembly Header"."No." WHERE ("Document Type" = FIELD ("Document Type"));
        }
        field(3; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(12; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Document Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

