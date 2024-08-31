table 1228 "Payment Jnl. Export Error Text"
{
    Caption = 'Payment Jnl. Export Error Text';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(3; "Journal Line No."; Integer)
        {
            Caption = 'Journal Line No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; "Error Text"; Text[250])
        {
            Caption = 'Error Text';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; "Additional Information"; Text[250])
        {
            Caption = 'Additional Information';
        }
        field(8; "Support URL"; Text[250])
        {
            Caption = 'Support URL';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Document No.", "Journal Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

