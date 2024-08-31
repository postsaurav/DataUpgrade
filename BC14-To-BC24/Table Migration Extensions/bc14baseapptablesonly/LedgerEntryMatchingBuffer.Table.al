table 1248 "Ledger Entry Matching Buffer"
{
    Caption = 'Ledger Entry Matching Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Account Type"; Option)
        {
            Caption = 'Account Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Customer,Vendor,G/L Account,Bank Account';
            OptionMembers = Customer,Vendor,"G/L Account","Bank Account";
        }
        field(3; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = SystemMetadata;
        }
        field(4; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(5; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            DataClassification = SystemMetadata;
        }
        field(8; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(9; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = SystemMetadata;
        }
        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = SystemMetadata;
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(12; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = SystemMetadata;
        }
        field(13; "Payment Reference"; Code[50])
        {
            Caption = 'Payment Reference';
            DataClassification = SystemMetadata;
        }
        field(20; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
            DataClassification = SystemMetadata;
        }
        field(21; "Remaining Amt. Incl. Discount"; Decimal)
        {
            Caption = 'Remaining Amt. Incl. Discount';
            DataClassification = SystemMetadata;
        }
        field(22; "Pmt. Discount Due Date"; Date)
        {
            Caption = 'Pmt. Discount Due Date';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Account Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

