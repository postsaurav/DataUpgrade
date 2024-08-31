table 1294 "Applied Payment Entry"
{
    Caption = 'Applied Payment Entry';

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(2; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            TableRelation = "Bank Acc. Reconciliation"."Statement No." WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                              "Statement Type" = FIELD ("Statement Type"));
        }
        field(3; "Statement Line No."; Integer)
        {
            Caption = 'Statement Line No.';
        }
        field(20; "Statement Type"; Option)
        {
            Caption = 'Statement Type';
            OptionCaption = 'Bank Reconciliation,Payment Application';
            OptionMembers = "Bank Reconciliation","Payment Application";
        }
        field(21; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(22; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST ("G/L Account")) "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                                                          Blocked = CONST (false))
            ELSE
            IF ("Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST ("IC Partner")) "IC Partner";
        }
        field(23; "Applies-to Entry No."; Integer)
        {
            Caption = 'Applies-to Entry No.';
            TableRelation = IF ("Account Type" = CONST ("G/L Account")) "G/L Entry"
            ELSE
            IF ("Account Type" = CONST (Customer)) "Cust. Ledger Entry" WHERE (Open = CONST (true))
            ELSE
            IF ("Account Type" = CONST (Vendor)) "Vendor Ledger Entry" WHERE (Open = CONST (true))
            ELSE
            IF ("Account Type" = CONST ("Bank Account")) "Bank Account Ledger Entry" WHERE (Open = CONST (true));
        }
        field(24; "Applied Amount"; Decimal)
        {
            Caption = 'Applied Amount';
        }
        field(29; "Applied Pmt. Discount"; Decimal)
        {
            Caption = 'Applied Pmt. Discount';
        }
        field(30; Quality; Integer)
        {
            Caption = 'Quality';
        }
        field(31; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(32; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(33; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(34; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(35; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(36; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(37; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(50; "Match Confidence"; Option)
        {
            Caption = 'Match Confidence';
            Editable = false;
            InitValue = "None";
            OptionCaption = 'None,Low,Medium,High,High - Text-to-Account Mapping,Manual,Accepted';
            OptionMembers = "None",Low,Medium,High,"High - Text-to-Account Mapping",Manual,Accepted;
        }
    }

    keys
    {
        key(Key1; "Statement Type", "Bank Account No.", "Statement No.", "Statement Line No.", "Account Type", "Account No.", "Applies-to Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

