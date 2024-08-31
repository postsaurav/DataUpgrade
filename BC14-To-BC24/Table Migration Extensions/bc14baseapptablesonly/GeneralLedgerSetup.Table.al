table 98 "General Ledger Setup"
{
    Caption = 'General Ledger Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Allow Posting From"; Date)
        {
            Caption = 'Allow Posting From';
        }
        field(3; "Allow Posting To"; Date)
        {
            Caption = 'Allow Posting To';
        }
        field(4; "Register Time"; Boolean)
        {
            Caption = 'Register Time';
        }
        field(28; "Pmt. Disc. Excl. VAT"; Boolean)
        {
            Caption = 'Pmt. Disc. Excl. VAT';
        }
        field(41; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(42; "Global Dimension 1 Filter"; Code[20])
        {
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Global Dimension 1 Code"));
        }
        field(43; "Global Dimension 2 Filter"; Code[20])
        {
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Global Dimension 2 Code"));
        }
        field(44; "Cust. Balances Due"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Initial Entry Due Date" = FIELD ("Date Filter")));
            Caption = 'Cust. Balances Due';
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Vendor Balances Due"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Initial Entry Due Date" = FIELD ("Date Filter")));
            Caption = 'Vendor Balances Due';
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Unrealized VAT"; Boolean)
        {
            Caption = 'Unrealized VAT';
        }
        field(49; "Adjust for Payment Disc."; Boolean)
        {
            Caption = 'Adjust for Payment Disc.';
        }
        field(56; "Mark Cr. Memos as Corrections"; Boolean)
        {
            Caption = 'Mark Cr. Memos as Corrections';
        }
        field(57; "Local Address Format"; Option)
        {
            Caption = 'Local Address Format';
            OptionCaption = 'Post Code+City,City+Post Code,City+County+Post Code,Blank Line+Post Code+City';
            OptionMembers = "Post Code+City","City+Post Code","City+County+Post Code","Blank Line+Post Code+City";
        }
        field(58; "Inv. Rounding Precision (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Rounding Precision (LCY)';
        }
        field(59; "Inv. Rounding Type (LCY)"; Option)
        {
            Caption = 'Inv. Rounding Type (LCY)';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(60; "Local Cont. Addr. Format"; Option)
        {
            Caption = 'Local Cont. Addr. Format';
            InitValue = "After Company Name";
            OptionCaption = 'First,After Company Name,Last';
            OptionMembers = First,"After Company Name",Last;
        }
        field(63; "Bank Account Nos."; Code[20])
        {
            AccessByPermission = TableData "Bank Account" = R;
            Caption = 'Bank Account Nos.';
            TableRelation = "No. Series";
        }
        field(65; "Summarize G/L Entries"; Boolean)
        {
            Caption = 'Summarize G/L Entries';
        }
        field(66; "Amount Decimal Places"; Text[5])
        {
            Caption = 'Amount Decimal Places';
            InitValue = '2:2';
        }
        field(67; "Unit-Amount Decimal Places"; Text[5])
        {
            Caption = 'Unit-Amount Decimal Places';
            InitValue = '2:5';
        }
        field(68; "Additional Reporting Currency"; Code[10])
        {
            Caption = 'Additional Reporting Currency';
            TableRelation = Currency;
        }
        field(69; "VAT Tolerance %"; Decimal)
        {
            Caption = 'VAT Tolerance %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(70; "EMU Currency"; Boolean)
        {
            Caption = 'EMU Currency';
        }
        field(71; "LCY Code"; Code[10])
        {
            Caption = 'LCY Code';
        }
        field(72; "VAT Exchange Rate Adjustment"; Option)
        {
            Caption = 'VAT Exchange Rate Adjustment';
            OptionCaption = 'No Adjustment,Adjust Amount,Adjust Additional-Currency Amount';
            OptionMembers = "No Adjustment","Adjust Amount","Adjust Additional-Currency Amount";
        }
        field(73; "Amount Rounding Precision"; Decimal)
        {
            Caption = 'Amount Rounding Precision';
            DecimalPlaces = 0 : 5;
            InitValue = 0.01;
        }
        field(74; "Unit-Amount Rounding Precision"; Decimal)
        {
            Caption = 'Unit-Amount Rounding Precision';
            DecimalPlaces = 0 : 9;
            InitValue = 0.00001;
        }
        field(75; "Appln. Rounding Precision"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Appln. Rounding Precision';
            MinValue = 0;
        }
        field(79; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            Editable = false;
            TableRelation = Dimension;
        }
        field(80; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = Dimension;
        }
        field(81; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            Editable = false;
            TableRelation = Dimension;
        }
        field(82; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            Editable = false;
            TableRelation = Dimension;
        }
        field(83; "Shortcut Dimension 3 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = Dimension;
        }
        field(84; "Shortcut Dimension 4 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = Dimension;
        }
        field(85; "Shortcut Dimension 5 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = Dimension;
        }
        field(86; "Shortcut Dimension 6 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = Dimension;
        }
        field(87; "Shortcut Dimension 7 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = Dimension;
        }
        field(88; "Shortcut Dimension 8 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = Dimension;
        }
        field(89; "Max. VAT Difference Allowed"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Max. VAT Difference Allowed';
        }
        field(90; "VAT Rounding Type"; Option)
        {
            Caption = 'VAT Rounding Type';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(92; "Pmt. Disc. Tolerance Posting"; Option)
        {
            Caption = 'Pmt. Disc. Tolerance Posting';
            OptionCaption = 'Payment Tolerance Accounts,Payment Discount Accounts';
            OptionMembers = "Payment Tolerance Accounts","Payment Discount Accounts";
        }
        field(93; "Payment Discount Grace Period"; DateFormula)
        {
            Caption = 'Payment Discount Grace Period';
        }
        field(94; "Payment Tolerance %"; Decimal)
        {
            Caption = 'Payment Tolerance %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(95; "Max. Payment Tolerance Amount"; Decimal)
        {
            Caption = 'Max. Payment Tolerance Amount';
            Editable = false;
            MinValue = 0;
        }
        field(96; "Adapt Main Menu to Permissions"; Boolean)
        {
            Caption = 'Adapt Main Menu to Permissions';
            InitValue = true;
        }
        field(97; "Allow G/L Acc. Deletion Before"; Date)
        {
            Caption = 'Check G/L Acc. Deletion After';
        }
        field(98; "Check G/L Account Usage"; Boolean)
        {
            Caption = 'Check G/L Account Usage';
        }
        field(99; "Payment Tolerance Posting"; Option)
        {
            Caption = 'Payment Tolerance Posting';
            OptionCaption = 'Payment Tolerance Accounts,Payment Discount Accounts';
            OptionMembers = "Payment Tolerance Accounts","Payment Discount Accounts";
        }
        field(100; "Pmt. Disc. Tolerance Warning"; Boolean)
        {
            Caption = 'Pmt. Disc. Tolerance Warning';
        }
        field(101; "Payment Tolerance Warning"; Boolean)
        {
            Caption = 'Payment Tolerance Warning';
        }
        field(102; "Last IC Transaction No."; Integer)
        {
            Caption = 'Last IC Transaction No.';
        }
        field(103; "Bill-to/Sell-to VAT Calc."; Option)
        {
            Caption = 'Bill-to/Sell-to VAT Calc.';
            OptionCaption = 'Bill-to/Pay-to No.,Sell-to/Buy-from No.';
            OptionMembers = "Bill-to/Pay-to No.","Sell-to/Buy-from No.";
        }
        field(110; "Acc. Sched. for Balance Sheet"; Code[10])
        {
            Caption = 'Acc. Sched. for Balance Sheet';
            TableRelation = "Acc. Schedule Name";
        }
        field(111; "Acc. Sched. for Income Stmt."; Code[10])
        {
            Caption = 'Acc. Sched. for Income Stmt.';
            TableRelation = "Acc. Schedule Name";
        }
        field(112; "Acc. Sched. for Cash Flow Stmt"; Code[10])
        {
            Caption = 'Acc. Sched. for Cash Flow Stmt';
            TableRelation = "Acc. Schedule Name";
        }
        field(113; "Acc. Sched. for Retained Earn."; Code[10])
        {
            Caption = 'Acc. Sched. for Retained Earn.';
            TableRelation = "Acc. Schedule Name";
        }
        field(120; "Tax Invoice Renaming Threshold"; Decimal)
        {
            Caption = 'Tax Invoice Renaming Threshold';
            DataClassification = SystemMetadata;
        }
        field(150; "Print VAT specification in LCY"; Boolean)
        {
            Caption = 'Print VAT specification in LCY';
        }
        field(151; "Prepayment Unrealized VAT"; Boolean)
        {
            Caption = 'Prepayment Unrealized VAT';
        }
        field(152; "Use Legacy G/L Entry Locking"; Boolean)
        {
            Caption = 'Use Legacy G/L Entry Locking';
        }
        field(160; "Payroll Trans. Import Format"; Code[20])
        {
            Caption = 'Payroll Trans. Import Format';
            TableRelation = "Data Exch. Def" WHERE (Type = CONST ("Payroll Import"));
        }
        field(161; "VAT Reg. No. Validation URL"; Text[250])
        {
            Caption = 'VAT Reg. No. Validation URL';
            ObsoleteReason = 'This field is obsolete, it has been replaced by Table 248 VAT Reg. No. Srv Config.';
            ObsoleteState = Pending;
        }
        field(162; "Local Currency Symbol"; Text[10])
        {
            Caption = 'Local Currency Symbol';
        }
        field(163; "Local Currency Description"; Text[60])
        {
            Caption = 'Local Currency Description';
        }
        field(164; "Show Amounts"; Option)
        {
            Caption = 'Show Amounts';
            OptionCaption = 'Amount Only,Debit/Credit Only,All Amounts';
            OptionMembers = "Amount Only","Debit/Credit Only","All Amounts";
        }
        field(170; "SEPA Non-Euro Export"; Boolean)
        {
            Caption = 'SEPA Non-Euro Export';
        }
        field(171; "SEPA Export w/o Bank Acc. Data"; Boolean)
        {
            Caption = 'SEPA DD Export Without IBAN And SWIFT';
        }
        field(10500; "Threshold applies"; Boolean)
        {
            Caption = 'Threshold applies';
        }
        field(10501; "Threshold Amount"; Decimal)
        {
            Caption = 'Threshold Amount';
            MinValue = 0;
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

