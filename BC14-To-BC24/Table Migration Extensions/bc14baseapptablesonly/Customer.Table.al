table 18 Customer
{
    Caption = 'Customer';
    DataCaptionFields = "No.", Name;
    Permissions = TableData "Cust. Ledger Entry" = r,
                  TableData Job = r,
                  TableData "VAT Registration Log" = rd,
                  TableData "Service Header" = r,
                  TableData "Service Ledger Entry" = r,
                  TableData "Service Item" = rm,
                  TableData "Service Contract Header" = rm,
                  TableData "Sales Price" = rd,
                  TableData "Sales Line Discount" = rd;

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
        field(11; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("No."));
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
        field(18; "Chain Name"; Code[10])
        {
            Caption = 'Chain Name';
        }
        field(19; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(20; "Credit Limit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Limit (LCY)';
        }
        field(21; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(23; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
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
        field(29; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(30; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(31; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(32; "Place of Export"; Code[20])
        {
            Caption = 'Place of Export';
        }
        field(33; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(34; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(36; "Collection Method"; Code[20])
        {
            Caption = 'Collection Method';
        }
        field(37; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(38; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Customer),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Ship,Invoice,All';
            OptionMembers = " ",Ship,Invoice,All;
        }
        field(40; "Invoice Copies"; Integer)
        {
            Caption = 'Invoice Copies';
        }
        field(41; "Last Statement No."; Integer)
        {
            Caption = 'Last Statement No.';
        }
        field(42; "Print Statements"; Boolean)
        {
            Caption = 'Print Statements';
        }
        field(45; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Posting Date" = FIELD ("Date Filter"),
                                                                                 "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Sales (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Cust. Ledger Entry"."Sales (LCY)" WHERE ("Customer No." = FIELD ("No."),
                                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                        "Posting Date" = FIELD ("Date Filter"),
                                                                        "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Sales (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63; "Profit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Cust. Ledger Entry"."Profit (LCY)" WHERE ("Customer No." = FIELD ("No."),
                                                                         "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                         "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Profit (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Inv. Discounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Cust. Ledger Entry"."Inv. Discount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Payment),
                                                                          "Entry Type" = CONST ("Initial Entry"),
                                                                          "Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Invoice),
                                                                         "Entry Type" = CONST ("Initial Entry"),
                                                                         "Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST ("Credit Memo"),
                                                                          "Entry Type" = CONST ("Initial Entry"),
                                                                          "Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST ("Finance Charge Memo"),
                                                                         "Entry Type" = CONST ("Initial Entry"),
                                                                         "Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Payment),
                                                                                  "Entry Type" = CONST ("Initial Entry"),
                                                                                  "Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Invoice),
                                                                                 "Entry Type" = CONST ("Initial Entry"),
                                                                                 "Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST ("Credit Memo"),
                                                                                  "Entry Type" = CONST ("Initial Entry"),
                                                                                  "Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST ("Finance Charge Memo"),
                                                                                 "Entry Type" = CONST ("Initial Entry"),
                                                                                 "Customer No." = FIELD ("No."),
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
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Outstanding Amount" WHERE ("Document Type" = CONST (Order),
                                                                       "Bill-to Customer No." = FIELD ("No."),
                                                                       "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                       "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                       "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79; "Shipped Not Invoiced"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Shipped Not Invoiced" WHERE ("Document Type" = CONST (Order),
                                                                         "Bill-to Customer No." = FIELD ("No."),
                                                                         "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                         "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Shipped Not Invoiced';
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
        field(83; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
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
        field(87; "Combine Shipments"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Combine Shipments';
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
        field(95; "Use GLN in Electronic Document"; Boolean)
        {
            Caption = 'Use GLN in Electronic Documents';
        }
        field(97; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Debit Amount" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Credit Amount" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Debit Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Credit Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
        field(104; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
            TableRelation = "Reminder Terms";
        }
        field(105; "Reminder Amounts"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Reminder),
                                                                         "Entry Type" = CONST ("Initial Entry"),
                                                                         "Customer No." = FIELD ("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Reminder Amounts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(106; "Reminder Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Reminder),
                                                                                 "Entry Type" = CONST ("Initial Entry"),
                                                                                 "Customer No." = FIELD ("No."),
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
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                             "Bill-to Customer No." = FIELD ("No."),
                                                                             "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Orders (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(114; "Shipped Not Invoiced (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Shipped Not Invoiced (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                               "Bill-to Customer No." = FIELD ("No."),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Shipped Not Invoiced (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(115; Reserve; Option)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Reserve';
            InitValue = Optional;
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(116; "Block Payment Tolerance"; Boolean)
        {
            Caption = 'Block Payment Tolerance';
        }
        field(117; "Pmt. Disc. Tolerance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = - Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
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
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (Refund),
                                                                         "Entry Type" = CONST ("Initial Entry"),
                                                                         "Customer No." = FIELD ("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Refunds';
            FieldClass = FlowField;
        }
        field(121; "Refunds (LCY)"; Decimal)
        {
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (Refund),
                                                                                 "Entry Type" = CONST ("Initial Entry"),
                                                                                 "Customer No." = FIELD ("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Posting Date" = FIELD ("Date Filter"),
                                                                                 "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Refunds (LCY)';
            FieldClass = FlowField;
        }
        field(122; "Other Amounts"; Decimal)
        {
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type" = CONST (" "),
                                                                         "Entry Type" = CONST ("Initial Entry"),
                                                                         "Customer No." = FIELD ("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                         "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Other Amounts';
            FieldClass = FlowField;
        }
        field(123; "Other Amounts (LCY)"; Decimal)
        {
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type" = CONST (" "),
                                                                                 "Entry Type" = CONST ("Initial Entry"),
                                                                                 "Customer No." = FIELD ("No."),
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
        field(125; "Outstanding Invoices (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Invoice),
                                                                             "Bill-to Customer No." = FIELD ("No."),
                                                                             "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Invoices (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(126; "Outstanding Invoices"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            CalcFormula = Sum ("Sales Line"."Outstanding Amount" WHERE ("Document Type" = CONST (Invoice),
                                                                       "Bill-to Customer No." = FIELD ("No."),
                                                                       "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                       "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                       "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(130; "Bill-to No. Of Archived Doc."; Integer)
        {
            CalcFormula = Count ("Sales Header Archive" WHERE ("Document Type" = CONST (Order),
                                                              "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-to No. Of Archived Doc.';
            FieldClass = FlowField;
        }
        field(131; "Sell-to No. Of Archived Doc."; Integer)
        {
            CalcFormula = Count ("Sales Header Archive" WHERE ("Document Type" = CONST (Order),
                                                              "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'Sell-to No. Of Archived Doc.';
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
        field(288; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            TableRelation = "Customer Bank Account".Code WHERE ("Customer No." = FIELD ("No."));
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
        field(5050; "Contact Type"; Option)
        {
            Caption = 'Contact Type';
            OptionCaption = 'Company,Person';
            OptionMembers = Company,Person;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5750; "Shipping Advice"; Option)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Shipping Advice';
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;
        }
        field(5790; "Shipping Time"; DateFormula)
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Time';
        }
        field(5792; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
        field(5900; "Service Zone Code"; Code[10])
        {
            Caption = 'Service Zone Code';
            TableRelation = "Service Zone";
        }
        field(5902; "Contract Gain/Loss Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Contract Gain/Loss Entry".Amount WHERE ("Customer No." = FIELD ("No."),
                                                                       "Ship-to Code" = FIELD ("Ship-to Filter"),
                                                                       "Change Date" = FIELD ("Date Filter")));
            Caption = 'Contract Gain/Loss Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5903; "Ship-to Filter"; Code[10])
        {
            Caption = 'Ship-to Filter';
            FieldClass = FlowFilter;
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("No."));
        }
        field(5910; "Outstanding Serv. Orders (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                               "Bill-to Customer No." = FIELD ("No."),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Serv. Orders (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5911; "Serv Shipped Not Invoiced(LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Line"."Shipped Not Invoiced (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                                 "Bill-to Customer No." = FIELD ("No."),
                                                                                 "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Serv Shipped Not Invoiced(LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5912; "Outstanding Serv.Invoices(LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Line"."Outstanding Amount (LCY)" WHERE ("Document Type" = CONST (Invoice),
                                                                               "Bill-to Customer No." = FIELD ("No."),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Currency Code" = FIELD ("Currency Filter")));
            Caption = 'Outstanding Serv.Invoices(LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
            InitValue = true;
        }
        field(7171; "No. of Quotes"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Quote),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7172; "No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Blanket Order"),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7173; "No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Order),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7174; "No. of Invoices"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Invoice),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7175; "No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Return Order"),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7176; "No. of Credit Memos"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Credit Memo"),
                                                      "Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7177; "No. of Pstd. Shipments"; Integer)
        {
            CalcFormula = Count ("Sales Shipment Header" WHERE ("Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7178; "No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count ("Sales Invoice Header" WHERE ("Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7179; "No. of Pstd. Return Receipts"; Integer)
        {
            CalcFormula = Count ("Return Receipt Header" WHERE ("Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Return Receipts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7180; "No. of Pstd. Credit Memos"; Integer)
        {
            CalcFormula = Count ("Sales Cr.Memo Header" WHERE ("Sell-to Customer No." = FIELD ("No.")));
            Caption = 'No. of Pstd. Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7181; "No. of Ship-to Addresses"; Integer)
        {
            CalcFormula = Count ("Ship-to Address" WHERE ("Customer No." = FIELD ("No.")));
            Caption = 'No. of Ship-to Addresses';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7182; "Bill-To No. of Quotes"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Quote),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Quotes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7183; "Bill-To No. of Blanket Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Blanket Order"),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Blanket Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7184; "Bill-To No. of Orders"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Order),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7185; "Bill-To No. of Invoices"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST (Invoice),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7186; "Bill-To No. of Return Orders"; Integer)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Return Order"),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Return Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7187; "Bill-To No. of Credit Memos"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = CONST ("Credit Memo"),
                                                      "Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7188; "Bill-To No. of Pstd. Shipments"; Integer)
        {
            CalcFormula = Count ("Sales Shipment Header" WHERE ("Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Pstd. Shipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7189; "Bill-To No. of Pstd. Invoices"; Integer)
        {
            CalcFormula = Count ("Sales Invoice Header" WHERE ("Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Pstd. Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7190; "Bill-To No. of Pstd. Return R."; Integer)
        {
            CalcFormula = Count ("Return Receipt Header" WHERE ("Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Pstd. Return R.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7191; "Bill-To No. of Pstd. Cr. Memos"; Integer)
        {
            CalcFormula = Count ("Sales Cr.Memo Header" WHERE ("Bill-to Customer No." = FIELD ("No.")));
            Caption = 'Bill-To No. of Pstd. Cr. Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7601; "Copy Sell-to Addr. to Qte From"; Option)
        {
            AccessByPermission = TableData Contact = R;
            Caption = 'Copy Sell-to Addr. to Qte From';
            OptionCaption = 'Company,Person';
            OptionMembers = Company,Person;
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
        field(8003; "Shipment Method Id"; Guid)
        {
            Caption = 'Shipment Method Id';
            TableRelation = "Shipment Method".Id;
        }
        field(8004; "Payment Method Id"; Guid)
        {
            Caption = 'Payment Method Id';
            TableRelation = "Payment Method".Id;
        }
        field(9003; "Tax Area ID"; Guid)
        {
            Caption = 'Tax Area ID';
        }
        field(9004; "Tax Area Display Name"; Text[100])
        {
            CalcFormula = Lookup ("Tax Area".Description WHERE (Code = FIELD ("Tax Area Code")));
            Caption = 'Tax Area Display Name';
            FieldClass = FlowField;
            ObsoleteReason = 'This field is not needed and it should not be used.';
            ObsoleteState = Removed;
        }
        field(9005; "Contact ID"; Guid)
        {
            Caption = 'Contact ID';
        }
        field(9006; "Contact Graph Id"; Text[250])
        {
            Caption = 'Contact Graph Id';
        }
        field(10500; "Type of Supply Code"; Code[10])
        {
            Caption = 'Type of Supply Code';
            ObsoleteReason = 'Removed based on feedback.';
            ObsoleteState = Removed;
            TableRelation = "Type of Supply";
        }
        field(50000; Shop; Code[20])
        {
            DataClassification = ToBeClassified;
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
        key(Key3; "Customer Posting Group")
        {
        }
        key(Key4; "Currency Code")
        {
        }
        key(Key5; "Country/Region Code")
        {
        }
        key(Key6; "Gen. Bus. Posting Group")
        {
        }
        key(Key7; Name, Address, City)
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
        key(Key15; "Primary Contact No.")
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

