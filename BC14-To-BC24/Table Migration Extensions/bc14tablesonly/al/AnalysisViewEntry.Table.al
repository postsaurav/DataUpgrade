table 365 "Analysis View Entry"
{
    Caption = 'Analysis View Entry';

    fields
    {
        field(1; "Analysis View Code"; Code[10])
        {
            Caption = 'Analysis View Code';
            NotBlank = true;
            TableRelation = "Analysis View" WHERE ("Account Source" = FIELD ("Account Source"));
        }
        field(2; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(3; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Source" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Source" = CONST ("Cash Flow Account")) "Cash Flow Account";
        }
        field(4; "Dimension 1 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Value Code';
        }
        field(5; "Dimension 2 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Value Code';
        }
        field(6; "Dimension 3 Value Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Value Code';
        }
        field(7; "Dimension 4 Value Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 4 Value Code';
        }
        field(8; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(9; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(10; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(11; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Debit Amount';
        }
        field(12; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Amount';
        }
        field(13; "Add.-Curr. Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Add.-Curr. Amount';
        }
        field(14; "Add.-Curr. Debit Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Add.-Curr. Debit Amount';
        }
        field(15; "Add.-Curr. Credit Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            AutoFormatType = 1;
            Caption = 'Add.-Curr. Credit Amount';
        }
        field(16; "Account Source"; Option)
        {
            Caption = 'Account Source';
            OptionCaption = 'G/L Account,Cash Flow Account';
            OptionMembers = "G/L Account","Cash Flow Account";
        }
        field(17; "Cash Flow Forecast No."; Code[20])
        {
            Caption = 'Cash Flow Forecast No.';
            TableRelation = "Cash Flow Forecast";
        }
    }

    keys
    {
        key(Key1; "Analysis View Code", "Account No.", "Account Source", "Dimension 1 Value Code", "Dimension 2 Value Code", "Dimension 3 Value Code", "Dimension 4 Value Code", "Business Unit Code", "Posting Date", "Entry No.", "Cash Flow Forecast No.")
        {
            Clustered = true;
        }
        key(Key2; "Analysis View Code", "Account No.", "Account Source", "Dimension 1 Value Code", "Dimension 2 Value Code", "Dimension 3 Value Code", "Dimension 4 Value Code", "Business Unit Code", "Posting Date", "Cash Flow Forecast No.")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Add.-Curr. Amount", "Add.-Curr. Debit Amount", "Add.-Curr. Credit Amount";
        }
    }

    fieldgroups
    {
    }
}

