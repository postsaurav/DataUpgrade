table 334 "Column Layout"
{
    Caption = 'Column Layout';

    fields
    {
        field(1; "Column Layout Name"; Code[10])
        {
            Caption = 'Column Layout Name';
            TableRelation = "Column Layout Name";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Column No."; Code[10])
        {
            Caption = 'Column No.';
        }
        field(4; "Column Header"; Text[30])
        {
            Caption = 'Column Header';
        }
        field(5; "Column Type"; Option)
        {
            Caption = 'Column Type';
            InitValue = "Net Change";
            OptionCaption = 'Formula,Net Change,Balance at Date,Beginning Balance,Year to Date,Rest of Fiscal Year,Entire Fiscal Year';
            OptionMembers = Formula,"Net Change","Balance at Date","Beginning Balance","Year to Date","Rest of Fiscal Year","Entire Fiscal Year";
        }
        field(6; "Ledger Entry Type"; Option)
        {
            Caption = 'Ledger Entry Type';
            OptionCaption = 'Entries,Budget Entries';
            OptionMembers = Entries,"Budget Entries";
        }
        field(7; "Amount Type"; Option)
        {
            Caption = 'Amount Type';
            OptionCaption = 'Net Amount,Debit Amount,Credit Amount';
            OptionMembers = "Net Amount","Debit Amount","Credit Amount";
        }
        field(8; Formula; Code[80])
        {
            Caption = 'Formula';
        }
        field(9; "Comparison Date Formula"; DateFormula)
        {
            Caption = 'Comparison Date Formula';
        }
        field(10; "Show Opposite Sign"; Boolean)
        {
            Caption = 'Show Opposite Sign';
        }
        field(11; Show; Option)
        {
            Caption = 'Show';
            InitValue = Always;
            NotBlank = true;
            OptionCaption = 'Always,Never,When Positive,When Negative';
            OptionMembers = Always,Never,"When Positive","When Negative";
        }
        field(12; "Rounding Factor"; Option)
        {
            Caption = 'Rounding Factor';
            OptionCaption = 'None,1,1000,1000000';
            OptionMembers = "None","1","1000","1000000";
        }
        field(13; "Show Indented Lines"; Option)
        {
            Caption = 'Show Indented Lines';
            OptionCaption = 'All,Indented Only,Non-Indented Only';
            OptionMembers = All,"Indented Only","Non-Indented Only";
        }
        field(14; "Comparison Period Formula"; Code[20])
        {
            Caption = 'Comparison Period Formula';
        }
        field(15; "Business Unit Totaling"; Text[80])
        {
            Caption = 'Business Unit Totaling';
            TableRelation = "Business Unit";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(16; "Dimension 1 Totaling"; Text[80])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(17; "Dimension 2 Totaling"; Text[80])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(18; "Dimension 3 Totaling"; Text[80])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(19; "Dimension 4 Totaling"; Text[80])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 4 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(20; "Cost Center Totaling"; Text[80])
        {
            Caption = 'Cost Center Totaling';
        }
        field(21; "Cost Object Totaling"; Text[80])
        {
            Caption = 'Cost Object Totaling';
        }
        field(30; "Comparison Period Formula LCID"; Integer)
        {
            Caption = 'Comparison Period Formula LCID';
        }
    }

    keys
    {
        key(Key1; "Column Layout Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

