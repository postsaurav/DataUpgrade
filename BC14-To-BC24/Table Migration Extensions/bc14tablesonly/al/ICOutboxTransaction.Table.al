table 414 "IC Outbox Transaction"
{
    Caption = 'IC Outbox Transaction';

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
            TableRelation = "IC Partner".Code;
        }
        field(3; "Source Type"; Option)
        {
            Caption = 'Source Type';
            Editable = false;
            OptionCaption = 'Journal Line,Sales Document,Purchase Document';
            OptionMembers = "Journal Line","Sales Document","Purchase Document";
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
            OptionCaption = 'Rejected by Current Company,Created by Current Company';
            OptionMembers = "Rejected by Current Company","Created by Current Company";
        }
        field(9; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(10; "Line Action"; Option)
        {
            Caption = 'Line Action';
            OptionCaption = 'No Action,Send to IC Partner,Return to Inbox,Cancel';
            OptionMembers = "No Action","Send to IC Partner","Return to Inbox",Cancel;
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
        key(Key2; "IC Partner Code")
        {
        }
    }

    fieldgroups
    {
    }
}

