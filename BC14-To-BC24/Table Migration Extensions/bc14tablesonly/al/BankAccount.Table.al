table 270 "Bank Account"
{
    Caption = 'Bank Account';
    DataCaptionFields = "No.", Name;
    Permissions = TableData "Bank Account Ledger Entry" = r;

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
        field(13; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
        }
        field(14; "Transit No."; Text[20])
        {
            Caption = 'Transit No.';
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
        field(20; "Min. Balance"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Min. Balance';
        }
        field(21; "Bank Acc. Posting Group"; Code[20])
        {
            Caption = 'Bank Acc. Posting Group';
            TableRelation = "Bank Account Posting Group";
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
        field(29; "Our Contact Code"; Code[20])
        {
            Caption = 'Our Contact Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(37; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(38; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST ("Bank Account"),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(41; "Last Statement No."; Code[20])
        {
            Caption = 'Last Statement No.';
        }
        field(42; "Last Payment Statement No."; Code[20])
        {
            Caption = 'Last Payment Statement No.';
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
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("No."),
                                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Amount (LCY)" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Net Change"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("No."),
                                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                        "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Net Change (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Amount (LCY)" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Total on Checks"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Check Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("No."),
                                                                 "Entry Status" = FILTER (Posted),
                                                                 "Statement Status" = FILTER (<> Closed)));
            Caption = 'Total on Checks';
            Editable = false;
            FieldClass = FlowField;
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(89; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
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
        field(93; "Last Check No."; Code[20])
        {
            AccessByPermission = TableData "Check Ledger Entry" = R;
            Caption = 'Last Check No.';
        }
        field(94; "Balance Last Statement"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance Last Statement';
        }
        field(95; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("No."),
                                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                        "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(96; "Balance at Date (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Amount (LCY)" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(97; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Debit Amount" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Credit Amount" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                 "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Debit Amount (LCY)" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                      "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                      "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                      "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Bank Account Ledger Entry"."Credit Amount (LCY)" WHERE ("Bank Account No." = FIELD ("No."),
                                                                                       "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                       "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                       "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(101; "Bank Branch No."; Text[20])
        {
            Caption = 'Bank Branch No.';
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
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Check Report ID"; Integer)
        {
            Caption = 'Check Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(109; "Check Report Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Report),
                                                                        "Object ID" = FIELD ("Check Report ID")));
            Caption = 'Check Report Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(110; IBAN; Code[50])
        {
            Caption = 'IBAN';
        }
        field(111; "SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
            TableRelation = "SWIFT Code";
            ValidateTableRelation = false;
        }
        field(113; "Bank Statement Import Format"; Code[20])
        {
            Caption = 'Bank Statement Import Format';
            TableRelation = "Bank Export/Import Setup".Code WHERE (Direction = CONST (Import));
        }
        field(115; "Credit Transfer Msg. Nos."; Code[20])
        {
            Caption = 'Credit Transfer Msg. Nos.';
            TableRelation = "No. Series";
        }
        field(116; "Direct Debit Msg. Nos."; Code[20])
        {
            Caption = 'Direct Debit Msg. Nos.';
            TableRelation = "No. Series";
        }
        field(117; "SEPA Direct Debit Exp. Format"; Code[20])
        {
            Caption = 'SEPA Direct Debit Exp. Format';
            TableRelation = "Bank Export/Import Setup".Code WHERE (Direction = CONST (Export));
        }
        field(121; "Bank Stmt. Service Record ID"; RecordID)
        {
            Caption = 'Bank Stmt. Service Record ID';
            DataClassification = SystemMetadata;
        }
        field(123; "Transaction Import Timespan"; Integer)
        {
            Caption = 'Transaction Import Timespan';
        }
        field(124; "Automatic Stmt. Import Enabled"; Boolean)
        {
            Caption = 'Automatic Stmt. Import Enabled';
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(170; "Creditor No."; Code[35])
        {
            Caption = 'Creditor No.';
        }
        field(1210; "Payment Export Format"; Code[20])
        {
            Caption = 'Payment Export Format';
            TableRelation = "Bank Export/Import Setup".Code WHERE (Direction = CONST (Export));
        }
        field(1211; "Bank Clearing Code"; Text[50])
        {
            Caption = 'Bank Clearing Code';
        }
        field(1212; "Bank Clearing Standard"; Text[50])
        {
            Caption = 'Bank Clearing Standard';
            TableRelation = "Bank Clearing Standard";
        }
        field(1213; "Bank Name - Data Conversion"; Text[50])
        {
            Caption = 'Bank Name - Data Conversion';
            ObsoleteReason = 'Changed to AMC Banking 365 Fundamentals Extension';
            ObsoleteState = Pending;
            TableRelation = "Bank Data Conv. Bank" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(1250; "Match Tolerance Type"; Option)
        {
            Caption = 'Match Tolerance Type';
            OptionCaption = 'Percentage,Amount';
            OptionMembers = Percentage,Amount;
        }
        field(1251; "Match Tolerance Value"; Decimal)
        {
            Caption = 'Match Tolerance Value';
            DecimalPlaces = 0 : 5;
        }
        field(1260; "Positive Pay Export Code"; Code[20])
        {
            Caption = 'Positive Pay Export Code';
            TableRelation = "Bank Export/Import Setup".Code WHERE (Direction = CONST ("Export-Positive Pay"));
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
        key(Key3; "Bank Acc. Posting Group")
        {
        }
        key(Key4; "Currency Code")
        {
        }
        key(Key5; "Country/Region Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Bank Account No.", "Currency Code")
        {
        }
        fieldgroup(Brick; "No.", Name, "Bank Account No.", "Currency Code", Image)
        {
        }
    }
}

