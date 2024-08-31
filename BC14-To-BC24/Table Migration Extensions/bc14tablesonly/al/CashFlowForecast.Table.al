table 840 "Cash Flow Forecast"
{
    Caption = 'Cash Flow Forecast';
    Permissions = TableData "Cash Flow Account Comment" = rimd,
                  TableData "Cash Flow Forecast Entry" = rimd;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5; "Consider Discount"; Boolean)
        {
            Caption = 'Consider Discount';
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(7; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(8; "Manual Payments To"; Date)
        {
            Caption = 'Manual Payments To';
        }
        field(9; Comment; Boolean)
        {
            CalcFormula = Exist ("Cash Flow Account Comment" WHERE ("Table Name" = CONST ("Cash Flow Forecast"),
                                                                   "No." = FIELD ("No.")));
            Caption = 'Comment';
            FieldClass = FlowField;
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "Manual Payments From"; Date)
        {
            Caption = 'Manual Payments From';
        }
        field(12; "G/L Budget From"; Date)
        {
            AccessByPermission = TableData "G/L Budget Name" = R;
            Caption = 'G/L Budget From';
        }
        field(13; "G/L Budget To"; Date)
        {
            AccessByPermission = TableData "G/L Budget Name" = R;
            Caption = 'G/L Budget To';
        }
        field(14; "Consider CF Payment Terms"; Boolean)
        {
            Caption = 'Consider CF Payment Terms';
        }
        field(15; "Consider Pmt. Disc. Tol. Date"; Boolean)
        {
            Caption = 'Consider Pmt. Disc. Tol. Date';
        }
        field(16; "Consider Pmt. Tol. Amount"; Boolean)
        {
            Caption = 'Consider Pmt. Tol. Amount';
        }
        field(17; "Account No. Filter"; Code[20])
        {
            Caption = 'Account No. Filter';
            FieldClass = FlowFilter;
        }
        field(18; "Source Type Filter"; Option)
        {
            Caption = 'Source Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Receivables,Payables,Liquid Funds,Cash Flow Manual Expense,Cash Flow Manual Revenue,Sales Order,Purchase Order,Fixed Assets Budget,Fixed Assets Disposal,Service Orders,G/L Budget,,,Job,Tax,Cortana Intelligence';
            OptionMembers = " ",Receivables,Payables,"Liquid Funds","Cash Flow Manual Expense","Cash Flow Manual Revenue","Sales Order","Purchase Order","Fixed Assets Budget","Fixed Assets Disposal","Service Orders","G/L Budget",,,Job,Tax,"Cortana Intelligence";
        }
        field(19; "Cash Flow Date Filter"; Date)
        {
            Caption = 'Cash Flow Date Filter';
            FieldClass = FlowFilter;
        }
        field(20; "Amount (LCY)"; Decimal)
        {
            CalcFormula = Sum ("Cash Flow Forecast Entry"."Amount (LCY)" WHERE ("Cash Flow Forecast No." = FIELD ("No."),
                                                                               "Cash Flow Date" = FIELD ("Cash Flow Date Filter"),
                                                                               "Source Type" = FIELD ("Source Type Filter"),
                                                                               "Cash Flow Account No." = FIELD ("Account No. Filter"),
                                                                               Positive = FIELD ("Positive Filter")));
            Caption = 'Amount (LCY)';
            FieldClass = FlowField;
        }
        field(21; "Positive Filter"; Boolean)
        {
            Caption = 'Positive Filter';
            FieldClass = FlowFilter;
        }
        field(22; "Overdue CF Dates to Work Date"; Boolean)
        {
            Caption = 'Overdue CF Dates to Work Date';
        }
        field(23; "Default G/L Budget Name"; Code[10])
        {
            Caption = 'Default G/L Budget Name';
            TableRelation = "G/L Budget Name";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Description 2", "Creation Date")
        {
        }
    }
}

