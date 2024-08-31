table 744 "VAT Report Line Relation"
{
    Caption = 'VAT Report Line Relation';

    fields
    {
        field(1; "VAT Report No."; Code[20])
        {
            Caption = 'VAT Report No.';
            TableRelation = "VAT Report Header"."No.";
        }
        field(2; "VAT Report Line No."; Integer)
        {
            Caption = 'VAT Report Line No.';
            TableRelation = "VAT Report Line"."Line No.";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(11; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(Key1; "VAT Report No.", "VAT Report Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

