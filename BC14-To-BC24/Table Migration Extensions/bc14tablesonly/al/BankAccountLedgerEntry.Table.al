table 271 "Bank Account Ledger Entry"
{
    Caption = 'Bank Account Ledger Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(14; "Remaining Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amount';
        }
        field(17; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(22; "Bank Acc. Posting Group"; Code[20])
        {
            Caption = 'Bank Acc. Posting Group';
            TableRelation = "Bank Account Posting Group";
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(25; "Our Contact Code"; Code[20])
        {
            Caption = 'Our Contact Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(27; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(28; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(36; Open; Boolean)
        {
            Caption = 'Open';
        }
        field(43; Positive; Boolean)
        {
            Caption = 'Positive';
        }
        field(44; "Closed by Entry No."; Integer)
        {
            Caption = 'Closed by Entry No.';
            TableRelation = "Bank Account Ledger Entry";
        }
        field(45; "Closed at Date"; Date)
        {
            Caption = 'Closed at Date';
        }
        field(49; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(50; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(51; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",,Employee;
        }
        field(52; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST (Employee)) Employee;
        }
        field(53; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(55; "Statement Status"; Option)
        {
            Caption = 'Statement Status';
            OptionCaption = 'Open,Bank Acc. Entry Applied,Check Entry Applied,Closed';
            OptionMembers = Open,"Bank Acc. Entry Applied","Check Entry Applied",Closed;
        }
        field(56; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            TableRelation = "Bank Acc. Reconciliation Line"."Statement No." WHERE ("Bank Account No." = FIELD ("Bank Account No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(57; "Statement Line No."; Integer)
        {
            Caption = 'Statement Line No.';
            TableRelation = "Bank Acc. Reconciliation Line"."Statement Line No." WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                                        "Statement No." = FIELD ("Statement No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(58; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(59; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(60; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount (LCY)';
        }
        field(61; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount (LCY)';
        }
        field(62; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;
        }
        field(63; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(64; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(65; "Reversed by Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed by Entry No.';
            TableRelation = "Bank Account Ledger Entry";
        }
        field(66; "Reversed Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Reversed Entry No.';
            TableRelation = "Bank Account Ledger Entry";
        }
        field(70; "Check Ledger Entries"; Integer)
        {
            CalcFormula = Count ("Check Ledger Entry" WHERE ("Bank Account Ledger Entry No." = FIELD ("Entry No.")));
            Caption = 'Check Ledger Entries';
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Bank Account No.", "Posting Date")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key3; "Bank Account No.", Open)
        {
        }
        key(Key4; "Document Type", "Bank Account No.", "Posting Date")
        {
            MaintainSQLIndex = false;
            SumIndexFields = Amount;
        }
        key(Key5; "Document No.", "Posting Date")
        {
        }
        key(Key6; "Transaction No.")
        {
        }
        key(Key7; "Bank Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "Bank Account No.", "Posting Date", "Document Type", "Document No.")
        {
        }
    }
}

