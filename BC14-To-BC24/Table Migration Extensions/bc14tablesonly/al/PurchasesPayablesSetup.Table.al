table 312 "Purchases & Payables Setup"
{
    Caption = 'Purchases & Payables Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Discount Posting"; Option)
        {
            Caption = 'Discount Posting';
            OptionCaption = 'No Discounts,Invoice Discounts,Line Discounts,All Discounts';
            OptionMembers = "No Discounts","Invoice Discounts","Line Discounts","All Discounts";
        }
        field(6; "Receipt on Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Receipt on Invoice';
        }
        field(7; "Invoice Rounding"; Boolean)
        {
            Caption = 'Invoice Rounding';
        }
        field(8; "Ext. Doc. No. Mandatory"; Boolean)
        {
            Caption = 'Ext. Doc. No. Mandatory';
            InitValue = true;
        }
        field(9; "Vendor Nos."; Code[20])
        {
            Caption = 'Vendor Nos.';
            TableRelation = "No. Series";
        }
        field(10; "Quote Nos."; Code[20])
        {
            Caption = 'Quote Nos.';
            TableRelation = "No. Series";
        }
        field(11; "Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Order Nos.';
            TableRelation = "No. Series";
        }
        field(12; "Invoice Nos."; Code[20])
        {
            Caption = 'Invoice Nos.';
            TableRelation = "No. Series";
        }
        field(13; "Posted Invoice Nos."; Code[20])
        {
            Caption = 'Posted Invoice Nos.';
            TableRelation = "No. Series";
        }
        field(14; "Credit Memo Nos."; Code[20])
        {
            Caption = 'Credit Memo Nos.';
            TableRelation = "No. Series";
        }
        field(15; "Posted Credit Memo Nos."; Code[20])
        {
            Caption = 'Posted Credit Memo Nos.';
            TableRelation = "No. Series";
        }
        field(16; "Posted Receipt Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Posted Receipt Nos.';
            TableRelation = "No. Series";
        }
        field(19; "Blanket Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Blanket Order Nos.';
            TableRelation = "No. Series";
        }
        field(20; "Calc. Inv. Discount"; Boolean)
        {
            AccessByPermission = TableData "Vendor Invoice Disc." = R;
            Caption = 'Calc. Inv. Discount';
        }
        field(21; "Appln. between Currencies"; Option)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Appln. between Currencies';
            OptionCaption = 'None,EMU,All';
            OptionMembers = "None",EMU,All;
        }
        field(22; "Copy Comments Blanket to Order"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Blanket to Order';
            InitValue = true;
        }
        field(23; "Copy Comments Order to Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Order to Invoice';
            InitValue = true;
        }
        field(24; "Copy Comments Order to Receipt"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Copy Comments Order to Receipt';
            InitValue = true;
        }
        field(25; "Allow VAT Difference"; Boolean)
        {
            Caption = 'Allow VAT Difference';
        }
        field(26; "Calc. Inv. Disc. per VAT ID"; Boolean)
        {
            Caption = 'Calc. Inv. Disc. per VAT ID';
        }
        field(27; "Posted Prepmt. Inv. Nos."; Code[20])
        {
            Caption = 'Posted Prepmt. Inv. Nos.';
            TableRelation = "No. Series";
        }
        field(28; "Posted Prepmt. Cr. Memo Nos."; Code[20])
        {
            Caption = 'Posted Prepmt. Cr. Memo Nos.';
            TableRelation = "No. Series";
        }
        field(29; "Check Prepmt. when Posting"; Boolean)
        {
            Caption = 'Check Prepmt. when Posting';
        }
        field(33; "Prepmt. Auto Update Frequency"; Option)
        {
            Caption = 'Prepmt. Auto Update Frequency';
            DataClassification = SystemMetadata;
            OptionCaption = 'Never,Daily,Weekly';
            OptionMembers = Never,Daily,Weekly;
        }
        field(35; "Default Posting Date"; Option)
        {
            Caption = 'Default Posting Date';
            OptionCaption = 'Work Date,No Date';
            OptionMembers = "Work Date","No Date";
        }
        field(36; "Default Qty. to Receive"; Option)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Default Qty. to Receive';
            OptionCaption = 'Remainder,Blank';
            OptionMembers = Remainder,Blank;
        }
        field(37; "Archive Quotes and Orders"; Boolean)
        {
            Caption = 'Archive Quotes and Orders';
            ObsoleteReason = 'Replaced by new fields Archive Quotes and Archive Orders';
            ObsoleteState = Pending;
        }
        field(38; "Post with Job Queue"; Boolean)
        {
            Caption = 'Post with Job Queue';
        }
        field(39; "Job Queue Category Code"; Code[10])
        {
            Caption = 'Job Queue Category Code';
            TableRelation = "Job Queue Category";
        }
        field(40; "Job Queue Priority for Post"; Integer)
        {
            Caption = 'Job Queue Priority for Post';
            InitValue = 1000;
            MinValue = 0;
        }
        field(41; "Post & Print with Job Queue"; Boolean)
        {
            Caption = 'Post & Print with Job Queue';
        }
        field(42; "Job Q. Prio. for Post & Print"; Integer)
        {
            Caption = 'Job Q. Prio. for Post & Print';
            InitValue = 1000;
            MinValue = 0;
        }
        field(43; "Notify On Success"; Boolean)
        {
            Caption = 'Notify On Success';
        }
        field(46; "Allow Document Deletion Before"; Date)
        {
            Caption = 'Allow Document Deletion Before';
        }
        field(52; "Archive Quotes"; Option)
        {
            Caption = 'Archive Quotes';
            OptionCaption = 'Never,Question,Always';
            OptionMembers = Never,Question,Always;
        }
        field(53; "Archive Orders"; Boolean)
        {
            Caption = 'Archive Orders';
        }
        field(54; "Archive Blanket Orders"; Boolean)
        {
            Caption = 'Archive Blanket Orders';
        }
        field(55; "Archive Return Orders"; Boolean)
        {
            Caption = 'Archive Return Orders';
        }
        field(56; "Ignore Updated Addresses"; Boolean)
        {
            Caption = 'Ignore Updated Addresses';
        }
        field(57; "Create Item from Item No."; Boolean)
        {
            Caption = 'Create Item from Item No.';
        }
        field(58; "Copy Vendor Name to Entries"; Boolean)
        {
            Caption = 'Copy Vendor Name to Entries';
        }
        field(170; "Insert Std. Purch. Lines Mode"; Option)
        {
            Caption = 'Insert Std. Purch. Lines Mode';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(171; "Insert Std. Lines on Quotes"; Boolean)
        {
            Caption = 'Insert Std. Lines on Quotes';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(172; "Insert Std. Lines on Orders"; Boolean)
        {
            Caption = 'Insert Std. Lines on Orders';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(173; "Insert Std. Lines on Invoices"; Boolean)
        {
            Caption = 'Insert Std. Lines on Invoices';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(174; "Insert Std. Lines on Cr. Memos"; Boolean)
        {
            Caption = 'Insert Std. Lines on Cr. Memos';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Not needed after refactoring';
            ObsoleteState = Pending;
        }
        field(1217; "Debit Acc. for Non-Item Lines"; Code[20])
        {
            Caption = 'Debit Acc. for Non-Item Lines';
            TableRelation = "G/L Account" WHERE ("Direct Posting" = CONST (true),
                                                 "Account Type" = CONST (Posting),
                                                 Blocked = CONST (false));
        }
        field(1218; "Credit Acc. for Non-Item Lines"; Code[20])
        {
            Caption = 'Credit Acc. for Non-Item Lines';
            TableRelation = "G/L Account" WHERE ("Direct Posting" = CONST (true),
                                                 "Account Type" = CONST (Posting),
                                                 Blocked = CONST (false));
        }
        field(5800; "Posted Return Shpt. Nos."; Code[20])
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Posted Return Shpt. Nos.';
            TableRelation = "No. Series";
        }
        field(5801; "Copy Cmts Ret.Ord. to Ret.Shpt"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Copy Cmts Ret.Ord. to Ret.Shpt';
            InitValue = true;
        }
        field(5802; "Copy Cmts Ret.Ord. to Cr. Memo"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Copy Cmts Ret.Ord. to Cr. Memo';
            InitValue = true;
        }
        field(6600; "Return Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Order Nos.';
            TableRelation = "No. Series";
        }
        field(6601; "Return Shipment on Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Shipment on Credit Memo';
        }
        field(6602; "Exact Cost Reversing Mandatory"; Boolean)
        {
            Caption = 'Exact Cost Reversing Mandatory';
        }
        field(10500; "Posting Date Check on Posting"; Boolean)
        {
            Caption = 'Posting Date Check on Posting';
            InitValue = true;
        }
        field(10501; "Reverse Charge VAT Posting Gr."; Code[20])
        {
            Caption = 'Reverse Charge VAT Posting Gr.';
            TableRelation = "VAT Business Posting Group";
        }
        field(10502; "Domestic Vendors"; Code[20])
        {
            Caption = 'Domestic Vendors';
            TableRelation = "VAT Business Posting Group";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

