table 7118 "Analysis Column"
{
    Caption = 'Analysis Column';

    fields
    {
        field(1; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(2; "Analysis Column Template"; Code[10])
        {
            Caption = 'Analysis Column Template';
            TableRelation = "Analysis Column Template".Name WHERE ("Analysis Area" = FIELD ("Analysis Area"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Column No."; Code[10])
        {
            Caption = 'Column No.';
        }
        field(5; "Column Header"; Text[50])
        {
            Caption = 'Column Header';
        }
        field(6; "Column Type"; Option)
        {
            Caption = 'Column Type';
            InitValue = "Net Change";
            OptionCaption = 'Formula,Net Change,Balance at Date,Beginning Balance,Year to Date,Rest of Fiscal Year,Entire Fiscal Year';
            OptionMembers = Formula,"Net Change","Balance at Date","Beginning Balance","Year to Date","Rest of Fiscal Year","Entire Fiscal Year";
        }
        field(7; "Ledger Entry Type"; Option)
        {
            Caption = 'Ledger Entry Type';
            OptionCaption = 'Item Entries,Item Budget Entries';
            OptionMembers = "Item Entries","Item Budget Entries";
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
        field(13; "Comparison Period Formula"; Code[20])
        {
            Caption = 'Comparison Period Formula';
        }
        field(14; "Analysis Type Code"; Code[10])
        {
            Caption = 'Analysis Type Code';
            TableRelation = "Analysis Type";
        }
        field(15; "Item Ledger Entry Type Filter"; Text[250])
        {
            Caption = 'Item Ledger Entry Type Filter';
        }
        field(16; "Value Entry Type Filter"; Text[250])
        {
            Caption = 'Value Entry Type Filter';
        }
        field(17; "Value Type"; Option)
        {
            Caption = 'Value Type';
            OptionCaption = ' ,Quantity,Sales Amount,Cost Amount,Non-Invntble Amount,Unit Price,Standard Cost,Indirect Cost,Unit Cost';
            OptionMembers = " ",Quantity,"Sales Amount","Cost Amount","Non-Invntble Amount","Unit Price","Standard Cost","Indirect Cost","Unit Cost";
        }
        field(18; Invoiced; Boolean)
        {
            Caption = 'Invoiced';
        }
        field(30; "Comparison Period Formula LCID"; Integer)
        {
            Caption = 'Comparison Period Formula LCID';
        }
    }

    keys
    {
        key(Key1; "Analysis Area", "Analysis Column Template", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

