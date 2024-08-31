table 5965 "Service Contract Header"
{
    Caption = 'Service Contract Header';
    DataCaptionFields = "Contract No.", Description;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(2; "Contract Type"; Option)
        {
            Caption = 'Contract Type';
            OptionCaption = 'Quote,Contract';
            OptionMembers = Quote,Contract;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            Editable = true;
            OptionCaption = ' ,Signed,Canceled';
            OptionMembers = " ",Signed,Canceled;
        }
        field(6; "Change Status"; Option)
        {
            Caption = 'Change Status';
            Editable = false;
            OptionCaption = 'Open,Locked';
            OptionMembers = Open,Locked;
        }
        field(7; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(8; Name; Text[100])
        {
            CalcFormula = Lookup (Customer.Name WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Address; Text[100])
        {
            CalcFormula = Lookup (Customer.Address WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Address';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Address 2"; Text[50])
        {
            CalcFormula = Lookup (Customer."Address 2" WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Address 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Post Code"; Code[20])
        {
            CalcFormula = Lookup (Customer."Post Code" WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Post Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; City; Text[30])
        {
            CalcFormula = Lookup (Customer.City WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'City';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
        }
        field(14; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
        }
        field(15; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(16; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(17; "Bill-to Name"; Text[100])
        {
            CalcFormula = Lookup (Customer.Name WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Bill-to Address"; Text[100])
        {
            CalcFormula = Lookup (Customer.Address WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Address';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Bill-to Address 2"; Text[50])
        {
            CalcFormula = Lookup (Customer."Address 2" WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Address 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Bill-to Post Code"; Code[20])
        {
            CalcFormula = Lookup (Customer."Post Code" WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Post Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Bill-to City"; Text[30])
        {
            CalcFormula = Lookup (Customer.City WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to City';
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Customer No."));
        }
        field(23; "Ship-to Name"; Text[100])
        {
            CalcFormula = Lookup ("Ship-to Address".Name WHERE ("Customer No." = FIELD ("Customer No."),
                                                               Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Ship-to Address"; Text[100])
        {
            CalcFormula = Lookup ("Ship-to Address".Address WHERE ("Customer No." = FIELD ("Customer No."),
                                                                  Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Address';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Ship-to Address 2"; Text[50])
        {
            CalcFormula = Lookup ("Ship-to Address"."Address 2" WHERE ("Customer No." = FIELD ("Customer No."),
                                                                      Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Address 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Ship-to Post Code"; Code[20])
        {
            CalcFormula = Lookup ("Ship-to Address"."Post Code" WHERE ("Customer No." = FIELD ("Customer No."),
                                                                      Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Post Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Ship-to City"; Text[30])
        {
            CalcFormula = Lookup ("Ship-to Address".City WHERE ("Customer No." = FIELD ("Customer No."),
                                                               Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to City';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Serv. Contract Acc. Gr. Code"; Code[10])
        {
            Caption = 'Serv. Contract Acc. Gr. Code';
            TableRelation = "Service Contract Account Group";
        }
        field(32; "Invoice Period"; Option)
        {
            Caption = 'Invoice Period';
            OptionCaption = 'Month,Two Months,Quarter,Half Year,Year,None';
            OptionMembers = Month,"Two Months",Quarter,"Half Year",Year,"None";
        }
        field(33; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date';
            Editable = false;
        }
        field(34; "Next Invoice Date"; Date)
        {
            Caption = 'Next Invoice Date';
            Editable = false;
        }
        field(35; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(36; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(38; "First Service Date"; Date)
        {
            Caption = 'First Service Date';
        }
        field(39; "Max. Labor Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Max. Labor Unit Price';
        }
        field(40; "Calcd. Annual Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Contract Line"."Line Amount" WHERE ("Contract Type" = FIELD ("Contract Type"),
                                                                           "Contract No." = FIELD ("Contract No.")));
            Caption = 'Calcd. Annual Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Annual Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Annual Amount';
            MinValue = 0;
        }
        field(43; "Amount per Period"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Amount per Period';
            Editable = false;
        }
        field(44; "Combine Invoices"; Boolean)
        {
            Caption = 'Combine Invoices';
        }
        field(45; Prepaid; Boolean)
        {
            Caption = 'Prepaid';
        }
        field(46; "Next Invoice Period"; Text[30])
        {
            Caption = 'Next Invoice Period';
            Editable = false;
        }
        field(47; "Service Zone Code"; Code[10])
        {
            Caption = 'Service Zone Code';
            TableRelation = "Service Zone";
        }
        field(48; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(50; "Cancel Reason Code"; Code[10])
        {
            Caption = 'Cancel Reason Code';
            TableRelation = "Reason Code";
        }
        field(51; "Last Price Update Date"; Date)
        {
            Caption = 'Last Price Update Date';
            Editable = false;
        }
        field(52; "Next Price Update Date"; Date)
        {
            Caption = 'Next Price Update Date';
        }
        field(53; "Last Price Update %"; Decimal)
        {
            Caption = 'Last Price Update %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(55; "Response Time (Hours)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Response Time (Hours)';
            DecimalPlaces = 0 : 5;
        }
        field(56; "Contract Lines on Invoice"; Boolean)
        {
            Caption = 'Contract Lines on Invoice';
        }
        field(57; "No. of Posted Invoices"; Integer)
        {
            CalcFormula = Count ("Service Document Register" WHERE ("Source Document Type" = CONST (Contract),
                                                                   "Source Document No." = FIELD ("Contract No."),
                                                                   "Destination Document Type" = CONST ("Posted Invoice")));
            Caption = 'No. of Posted Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(58; "No. of Unposted Invoices"; Integer)
        {
            CalcFormula = Count ("Service Document Register" WHERE ("Source Document Type" = CONST (Contract),
                                                                   "Source Document No." = FIELD ("Contract No."),
                                                                   "Destination Document Type" = CONST (Invoice)));
            Caption = 'No. of Unposted Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Service Period"; DateFormula)
        {
            Caption = 'Service Period';
        }
        field(60; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(62; "Invoice after Service"; Boolean)
        {
            Caption = 'Invoice after Service';
        }
        field(63; "Quote Type"; Option)
        {
            Caption = 'Quote Type';
            OptionCaption = 'Quote 1,Quote 2,Quote 3,Quote 4,Quote 5,Quote 6,Quote 7,Quote 8';
            OptionMembers = "Quote 1","Quote 2","Quote 3","Quote 4","Quote 5","Quote 6","Quote 7","Quote 8";
        }
        field(64; "Allow Unbalanced Amounts"; Boolean)
        {
            Caption = 'Allow Unbalanced Amounts';
        }
        field(65; "Contract Group Code"; Code[10])
        {
            Caption = 'Contract Group Code';
            TableRelation = "Contract Group";
        }
        field(66; "Service Order Type"; Code[10])
        {
            Caption = 'Service Order Type';
            TableRelation = "Service Order Type";
        }
        field(67; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(68; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(69; "Accept Before"; Date)
        {
            Caption = 'Accept Before';
        }
        field(71; "Automatic Credit Memos"; Boolean)
        {
            Caption = 'Automatic Credit Memos';
        }
        field(74; "Template No."; Code[20])
        {
            Caption = 'Template No.';
        }
        field(75; "Price Update Period"; DateFormula)
        {
            Caption = 'Price Update Period';
            InitValue = '1Y';
        }
        field(79; "Price Inv. Increase Code"; Code[20])
        {
            Caption = 'Price Inv. Increase Code';
            TableRelation = "Standard Text";
        }
        field(80; "Print Increase Text"; Boolean)
        {
            Caption = 'Print Increase Text';
        }
        field(81; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(82; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(83; Probability; Decimal)
        {
            Caption = 'Probability';
            DecimalPlaces = 0 : 5;
            InitValue = 100;
        }
        field(84; Comment; Boolean)
        {
            CalcFormula = Exist ("Service Comment Line" WHERE ("Table Name" = CONST ("Service Contract"),
                                                              "Table Subtype" = FIELD ("Contract Type"),
                                                              "No." = FIELD ("Contract No."),
                                                              "Table Line No." = FILTER (0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(86; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(87; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(88; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(89; "Bill-to County"; Text[30])
        {
            CalcFormula = Lookup (Customer.County WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to County';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90; County; Text[30])
        {
            CalcFormula = Lookup (Customer.County WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'County';
            Editable = false;
            FieldClass = FlowField;
        }
        field(91; "Ship-to County"; Text[30])
        {
            CalcFormula = Lookup ("Ship-to Address".County WHERE ("Customer No." = FIELD ("Customer No."),
                                                                 Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to County';
            Editable = false;
            FieldClass = FlowField;
        }
        field(92; "Country/Region Code"; Code[10])
        {
            CalcFormula = Lookup (Customer."Country/Region Code" WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Country/Region Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(93; "Bill-to Country/Region Code"; Code[10])
        {
            CalcFormula = Lookup (Customer."Country/Region Code" WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Country/Region Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Ship-to Country/Region Code"; Code[10])
        {
            CalcFormula = Lookup ("Ship-to Address"."Country/Region Code" WHERE ("Customer No." = FIELD ("Customer No."),
                                                                                Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Country/Region Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(95; "Name 2"; Text[50])
        {
            CalcFormula = Lookup (Customer."Name 2" WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Name 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(96; "Bill-to Name 2"; Text[50])
        {
            CalcFormula = Lookup (Customer."Name 2" WHERE ("No." = FIELD ("Bill-to Customer No.")));
            Caption = 'Bill-to Name 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(97; "Ship-to Name 2"; Text[50])
        {
            CalcFormula = Lookup ("Ship-to Address"."Name 2" WHERE ("Customer No." = FIELD ("Customer No."),
                                                                   Code = FIELD ("Ship-to Code")));
            Caption = 'Ship-to Name 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Next Invoice Period Start"; Date)
        {
            Caption = 'Next Invoice Period Start';
            Editable = false;
        }
        field(99; "Next Invoice Period End"; Date)
        {
            Caption = 'Next Invoice Period End';
            Editable = false;
        }
        field(100; "Contract Invoice Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Service Ledger Entry"."Amount (LCY)" WHERE ("Service Contract No." = FIELD ("Contract No."),
                                                                            "Entry Type" = CONST (Sale),
                                                                            "Moved from Prepaid Acc." = CONST (true),
                                                                            Type = FIELD ("Type Filter"),
                                                                            "Posting Date" = FIELD ("Date Filter"),
                                                                            Open = CONST (false)));
            Caption = 'Contract Invoice Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(101; "Contract Prepaid Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Service Ledger Entry"."Amount (LCY)" WHERE ("Service Contract No." = FIELD ("Contract No."),
                                                                            "Entry Type" = CONST (Sale),
                                                                            "Moved from Prepaid Acc." = CONST (false),
                                                                            Type = CONST ("Service Contract"),
                                                                            "Posting Date" = FIELD ("Date Filter"),
                                                                            Open = CONST (false),
                                                                            Prepaid = CONST (true)));
            Caption = 'Contract Prepaid Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(102; "Contract Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Ledger Entry"."Contract Disc. Amount" WHERE ("Service Contract No." = FIELD ("Contract No."),
                                                                                    "Entry Type" = CONST (Sale),
                                                                                    "Moved from Prepaid Acc." = CONST (true),
                                                                                    Type = FIELD ("Type Filter"),
                                                                                    "Posting Date" = FIELD ("Date Filter"),
                                                                                    Open = CONST (false)));
            Caption = 'Contract Discount Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(103; "Contract Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Service Ledger Entry"."Cost Amount" WHERE ("Service Contract No." = FIELD ("Contract No."),
                                                                          "Entry Type" = CONST (Usage),
                                                                          "Moved from Prepaid Acc." = CONST (true),
                                                                          Type = FIELD ("Type Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter"),
                                                                          Open = CONST (false)));
            Caption = 'Contract Cost Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(104; "Contract Gain/Loss Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Contract Gain/Loss Entry".Amount WHERE ("Contract No." = FIELD ("Contract No."),
                                                                       "Reason Code" = FIELD ("Reason Code Filter"),
                                                                       "Change Date" = FIELD ("Date Filter")));
            Caption = 'Contract Gain/Loss Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(106; "No. of Posted Credit Memos"; Integer)
        {
            CalcFormula = Count ("Service Document Register" WHERE ("Source Document Type" = CONST (Contract),
                                                                   "Source Document No." = FIELD ("Contract No."),
                                                                   "Destination Document Type" = CONST ("Posted Credit Memo")));
            Caption = 'No. of Posted Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(107; "No. of Unposted Credit Memos"; Integer)
        {
            CalcFormula = Count ("Service Document Register" WHERE ("Source Document Type" = CONST (Contract),
                                                                   "Source Document No." = FIELD ("Contract No."),
                                                                   "Destination Document Type" = CONST ("Credit Memo")));
            Caption = 'No. of Unposted Credit Memos';
            Editable = false;
            FieldClass = FlowField;
        }
        field(140; "Type Filter"; Option)
        {
            Caption = 'Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Resource,Item,Service Cost,Service Contract,G/L Account';
            OptionMembers = " ",Resource,Item,"Service Cost","Service Contract","G/L Account";
        }
        field(141; "Reason Code Filter"; Code[10])
        {
            Caption = 'Reason Code Filter';
            FieldClass = FlowFilter;
            TableRelation = "Reason Code";
        }
        field(142; "Posted Service Order Filter"; Code[20])
        {
            Caption = 'Posted Service Order Filter';
            FieldClass = FlowFilter;
            TableRelation = "Service Shipment Header";
        }
        field(143; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(144; "Item Filter"; Code[20])
        {
            Caption = 'Item Filter';
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(5050; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(5051; "Bill-to Contact No."; Code[20])
        {
            Caption = 'Bill-to Contact No.';
            TableRelation = Contact;
        }
        field(5052; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
        }
        field(5053; "Last Invoice Period End"; Date)
        {
            Caption = 'Last Invoice Period End';
        }
    }

    keys
    {
        key(Key1; "Contract Type", "Contract No.")
        {
            Clustered = true;
        }
        key(Key2; "Contract No.", "Contract Type")
        {
        }
        key(Key3; "Customer No.", "Ship-to Code")
        {
        }
        key(Key4; "Bill-to Customer No.", "Contract Type", "Combine Invoices", "Next Invoice Date")
        {
        }
        key(Key5; "Next Price Update Date")
        {
        }
        key(Key6; "Responsibility Center", "Service Zone Code", Status, "Contract Group Code")
        {
        }
        key(Key7; "Salesperson Code", Status)
        {
        }
        key(Key8; "Template No.")
        {
        }
        key(Key9; "Customer No.", "Bill-to Customer No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key10; "Customer No.", "Currency Code", "Ship-to Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Expiration Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Contract No.", Description, "Customer No.", Status, "Change Status", "Starting Date")
        {
        }
    }
}

