table 981 "Payment Registration Buffer"
{
    Caption = 'Payment Registration Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Ledger Entry No."; Integer)
        {
            Caption = 'Ledger Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(6; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = SystemMetadata;
        }
        field(7; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(8; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
            DataClassification = SystemMetadata;
        }
        field(9; "Payment Made"; Boolean)
        {
            Caption = 'Payment Made';
            DataClassification = SystemMetadata;
        }
        field(10; "Date Received"; Date)
        {
            Caption = 'Date Received';
            DataClassification = SystemMetadata;
        }
        field(11; "Amount Received"; Decimal)
        {
            Caption = 'Amount Received';
            DataClassification = SystemMetadata;
        }
        field(12; "Original Remaining Amount"; Decimal)
        {
            Caption = 'Original Remaining Amount';
            DataClassification = SystemMetadata;
        }
        field(13; "Rem. Amt. after Discount"; Decimal)
        {
            Caption = 'Rem. Amt. after Discount';
            DataClassification = SystemMetadata;
        }
        field(14; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
            DataClassification = SystemMetadata;
        }
        field(15; "Limit Amount Received"; Boolean)
        {
            Caption = 'Limit Amount Received';
            DataClassification = SystemMetadata;
        }
        field(16; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = SystemMetadata;
            TableRelation = "Payment Method" WHERE ("Use for Invoicing" = CONST (true));
        }
        field(17; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'G/L Account,Bank Account';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(18; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account";
        }
        field(19; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Ledger Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Due Date")
        {
        }
    }

    fieldgroups
    {
    }
}

