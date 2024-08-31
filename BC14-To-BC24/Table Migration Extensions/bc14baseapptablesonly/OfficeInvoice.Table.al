table 1606 "Office Invoice"
{
    Caption = 'Office Invoice', Comment = 'This table is used to keep track of invoices that have been created from the context of an Office add-in.';

    fields
    {
        field(1; "Item ID"; Text[250])
        {
            Caption = 'Item ID';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; Posted; Boolean)
        {
            Caption = 'Posted';
        }
    }

    keys
    {
        key(Key1; "Item ID", "Document No.", Posted)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

