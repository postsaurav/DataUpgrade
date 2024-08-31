table 9510 "Email Parameter"
{
    Caption = 'Email Parameter';

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
            TableRelation = "Sales Header"."Document Type";
        }
        field(3; "Parameter Type"; Option)
        {
            Caption = 'Parameter Type';
            OptionCaption = ' ,Subject,Address,Body';
            OptionMembers = " ",Subject,Address,Body;
        }
        field(4; "Parameter Value"; Text[250])
        {
            Caption = 'Parameter Value';
        }
        field(5; "Parameter BLOB"; BLOB)
        {
            Caption = 'Parameter BLOB';
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", "Parameter Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

