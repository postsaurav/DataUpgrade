table 420 "Handled IC Inbox Trans."
{
    Caption = 'Handled IC Inbox Trans.';

    fields
    {
        field(1; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            Editable = false;
        }
        field(2; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(3; "Source Type"; Option)
        {
            Caption = 'Source Type';
            Editable = false;
            OptionCaption = 'Journal,Sales Document,Purchase Document';
            OptionMembers = Journal,"Sales Document","Purchase Document";
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Refund,Order,Return Order';
            OptionMembers = " ",Payment,Invoice,"Credit Memo",Refund,"Order","Return Order";
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
        }
        field(8; "Transaction Source"; Option)
        {
            Caption = 'Transaction Source';
            Editable = false;
            OptionCaption = 'Returned by Partner,Created by Partner';
            OptionMembers = "Returned by Partner","Created by Partner";
        }
        field(9; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Accepted,Posted,,Returned to IC Partner,Cancelled';
            OptionMembers = Accepted,Posted,,"Returned to IC Partner",Cancelled;
        }
        field(12; "IC Partner G/L Acc. No."; Code[20])
        {
            Caption = 'IC Partner G/L Acc. No.';
        }
        field(13; "Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
        }
    }

    keys
    {
        key(Key1; "Transaction No.", "IC Partner Code", "Transaction Source", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

