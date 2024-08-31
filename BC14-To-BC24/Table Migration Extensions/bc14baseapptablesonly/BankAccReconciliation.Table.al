table 273 "Bank Acc. Reconciliation"
{
    Caption = 'Bank Acc. Reconciliation';
    DataCaptionFields = "Bank Account No.", "Statement No.";
    Permissions = TableData "Bank Account" = rm,
                  TableData "Data Exch." = rimd;

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            NotBlank = true;
            TableRelation = "Bank Account";
        }
        field(2; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            Editable = false;
            NotBlank = true;
        }
        field(3; "Statement Ending Balance"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Statement Ending Balance';
        }
        field(4; "Statement Date"; Date)
        {
            Caption = 'Statement Date';
        }
        field(5; "Balance Last Statement"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance Last Statement';
        }
        field(6; "Bank Statement"; BLOB)
        {
            Caption = 'Bank Statement';
        }
        field(7; "Total Balance on Bank Account"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("Bank Account No.")));
            Caption = 'Total Balance on Bank Account';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Total Applied Amount"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No.")));
            Caption = 'Total Applied Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Total Transaction Amount"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Statement Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                        "Bank Account No." = FIELD ("Bank Account No."),
                                                                                        "Statement No." = FIELD ("Statement No.")));
            Caption = 'Total Transaction Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Total Unposted Applied Amount"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      "Account Type" = FILTER (<> "Bank Account")));
            Caption = 'Total Unposted Applied Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Total Difference"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line".Difference WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                "Bank Account No." = FIELD ("Bank Account No."),
                                                                                "Statement No." = FIELD ("Statement No.")));
            Caption = 'Total Difference';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Statement Type"; Option)
        {
            Caption = 'Statement Type';
            OptionCaption = 'Bank Reconciliation,Payment Application';
            OptionMembers = "Bank Reconciliation","Payment Application";
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(23; "Post Payments Only"; Boolean)
        {
            Caption = 'Post Payments Only';
        }
        field(24; "Import Posted Transactions"; Option)
        {
            Caption = 'Import Posted Transactions';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(25; "Total Outstd Bank Transactions"; Decimal)
        {
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                        Open = CONST (true),
                                                                        "Check Ledger Entries" = CONST (0)));
            Caption = 'Total Outstd Bank Transactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Total Outstd Payments"; Decimal)
        {
            CalcFormula = Sum ("Bank Account Ledger Entry".Amount WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                        Open = CONST (true),
                                                                        "Check Ledger Entries" = FILTER (> 0)));
            Caption = 'Total Outstd Payments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Total Applied Amount Payments"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      Type = CONST ("Check Ledger Entry")));
            Caption = 'Total Applied Amount Payments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Bank Account Balance (LCY)"; Decimal)
        {
            CalcFormula = Sum ("Bank Account Ledger Entry"."Amount (LCY)" WHERE ("Bank Account No." = FIELD ("Bank Account No.")));
            Caption = 'Bank Account Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Total Positive Adjustments"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      "Account Type" = FILTER (<> "Bank Account"),
                                                                                      "Statement Amount" = FILTER (> 0)));
            Caption = 'Total Positive Adjustments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Total Negative Adjustments"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      "Account Type" = FILTER (<> "Bank Account"),
                                                                                      "Statement Amount" = FILTER (< 0)));
            Caption = 'Total Negative Adjustments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Total Positive Difference"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Account Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      Type = CONST (Difference),
                                                                                      "Applied Amount" = FILTER (> 0)));
            Caption = 'Total Positive Difference';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Total Negative Difference"; Decimal)
        {
            CalcFormula = Sum ("Bank Acc. Reconciliation Line"."Applied Amount" WHERE ("Account Type" = FIELD ("Statement Type"),
                                                                                      "Bank Account No." = FIELD ("Bank Account No."),
                                                                                      "Statement No." = FIELD ("Statement No."),
                                                                                      Type = CONST (Difference),
                                                                                      "Applied Amount" = FILTER (< 0)));
            Caption = 'Total Negative Difference';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Copy VAT Setup to Jnl. Line"; Boolean)
        {
            Caption = 'Copy VAT Setup to Jnl. Line';
            InitValue = true;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Statement Type", "Bank Account No.", "Statement No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

