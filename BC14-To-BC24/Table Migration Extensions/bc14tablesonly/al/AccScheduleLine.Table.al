table 85 "Acc. Schedule Line"
{
    Caption = 'Acc. Schedule Line';

    fields
    {
        field(1; "Schedule Name"; Code[10])
        {
            Caption = 'Schedule Name';
            TableRelation = "Acc. Schedule Name";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Row No."; Code[10])
        {
            Caption = 'Row No.';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = IF ("Totaling Type" = CONST ("Posting Accounts")) "G/L Account"
            ELSE
            IF ("Totaling Type" = CONST ("Total Accounts")) "G/L Account"
            ELSE
            IF ("Totaling Type" = CONST ("Cash Flow Entry Accounts")) "Cash Flow Account"
            ELSE
            IF ("Totaling Type" = CONST ("Cash Flow Total Accounts")) "Cash Flow Account"
            ELSE
            IF ("Totaling Type" = CONST ("Cost Type")) "Cost Type"
            ELSE
            IF ("Totaling Type" = CONST ("Cost Type Total")) "Cost Type";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(6; "Totaling Type"; Option)
        {
            Caption = 'Totaling Type';
            OptionCaption = 'Posting Accounts,Total Accounts,Formula,,,Set Base For Percent,Cost Type,Cost Type Total,Cash Flow Entry Accounts,Cash Flow Total Accounts';
            OptionMembers = "Posting Accounts","Total Accounts",Formula,,,"Set Base For Percent","Cost Type","Cost Type Total","Cash Flow Entry Accounts","Cash Flow Total Accounts";
        }
        field(7; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(8; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
        field(11; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(12; "Dimension 1 Filter"; Code[20])
        {
            Caption = 'Dimension 1 Filter';
            FieldClass = FlowFilter;
        }
        field(13; "Dimension 2 Filter"; Code[20])
        {
            Caption = 'Dimension 2 Filter';
            FieldClass = FlowFilter;
        }
        field(14; "G/L Budget Filter"; Code[10])
        {
            Caption = 'G/L Budget Filter';
            FieldClass = FlowFilter;
            TableRelation = "G/L Budget Name";
        }
        field(15; "Business Unit Filter"; Code[20])
        {
            Caption = 'Business Unit Filter';
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(16; Show; Option)
        {
            Caption = 'Show';
            OptionCaption = 'Yes,No,If Any Column Not Zero,When Positive Balance,When Negative Balance';
            OptionMembers = Yes,No,"If Any Column Not Zero","When Positive Balance","When Negative Balance";
        }
        field(17; "Dimension 3 Filter"; Code[20])
        {
            Caption = 'Dimension 3 Filter';
            FieldClass = FlowFilter;
        }
        field(18; "Dimension 4 Filter"; Code[20])
        {
            Caption = 'Dimension 4 Filter';
            FieldClass = FlowFilter;
        }
        field(19; "Dimension 1 Totaling"; Text[250])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(20; "Dimension 2 Totaling"; Text[250])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(21; "Dimension 3 Totaling"; Text[250])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(22; "Dimension 4 Totaling"; Text[250])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 4 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(23; Bold; Boolean)
        {
            Caption = 'Bold';
        }
        field(24; Italic; Boolean)
        {
            Caption = 'Italic';
        }
        field(25; Underline; Boolean)
        {
            Caption = 'Underline';
        }
        field(26; "Show Opposite Sign"; Boolean)
        {
            Caption = 'Show Opposite Sign';
        }
        field(27; "Row Type"; Option)
        {
            Caption = 'Row Type';
            OptionCaption = 'Net Change,Balance at Date,Beginning Balance';
            OptionMembers = "Net Change","Balance at Date","Beginning Balance";
        }
        field(28; "Amount Type"; Option)
        {
            Caption = 'Amount Type';
            OptionCaption = 'Net Amount,Debit Amount,Credit Amount';
            OptionMembers = "Net Amount","Debit Amount","Credit Amount";
        }
        field(30; "Double Underline"; Boolean)
        {
            Caption = 'Double Underline';
        }
        field(840; "Cash Flow Forecast Filter"; Code[20])
        {
            Caption = 'Cash Flow Forecast Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cash Flow Forecast";
        }
        field(1100; "Cost Center Filter"; Code[20])
        {
            Caption = 'Cost Center Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Center";
        }
        field(1101; "Cost Object Filter"; Code[20])
        {
            Caption = 'Cost Object Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Object";
        }
        field(1102; "Cost Center Totaling"; Text[80])
        {
            Caption = 'Cost Center Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(1103; "Cost Object Totaling"; Text[80])
        {
            Caption = 'Cost Object Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(1104; "Cost Budget Filter"; Code[10])
        {
            Caption = 'Cost Budget Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Budget Name";
        }
    }

    keys
    {
        key(Key1; "Schedule Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

