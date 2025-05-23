table 376 "G/L Account (Analysis View)"
{
    Caption = 'G/L Account (Analysis View)';
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF ("Account Source" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Source" = CONST ("Cash Flow Account")) "Cash Flow Account";
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
        field(5; "Account Source"; Option)
        {
            Caption = 'Account Source';
            OptionCaption = 'G/L Account,Cash Flow Account';
            OptionMembers = "G/L Account","Cash Flow Account";
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
        field(26; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(27; "Cash Flow Forecast Filter"; Code[20])
        {
            Caption = 'Cash Flow Forecast Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cash Flow Forecast";
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
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                  "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                  "Account No." = FIELD ("No."),
                                                                  "Account Source" = FIELD ("Account Source"),
                                                                  "Account No." = FIELD (FILTER (Totaling)),
                                                                  "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                  "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                  "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                  "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                  "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Net Change"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                  "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                  "Account No." = FIELD ("No."),
                                                                  "Account Source" = FIELD ("Account Source"),
                                                                  "Account No." = FIELD (FILTER (Totaling)),
                                                                  "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                  "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                  "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                  "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                  "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Budget Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                         "Budget Name" = FIELD ("Budget Filter"),
                                                                         "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                         "G/L Account No." = FIELD ("No."),
                                                                         "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                         "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                         "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                         "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                         "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Budgeted Amount';
            FieldClass = FlowField;
        }
        field(34; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = IF ("Account Source" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Source" = CONST ("Cash Flow Account")) "Cash Flow Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
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
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                  "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                  "Account No." = FIELD ("No."),
                                                                  "Account Source" = FIELD ("Account Source"),
                                                                  "Account No." = FIELD (FILTER (Totaling)),
                                                                  "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                  "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                  "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                  "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                  "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Budgeted at Date"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Budget Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                         "Budget Name" = FIELD ("Budget Filter"),
                                                                         "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                         "G/L Account No." = FIELD ("No."),
                                                                         "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                         "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                         "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                         "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                         "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                         "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Budgeted at Date';
            FieldClass = FlowField;
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
        field(47; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Debit Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                          "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                          "Account No." = FIELD ("No."),
                                                                          "Account Source" = FIELD ("Account Source"),
                                                                          "Account No." = FIELD (Totaling),
                                                                          "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                          "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                          "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                          "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Credit Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                           "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                           "Account No." = FIELD ("No."),
                                                                           "Account Source" = FIELD ("Account Source"),
                                                                           "Account No." = FIELD (Totaling),
                                                                           "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                           "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                           "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                           "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter")));
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
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Budget Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                         "Budget Name" = FIELD ("Budget Filter"),
                                                                         "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                         "G/L Account No." = FIELD ("No."),
                                                                         "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                         "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                         "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                         "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                         "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                         "Posting Date" = FIELD ("Date Filter"),
                                                                         Amount = FILTER (> 0)));
            Caption = 'Budgeted Debit Amount';
            FieldClass = FlowField;
        }
        field(53; "Budgeted Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankNumbers = BlankZeroAndPos;
            BlankZero = true;
            CalcFormula = - Sum ("Analysis View Budget Entry".Amount WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                          "Budget Name" = FIELD ("Budget Filter"),
                                                                          "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                          "G/L Account No." = FIELD ("No."),
                                                                          "G/L Account No." = FIELD (FILTER (Totaling)),
                                                                          "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                          "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                          "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                          "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter"),
                                                                          Amount = FILTER (< 0)));
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
        field(60; "Additional-Currency Net Change"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Add.-Curr. Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                               "Account No." = FIELD ("No."),
                                                                               "Account Source" = FIELD ("Account Source"),
                                                                               "Account No." = FIELD (FILTER (Totaling)),
                                                                               "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                               "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                               "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                               "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                               "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Additional-Currency Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61; "Add.-Currency Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Add.-Curr. Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                               "Account No." = FIELD ("No."),
                                                                               "Account Source" = FIELD ("Account Source"),
                                                                               "Account No." = FIELD (FILTER (Totaling)),
                                                                               "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                               "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                               "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                               "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                               "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Add.-Currency Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Additional-Currency Balance"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Add.-Curr. Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                               "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                               "Account No." = FIELD ("No."),
                                                                               "Account Source" = FIELD ("Account Source"),
                                                                               "Account No." = FIELD (FILTER (Totaling)),
                                                                               "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                               "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                               "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                               "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                               "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Additional-Currency Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63; "Exchange Rate Adjustment"; Option)
        {
            Caption = 'Exchange Rate Adjustment';
            OptionCaption = 'No Adjustment,Adjust Amount,Adjust Additional-Currency Amount';
            OptionMembers = "No Adjustment","Adjust Amount","Adjust Additional-Currency Amount";
        }
        field(64; "Add.-Currency Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Add.-Curr. Debit Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                                     "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                                     "Account No." = FIELD ("No."),
                                                                                     "Account Source" = FIELD ("Account Source"),
                                                                                     "Account No." = FIELD (FILTER (Totaling)),
                                                                                     "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                                     "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                                     "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                                     "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                                     "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Add.-Currency Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Add.-Currency Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Analysis View Entry"."Add.-Curr. Credit Amount" WHERE ("Analysis View Code" = FIELD ("Analysis View Filter"),
                                                                                      "Business Unit Code" = FIELD ("Business Unit Filter"),
                                                                                      "Account No." = FIELD ("No."),
                                                                                      "Account Source" = FIELD ("Account Source"),
                                                                                      "Account No." = FIELD (FILTER (Totaling)),
                                                                                      "Dimension 1 Value Code" = FIELD ("Dimension 1 Filter"),
                                                                                      "Dimension 2 Value Code" = FIELD ("Dimension 2 Filter"),
                                                                                      "Dimension 3 Value Code" = FIELD ("Dimension 3 Filter"),
                                                                                      "Dimension 4 Value Code" = FIELD ("Dimension 4 Filter"),
                                                                                      "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Add.-Currency Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Analysis View Filter"; Code[10])
        {
            Caption = 'Analysis View Filter';
            FieldClass = FlowFilter;
            TableRelation = "Analysis View";
        }
        field(67; "Dimension 1 Filter"; Code[20])
        {
            Caption = 'Dimension 1 Filter';
            FieldClass = FlowFilter;
        }
        field(68; "Dimension 2 Filter"; Code[20])
        {
            Caption = 'Dimension 2 Filter';
            FieldClass = FlowFilter;
        }
        field(69; "Dimension 3 Filter"; Code[20])
        {
            Caption = 'Dimension 3 Filter';
            FieldClass = FlowFilter;
        }
        field(70; "Dimension 4 Filter"; Code[20])
        {
            Caption = 'Dimension 4 Filter';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "No.", "Account Source")
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
    }

    fieldgroups
    {
    }
}

