table 382 "CV Ledger Entry Buffer"
{
    Caption = 'CV Ledger Entry Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(3; "CV No."; Code[20])
        {
            Caption = 'CV No.';
            DataClassification = SystemMetadata;
            TableRelation = Customer;
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
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = SystemMetadata;
            TableRelation = Currency;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(14; "Remaining Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amount';
            DataClassification = SystemMetadata;
        }
        field(15; "Original Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Amt. (LCY)';
            DataClassification = SystemMetadata;
        }
        field(16; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Amt. (LCY)';
            DataClassification = SystemMetadata;
        }
        field(17; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(18; "Sales/Purchase (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales/Purchase (LCY)';
            DataClassification = SystemMetadata;
        }
        field(19; "Profit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Profit (LCY)';
            DataClassification = SystemMetadata;
        }
        field(20; "Inv. Discount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(21; "Bill-to/Pay-to CV No."; Code[20])
        {
            Caption = 'Bill-to/Pay-to CV No.';
            DataClassification = SystemMetadata;
            TableRelation = Customer;
        }
        field(22; "CV Posting Group"; Code[20])
        {
            Caption = 'CV Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Customer Posting Group";
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(25; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = SystemMetadata;
            TableRelation = "Salesperson/Purchaser";
        }
        field(27; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = SystemMetadata;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(28; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = SystemMetadata;
            TableRelation = "Source Code";
        }
        field(33; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
            DataClassification = SystemMetadata;
        }
        field(34; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(35; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            DataClassification = SystemMetadata;
        }
        field(36; Open; Boolean)
        {
            Caption = 'Open';
            DataClassification = SystemMetadata;
        }
        field(37; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = SystemMetadata;
        }
        field(38; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
            DataClassification = SystemMetadata;
        }
        field(39; "Original Pmt. Disc. Possible"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Pmt. Disc. Possible';
            DataClassification = SystemMetadata;
        }
        field(40; "Pmt. Disc. Given (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Pmt. Disc. Given (LCY)';
            DataClassification = SystemMetadata;
        }
        field(43; Positive; Boolean)
        {
            Caption = 'Positive';
            DataClassification = SystemMetadata;
        }
        field(44; "Closed by Entry No."; Integer)
        {
            Caption = 'Closed by Entry No.';
            DataClassification = SystemMetadata;
            TableRelation = "Cust. Ledger Entry";
        }
        field(45; "Closed at Date"; Date)
        {
            Caption = 'Closed at Date';
            DataClassification = SystemMetadata;
        }
        field(46; "Closed by Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Closed by Amount';
            DataClassification = SystemMetadata;
        }
        field(47; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';
            DataClassification = SystemMetadata;
        }
        field(49; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = SystemMetadata;
        }
        field(50; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = SystemMetadata;
            TableRelation = "Reason Code";
        }
        field(51; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(52; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Fixed Asset")) "Fixed Asset";
        }
        field(53; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            DataClassification = SystemMetadata;
        }
        field(54; "Closed by Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Closed by Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(58; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
            DataClassification = SystemMetadata;
        }
        field(59; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
            DataClassification = SystemMetadata;
        }
        field(60; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(61; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(62; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = SystemMetadata;
        }
        field(63; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = SystemMetadata;
        }
        field(64; "Calculate Interest"; Boolean)
        {
            Caption = 'Calculate Interest';
            DataClassification = SystemMetadata;
        }
        field(65; "Closing Interest Calculated"; Boolean)
        {
            Caption = 'Closing Interest Calculated';
            DataClassification = SystemMetadata;
        }
        field(66; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(67; "Closed by Currency Code"; Code[10])
        {
            Caption = 'Closed by Currency Code';
            DataClassification = SystemMetadata;
            TableRelation = Currency;
        }
        field(68; "Closed by Currency Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Closed by Currency Amount';
            DataClassification = SystemMetadata;
        }
        field(70; "Rounding Currency"; Code[10])
        {
            Caption = 'Rounding Currency';
            DataClassification = SystemMetadata;
        }
        field(71; "Rounding Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Rounding Amount';
            DataClassification = SystemMetadata;
        }
        field(72; "Rounding Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Rounding Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(73; "Adjusted Currency Factor"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Adjusted Currency Factor';
            DataClassification = SystemMetadata;
        }
        field(74; "Original Currency Factor"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Currency Factor';
            DataClassification = SystemMetadata;
        }
        field(75; "Original Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Amount';
            DataClassification = SystemMetadata;
        }
        field(77; "Remaining Pmt. Disc. Possible"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Remaining Pmt. Disc. Possible';
            DataClassification = SystemMetadata;
        }
        field(78; "Pmt. Disc. Tolerance Date"; Date)
        {
            Caption = 'Pmt. Disc. Tolerance Date';
            DataClassification = SystemMetadata;
        }
        field(79; "Max. Payment Tolerance"; Decimal)
        {
            Caption = 'Max. Payment Tolerance';
            DataClassification = SystemMetadata;
        }
        field(81; "Accepted Payment Tolerance"; Decimal)
        {
            Caption = 'Accepted Payment Tolerance';
            DataClassification = SystemMetadata;
        }
        field(82; "Accepted Pmt. Disc. Tolerance"; Boolean)
        {
            Caption = 'Accepted Pmt. Disc. Tolerance';
            DataClassification = SystemMetadata;
        }
        field(83; "Pmt. Tolerance (LCY)"; Decimal)
        {
            Caption = 'Pmt. Tolerance (LCY)';
            DataClassification = SystemMetadata;
        }
        field(84; "Amount to Apply"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount to Apply';
            DataClassification = SystemMetadata;
        }
        field(90; Prepayment; Boolean)
        {
            Caption = 'Prepayment';
            DataClassification = SystemMetadata;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
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
    }

    fieldgroups
    {
    }
}

