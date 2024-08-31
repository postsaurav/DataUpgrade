table 383 "Detailed CV Ledg. Entry Buffer"
{
    Caption = 'Detailed CV Ledg. Entry Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "CV Ledger Entry No."; Integer)
        {
            Caption = 'CV Ledger Entry No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            DataClassification = SystemMetadata;
            OptionCaption = ',Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount,Payment Tolerance,Payment Discount Tolerance,Payment Tolerance (VAT Excl.),Payment Tolerance (VAT Adjustment),Payment Discount Tolerance (VAT Excl.),Payment Discount Tolerance (VAT Adjustment)';
            OptionMembers = ,"Initial Entry",Application,"Unrealized Loss","Unrealized Gain","Realized Loss","Realized Gain","Payment Discount","Payment Discount (VAT Excl.)","Payment Discount (VAT Adjustment)","Appln. Rounding","Correction of Remaining Amount","Payment Tolerance","Payment Discount Tolerance","Payment Tolerance (VAT Excl.)","Payment Tolerance (VAT Adjustment)","Payment Discount Tolerance (VAT Excl.)","Payment Discount Tolerance (VAT Adjustment)";
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = SystemMetadata;
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(7; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(8; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(9; "CV No."; Code[20])
        {
            Caption = 'CV No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = SystemMetadata;
            TableRelation = Currency;
        }
        field(11; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = SystemMetadata;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(12; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = SystemMetadata;
            TableRelation = "Source Code";
        }
        field(13; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            DataClassification = SystemMetadata;
        }
        field(14; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = SystemMetadata;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(15; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = SystemMetadata;
            TableRelation = "Reason Code";
        }
        field(16; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
            DataClassification = SystemMetadata;
        }
        field(17; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
            DataClassification = SystemMetadata;
        }
        field(18; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(19; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(20; "Initial Entry Due Date"; Date)
        {
            Caption = 'Initial Entry Due Date';
            DataClassification = SystemMetadata;
        }
        field(21; "Initial Entry Global Dim. 1"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 1';
            DataClassification = SystemMetadata;
        }
        field(22; "Initial Entry Global Dim. 2"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 2';
            DataClassification = SystemMetadata;
        }
        field(23; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(24; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Business Posting Group";
        }
        field(25; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Product Posting Group";
        }
        field(26; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Area";
        }
        field(27; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
            DataClassification = SystemMetadata;
        }
        field(28; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Group";
        }
        field(29; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
            DataClassification = SystemMetadata;
        }
        field(30; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Business Posting Group";
        }
        field(31; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Product Posting Group";
        }
        field(32; "Additional-Currency Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional-Currency Amount';
            DataClassification = SystemMetadata;
        }
        field(33; "VAT Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(34; "Use Additional-Currency Amount"; Boolean)
        {
            Caption = 'Use Additional-Currency Amount';
            DataClassification = SystemMetadata;
        }
        field(35; "Initial Document Type"; Option)
        {
            Caption = 'Initial Document Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(36; "Applied CV Ledger Entry No."; Integer)
        {
            Caption = 'Applied CV Ledger Entry No.';
            DataClassification = SystemMetadata;
        }
        field(39; "Remaining Pmt. Disc. Possible"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Pmt. Disc. Possible';
            DataClassification = SystemMetadata;
        }
        field(40; "Max. Payment Tolerance"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Max. Payment Tolerance';
            DataClassification = SystemMetadata;
        }
        field(41; "Tax Jurisdiction Code"; Code[10])
        {
            Caption = 'Tax Jurisdiction Code';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Tax Jurisdiction";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "CV Ledger Entry No.", "Entry Type")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key3; "CV No.", "Initial Entry Due Date", "Posting Date", "Currency Code")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key4; "CV No.", "Posting Date", "Entry Type", "Currency Code")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key5; "CV No.", "Initial Document Type", "Document Type")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key6; "Document Type", "Document No.", "Posting Date")
        {
        }
        key(Key7; "Initial Document Type", "CV No.", "Posting Date", "Currency Code", "Entry Type")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key8; "CV No.", "Initial Entry Due Date", "Posting Date", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Currency Code")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key9; "CV No.", "Posting Date", "Entry Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Currency Code")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key10; "CV No.", "Initial Document Type", "Document Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key11; "Initial Document Type", "CV No.", "Posting Date", "Currency Code", "Entry Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
    }

    fieldgroups
    {
    }
}

