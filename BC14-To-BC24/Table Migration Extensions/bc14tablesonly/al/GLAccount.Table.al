table 15 "G/L Account"
{
    Caption = 'G/L Account';
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(8; "Account Category"; Option)
        {
            BlankZero = true;
            Caption = 'Account Category';
            OptionCaption = ' ,Assets,Liabilities,Equity,Income,Cost of Goods Sold,Expense';
            OptionMembers = " ",Assets,Liabilities,Equity,Income,"Cost of Goods Sold",Expense;
        }
        field(9; "Income/Balance"; Option)
        {
            Caption = 'Income/Balance';
            OptionCaption = 'Income Statement,Balance Sheet';
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(10; "Debit/Credit"; Option)
        {
            Caption = 'Debit/Credit';
            OptionCaption = 'Both,Debit,Credit';
            OptionMembers = Both,Debit,Credit;
        }
        field(11; "No. 2"; Code[20])
        {
            Caption = 'No. 2';
        }
        field(12; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST ("G/L Account"),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(14; "Direct Posting"; Boolean)
        {
            Caption = 'Direct Posting';
            InitValue = true;
        }
        field(16; "Reconciliation Account"; Boolean)
        {
            AccessByPermission = TableData "Bank Account" = R;
            Caption = 'Reconciliation Account';
        }
        field(17; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(18; "No. of Blank Lines"; Integer)
        {
            Caption = 'No. of Blank Lines';
            MinValue = 0;
        }
        field(19; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(25; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(26; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(28; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(29; "Global Dimension 1 Filter"; Code[20])
        {
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(30; "Global Dimension 2 Filter"; Code[20])
        {
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(31; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                        "G/L Account No." = FIELD (FILTER (Totaling)),
                                                        "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                        "Posting Date" = FIELD (UPPERLIMIT ("Date Filter")),
                                                        "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Net Change"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                        "G/L Account No." = FIELD (FILTER (Totaling)),
                                                        "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                        "Posting Date" = FIELD ("Date Filter"),
                                                        "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Budget Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                               "G/L Account No." = FIELD (FILTER (Totaling)),
                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                               Date = FIELD ("Date Filter"),
                                                               "Budget Name" = FIELD ("Budget Filter"),
                                                               "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Budgeted Amount';
            FieldClass = FlowField;
        }
        field(34; Totaling; Text[250])
        {
            Caption = 'Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(35; "Budget Filter"; Code[10])
        {
            Caption = 'Budget Filter';
            FieldClass = FlowFilter;
            TableRelation = "G/L Budget Name";
        }
        field(36; Balance; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                        "G/L Account No." = FIELD (FILTER (Totaling)),
                                                        "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                        "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Budget at Date"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Budget Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                               "G/L Account No." = FIELD (FILTER (Totaling)),
                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                               Date = FIELD (UPPERLIMIT ("Date Filter")),
                                                               "Budget Name" = FIELD ("Budget Filter"),
                                                               "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Budget at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "Consol. Translation Method"; Option)
        {
            AccessByPermission = TableData "Business Unit" = R;
            Caption = 'Consol. Translation Method';
            OptionCaption = 'Average Rate (Manual),Closing Rate,Historical Rate,Composite Rate,Equity Rate';
            OptionMembers = "Average Rate (Manual)","Closing Rate","Historical Rate","Composite Rate","Equity Rate";
        }
        field(40; "Consol. Debit Acc."; Code[20])
        {
            AccessByPermission = TableData "Business Unit" = R;
            Caption = 'Consol. Debit Acc.';
        }
        field(41; "Consol. Credit Acc."; Code[20])
        {
            AccessByPermission = TableData "Business Unit" = R;
            Caption = 'Consol. Credit Acc.';
        }
        field(42; "Business Unit Filter"; Code[20])
        {
            Caption = 'Business Unit Filter';
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(43; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale';
            OptionMembers = " ",Purchase,Sale;
        }
        field(44; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(45; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(46; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(47; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("G/L Entry"."Debit Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                "Posting Date" = FIELD ("Date Filter"),
                                                                "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("G/L Entry"."Credit Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                 "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                 "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                 "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                 "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                 "Posting Date" = FIELD ("Date Filter"),
                                                                 "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
        }
        field(52; "Budgeted Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankNumbers = BlankNegAndZero;
            CalcFormula = Sum ("G/L Budget Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                               "G/L Account No." = FIELD (FILTER (Totaling)),
                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                               Date = FIELD ("Date Filter"),
                                                               "Budget Name" = FIELD ("Budget Filter"),
                                                               "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Budgeted Debit Amount';
            FieldClass = FlowField;
        }
        field(53; "Budgeted Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankNumbers = BlankNegAndZero;
            CalcFormula = - Sum ("G/L Budget Entry".Amount WHERE ("G/L Account No." = FIELD ("No."),
                                                                "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                Date = FIELD ("Date Filter"),
                                                                "Budget Name" = FIELD ("Budget Filter"),
                                                                "Dimension Set ID" = FIELD ("Dimension Set ID Filter")));
            Caption = 'Budgeted Credit Amount';
            FieldClass = FlowField;
        }
        field(54; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(55; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(56; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(57; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(58; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(59; "VAT Amt."; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."VAT Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                              "G/L Account No." = FIELD (FILTER (Totaling)),
                                                              "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                              "Posting Date" = FIELD ("Date Filter")));
            Caption = 'VAT Amt.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Additional-Currency Net Change"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."Additional-Currency Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                              "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                              "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Additional-Currency Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Add.-Currency Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."Additional-Currency Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                              "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                              "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Add.-Currency Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Additional-Currency Balance"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."Additional-Currency Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                              "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                              "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Additional-Currency Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63; "Exchange Rate Adjustment"; Option)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Exchange Rate Adjustment';
            OptionCaption = 'No Adjustment,Adjust Amount,Adjust Additional-Currency Amount';
            OptionMembers = "No Adjustment","Adjust Amount","Adjust Additional-Currency Amount";
        }
        field(64; "Add.-Currency Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."Add.-Currency Debit Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                              "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                              "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Add.-Currency Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Add.-Currency Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("G/L Entry"."Add.-Currency Credit Amount" WHERE ("G/L Account No." = FIELD ("No."),
                                                                               "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                               "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Add.-Currency Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Default IC Partner G/L Acc. No"; Code[20])
        {
            Caption = 'Default IC Partner G/L Acc. No';
            TableRelation = "IC G/L Account"."No.";
        }
        field(70; "Omit Default Descr. in Jnl."; Boolean)
        {
            Caption = 'Omit Default Descr. in Jnl.';
        }
        field(80; "Account Subcategory Entry No."; Integer)
        {
            Caption = 'Account Subcategory Entry No.';
            TableRelation = "G/L Account Category";
        }
        field(81; "Account Subcategory Descript."; Text[80])
        {
            CalcFormula = Lookup ("G/L Account Category".Description WHERE ("Entry No." = FIELD ("Account Subcategory Entry No.")));
            Caption = 'Account Subcategory Descript.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(400; "Dimension Set ID Filter"; Integer)
        {
            Caption = 'Dimension Set ID Filter';
            FieldClass = FlowFilter;
        }
        field(1100; "Cost Type No."; Code[20])
        {
            Caption = 'Cost Type No.';
            Editable = false;
            TableRelation = "Cost Type";
            ValidateTableRelation = false;
        }
        field(1700; "Default Deferral Template Code"; Code[10])
        {
            Caption = 'Default Deferral Template Code';
            TableRelation = "Deferral Template"."Deferral Code";
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
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
        key(Key3; "Reconciliation Account")
        {
        }
        key(Key4; "Gen. Bus. Posting Group")
        {
        }
        key(Key5; "Gen. Prod. Posting Group")
        {
        }
        key(Key6; "Consol. Debit Acc.", "Consol. Translation Method")
        {
            Enabled = false;
        }
        key(Key7; "Consol. Credit Acc.", "Consol. Translation Method")
        {
            Enabled = false;
        }
        key(Key8; Name)
        {
        }
        key(Key9; "Account Type")
        {
        }
        key(Key10; "Account Category")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Income/Balance", Blocked, "Direct Posting")
        {
        }
    }
}

