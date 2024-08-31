table 570 "G/L Account Category"
{
    Caption = 'G/L Account Category';
    DataCaptionFields = Description;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Parent Entry No."; Integer)
        {
            Caption = 'Parent Entry No.';
        }
        field(3; "Sibling Sequence No."; Integer)
        {
            Caption = 'Sibling Sequence No.';
        }
        field(4; "Presentation Order"; Text[100])
        {
            Caption = 'Presentation Order';
        }
        field(5; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
        field(6; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(7; "Account Category"; Option)
        {
            BlankZero = true;
            Caption = 'Account Category';
            OptionCaption = ',Assets,Liabilities,Equity,Income,Cost of Goods Sold,Expense';
            OptionMembers = ,Assets,Liabilities,Equity,Income,"Cost of Goods Sold",Expense;
        }
        field(8; "Income/Balance"; Option)
        {
            Caption = 'Income/Balance';
            Editable = false;
            OptionCaption = 'Income Statement,Balance Sheet';
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(9; "Additional Report Definition"; Option)
        {
            Caption = 'Additional Report Definition';
            OptionCaption = ' ,Operating Activities,Investing Activities,Financing Activities,Cash Accounts,Retained Earnings,Distribution to Shareholders';
            OptionMembers = " ","Operating Activities","Investing Activities","Financing Activities","Cash Accounts","Retained Earnings","Distribution to Shareholders";
        }
        field(11; "System Generated"; Boolean)
        {
            Caption = 'System Generated';
        }
        field(12; "Has Children"; Boolean)
        {
            CalcFormula = Exist ("G/L Account Category" WHERE ("Parent Entry No." = FIELD ("Entry No.")));
            Caption = 'Has Children';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Presentation Order", "Sibling Sequence No.")
        {
        }
        key(Key3; "Parent Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

