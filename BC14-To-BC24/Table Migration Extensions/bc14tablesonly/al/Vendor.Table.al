table 23 Vendor
{
    Caption = 'Vendor';
    DataCaptionFields = "No.", Name;
    Permissions = TableData "Vendor Ledger Entry" = r,
                  TableData "Service Item" = rm,
                  TableData "Purchase Price" = rd,
                  TableData "Purchase Line Discount" = rd;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(14; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
        }
        field(15; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(19; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(21; "Vendor Posting Group"; Code[20])
        {
            Caption = 'Vendor Posting Group';
            TableRelation = "Vendor Posting Group";
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(24; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(26; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(27; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(28; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            TableRelation = "Finance Charge Terms";
        }
        field(29; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(30; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(31; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(33; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(38; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Vendor),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Payment,All';
            OptionMembers = " ",Payment,All;
        }
        field(45; "Pay-to Vendor No."; Code[20])
        {
            Caption = 'Pay-to Vendor No.';
            TableRelation = Vendor;
        }
        field(46; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(47; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(53; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(55; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(56; "Global Dimension 1 Filter"; Code[20])
        {
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(57; "Global Dimension 2 Filter"; Code[20])
        {
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(58; Balance; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Net Change"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Net Change (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Purchases (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Vendor Ledger Entry"."Purchase (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                             "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Posting Date" = FIELD ("Date Filter"),
                                                                             "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Purchases (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Inv. Discounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Vendor Ledger Entry"."Inv. Discount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                  "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Inv. Discounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Pmt. Discounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                  "Entry Type" = FILTER ("Payment Discount" .. "Payment Discount (VAT Adjustment)"),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Pmt. Discounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Balance Due"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Due Date" = FIELD (UPPERLIMIT ("Date Filter")),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Balance Due';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "Balance Due (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Due Date" = FIELD (UPPERLIMIT ("Date Filter")),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Balance Due (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(69; Payments; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Payment),
                                                                          "Entry Type" = CONST ("Initial Entry"),
                                                                          "Vendor No." = FIELD ("No."),
                                                                          "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter"),
                                                                          "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Payments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70; "Invoice Amounts"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Invoice),
                                                                           "Entry Type" = CONST ("Initial Entry"),
                                                                           "Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Invoice Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(71; "Cr. Memo Amounts"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST ("Credit Memo"),
                                                                          "Entry Type" = CONST ("Initial Entry"),
                                                                          "Vendor No." = FIELD ("No."),
                                                                          "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter"),
                                                                          "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Cr. Memo Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(72; "Finance Charge Memo Amounts"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST ("Finance Charge Memo"),
                                                                           "Entry Type" = CONST ("Initial Entry"),
                                                                           "Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Finance Charge Memo Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(74; "Payments (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Payment),
                                                                                  "Entry Type" = CONST ("Initial Entry"),
                                                                                  "Vendor No." = FIELD ("No."),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Payments (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75; "Inv. Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Invoice),
                                                                                   "Entry Type" = CONST ("Initial Entry"),
                                                                                   "Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Inv. Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(76; "Cr. Memo Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST ("Credit Memo"),
                                                                                  "Entry Type" = CONST ("Initial Entry"),
                                                                                  "Vendor No." = FIELD ("No."),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Cr. Memo Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77; "Fin. Charge Memo Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST ("Finance Charge Memo"),
                                                                                   "Entry Type" = CONST ("Initial Entry"),
                                                                                   "Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Fin. Charge Memo Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78; "Outstanding Orders"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Outstanding Amount" WHERE ("Document Type" = CONST (Order),
                                                                          "Pay-to Vendor No." = FIELD ("No."),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79; "Amt. Rcd. Not Invoiced"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Amt. Rcd. Not Invoiced" WHERE ("Document Type" = CONST (Order),
                                                                              "Pay-to Vendor No." = FIELD ("No."),
                                                                              "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Amt. Rcd. Not Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "Application Method"; Option)
        {
            Caption = 'Application Method';
            OptionCaption = 'Manual,Apply to Oldest';
            OptionMembers = Manual,"Apply to Oldest";
        }
        field(82; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(86; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(88; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(89; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(90; GLN; Code[13])
        {
            Caption = 'GLN';
            Numeric = true;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92; County; Text[30])
        {
            Caption = 'County';
        }
        field(97; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Debit Amount" WHERE ("Vendor No." = FIELD ("No."),
                                                                                  "Entry Type" = FILTER (<> Application),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Credit Amount" WHERE ("Vendor No." = FIELD ("No."),
                                                                                   "Entry Type" = FILTER (<> Application),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Debit Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                        "Entry Type" = FILTER (<> Application),
                                                                                        "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                        "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                        "Posting Date" = FIELD ("Date Filter"),
                                                                                        "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Credit Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                         "Entry Type" = FILTER (<> Application),
                                                                                         "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                         "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(104; "Reminder Amounts"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Reminder),
                                                                           "Entry Type" = CONST ("Initial Entry"),
                                                                           "Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Reminder Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(105; "Reminder Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Reminder),
                                                                                   "Entry Type" = CONST ("Initial Entry"),
                                                                                   "Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Reminder Amounts (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(109; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(110; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(111; "Currency Filter"; Code[10])
        {
            Caption = 'Currency Filter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(113; "Outstanding Orders (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                                "Pay-to Vendor No." = FIELD ("No."),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Orders (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(114; "Amt. Rcd. Not Invoiced (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Amt. Rcd. Not Invoiced (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                                    "Pay-to Vendor No." = FIELD ("No."),
                                                                                    "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                    "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                    "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Amt. Rcd. Not Invoiced (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(116; "Block Payment Tolerance"; Boolean)
        {
            Caption = 'Block Payment Tolerance';
        }
        field(117; "Pmt. Disc. Tolerance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                  "Entry Type" = FILTER ("Payment Discount Tolerance" | "Payment Discount Tolerance (VAT Adjustment)" | "Payment Discount Tolerance (VAT Excl.)"),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Pmt. Disc. Tolerance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(118; "Pmt. Tolerance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Vendor No." = FIELD ("No."),
                                                                                  "Entry Type" = FILTER ("Payment Tolerance" | "Payment Tolerance (VAT Adjustment)" | "Payment Tolerance (VAT Excl.)"),
                                                                                  "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                                  "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Pmt. Tolerance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(119; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(120; Refunds; Decimal)
        {
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Refund),
                                                                           "Entry Type" = CONST ("Initial Entry"),
                                                                           "Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Refunds';
            FieldClass = FlowField;
        }
        field(121; "Refunds (LCY)"; Decimal)
        {
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Refund),
                                                                                   "Entry Type" = CONST ("Initial Entry"),
                                                                                   "Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Refunds (LCY)';
            FieldClass = FlowField;
        }
        field(122; "Other Amounts"; Decimal)
        {
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (" "),
                                                                           "Entry Type" = CONST ("Initial Entry"),
                                                                           "Vendor No." = FIELD ("No."),
                                                                           "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter"),
                                                                           "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Other Amounts';
            FieldClass = FlowField;
        }
        field(123; "Other Amounts (LCY)"; Decimal)
        {
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (" "),
                                                                                   "Entry Type" = CONST ("Initial Entry"),
                                                                                   "Vendor No." = FIELD ("No."),
                                                                                   "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Posting Date" = FIELD ("Date Filter"),
                                                                                   "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Other Amounts (LCY)';
            FieldClass = FlowField;
        }
        field(124; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(125; "Outstanding Invoices"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Outstanding Amount" WHERE ("Document Type" = CONST (Invoice),
                                                                          "Pay-to Vendor No." = FIELD ("No."),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(126; "Outstanding Invoices (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Purchase Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Invoice),
                                                                                "Pay-to Vendor No." = FIELD ("No."),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Invoices (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(130; "Pay-to No. Of Archived Doc."; Integer)
        {
            CalcFormula = Count ("Purchase Header Archive" WHERE ("Document Type" = CONST (Order),
                                                                 "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. Of Archived Doc.';
            FieldClass = FlowField;
        }
        field(131; "Buy-from No. Of Archived Doc."; Integer)
        {
            CalcFormula = Count ("Purchase Header Archive" WHERE ("Document Type" = CONST (Order),
                                                                 "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'Buy-from No. Of Archived Doc.';
            FieldClass = FlowField;
        }
        field(132; "Partner Type"; Option)
        {
            Caption = 'Partner Type';
            OptionCaption = ' ,Company,Person';
            OptionMembers = " ",Company,Person;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';
        }
        field(160; "Disable Search by Name"; Boolean)
        {
            Caption = 'Disable Search by Name';
            DataClassification = SystemMetadata;
        }
        field(170; "Creditor No."; Code[20])
        {
            Caption = 'Creditor No.';
        }
        field(288; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            TableRelation = "Vendor Bank Account".Code WHERE ("Vendor No." = FIELD ("No."));
        }
        field(840; "Cash Flow Payment Terms Code"; Code[10])
        {
            Caption = 'Cash Flow Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(5049; "Primary Contact No."; Code[20])
        {
            Caption = 'Primary Contact No.';
            TableRelation = Contact;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5701; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(5790; "Lead Time Calculation"; DateFormula)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lead Time Calculation';
        }
        field(7177; "No. of Pstd. Receipts"; Integer)
        {
            CalcFormula = Count ("Purch. Rcpt. Header" WHERE ("Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7178; "No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count ("Purch. Inv. Header" WHERE ("Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7179; "No. of Pstd. Return Shipments"; Integer)
        {
            CalcFormula = Count ("Return Shipment Header" WHERE ("Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Return Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7180; "No. of Pstd. Credit Memos"; Integer)
        {
            CalcFormula = Count ("Purch. Cr. Memo Hdr." WHERE ("Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7181; "Pay-to No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Order),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7182; "Pay-to No. of Invoices"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Invoice),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7183; "Pay-to No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Return Order"),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7184; "Pay-to No. of Credit Memos"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Credit Memo"),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7185; "Pay-to No. of Pstd. Receipts"; Integer)
        {
            CalcFormula = Count ("Purch. Rcpt. Header" WHERE ("Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Pstd. Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7186; "Pay-to No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count ("Purch. Inv. Header" WHERE ("Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7187; "Pay-to No. of Pstd. Return S."; Integer)
        {
            CalcFormula = Count ("Return Shipment Header" WHERE ("Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Pstd. Return S.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7188; "Pay-to No. of Pstd. Cr. Memos"; Integer)
        {
            CalcFormula = Count ("Purch. Cr. Memo Hdr." WHERE ("Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Pstd. Cr. Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7189; "No. of Quotes"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Quote),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7190; "No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Blanket Order"),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7191; "No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Order),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Orders';
            FieldClass = FlowField;
        }
        field(7192; "No. of Invoices"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Invoice),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7193; "No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Return Order"),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7194; "No. of Credit Memos"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Credit Memo"),
                                                         "Buy-from Vendor No." = FIELD ("No.")));
            Caption = 'No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7195; "No. of Order Addresses"; Integer)
        {
            CalcFormula = Count ("Order Address" WHERE ("Vendor No." = FIELD ("No.")));
            Caption = 'No. of Order Addresses';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7196; "Pay-to No. of Quotes"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST (Quote),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7197; "Pay-to No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = CONST ("Blanket Order"),
                                                         "Pay-to Vendor No." = FIELD ("No.")));
            Caption = 'Pay-to No. of Blanket Orders';
            FieldClass = FlowField;
        }
        field(7198; "No. of Incoming Documents"; Integer)
        {
            CalcFormula = Count ("Incoming Document" WHERE ("Vendor No." = FIELD ("No.")));
            Caption = 'No. of Incoming Documents';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7601; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(7602; "Validate EU Vat Reg. No."; Boolean)
        {
            Caption = 'Validate EU Vat Reg. No.';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Currency Id"; Guid)
        {
            Caption = 'Currency Id';
            TableRelation = Currency.Id;
        }
        field(8002; "Payment Terms Id"; Guid)
        {
            Caption = 'Payment Terms Id';
            TableRelation = "Payment Terms".Id;
        }
        field(8003; "Payment Method Id"; Guid)
        {
            Caption = 'Payment Method Id';
            TableRelation = "Payment Method".Id;
        }
        field(10500; "Type of Supply Code"; Code[10])
        {
            Caption = 'Type of Supply Code';
            ObsoleteReason = 'Removed based on feedback.';
            ObsoleteState = Removed;
            TableRelation = "Type of Supply";
        }
        field(10501; "Exclude from Pmt. Pract. Rep."; Boolean)
        {
            Caption = 'Exclude from Payment Practices Report';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Vendor Posting Group")
        {
        }
        key(Key4; "Currency Code")
        {
        }
        key(Key5; Priority)
        {
        }
        key(Key6; "Country/Region Code")
        {
        }
        key(Key7; "Gen. Bus. Posting Group")
        {
        }
        key(Key8; "VAT Registration No.")
        {
        }
        key(Key9; Name)
        {
        }
        key(Key10; City)
        {
        }
        key(Key11; "Post Code")
        {
        }
        key(Key12; "Phone No.")
        {
        }
        key(Key13; Contact)
        {
        }
        key(Key14; Blocked)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, City, "Post Code", "Phone No.", Contact)
        {
        }
        fieldgroup(Brick; "No.", Name, "Balance (LCY)", Contact, "Balance Due (LCY)", Image)
        {
        }
    }
}

