table 1001 "Job Task"
{
    Caption = 'Job Task';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            Editable = false;
            NotBlank = true;
            TableRelation = Job;
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Job Task Type"; Option)
        {
            Caption = 'Job Task Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(6; "WIP-Total"; Option)
        {
            Caption = 'WIP-Total';
            OptionCaption = ' ,Total,Excluded';
            OptionMembers = " ",Total,Excluded;
        }
        field(7; "Job Posting Group"; Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";
        }
        field(9; "WIP Method"; Code[20])
        {
            Caption = 'WIP Method';
            TableRelation = "Job WIP Method".Code WHERE (Valid = CONST (true));
        }
        field(10; "Schedule (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Total Cost (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                            "Job Task No." = FIELD ("Job Task No."),
                                                                            "Job Task No." = FIELD (FILTER (Totaling)),
                                                                            "Schedule Line" = CONST (true),
                                                                            "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Schedule (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Line Amount (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                             "Job Task No." = FIELD ("Job Task No."),
                                                                             "Job Task No." = FIELD (FILTER (Totaling)),
                                                                             "Schedule Line" = CONST (true),
                                                                             "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Budget (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Usage (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Ledger Entry"."Total Cost (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                           "Job Task No." = FIELD ("Job Task No."),
                                                                           "Job Task No." = FIELD (FILTER (Totaling)),
                                                                           "Entry Type" = CONST (Usage),
                                                                           "Posting Date" = FIELD ("Posting Date Filter")));
            Caption = 'Usage (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Usage (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Ledger Entry"."Line Amount (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                            "Job Task No." = FIELD ("Job Task No."),
                                                                            "Job Task No." = FIELD (FILTER (Totaling)),
                                                                            "Entry Type" = CONST (Usage),
                                                                            "Posting Date" = FIELD ("Posting Date Filter")));
            Caption = 'Usage (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Contract (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Total Cost (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                            "Job Task No." = FIELD ("Job Task No."),
                                                                            "Job Task No." = FIELD (FILTER (Totaling)),
                                                                            "Contract Line" = CONST (true),
                                                                            "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Billable (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Contract (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Line Amount (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                             "Job Task No." = FIELD ("Job Task No."),
                                                                             "Job Task No." = FIELD (FILTER (Totaling)),
                                                                             "Contract Line" = CONST (true),
                                                                             "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Billable (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Contract (Invoiced Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = - Sum ("Job Ledger Entry"."Line Amount (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                             "Job Task No." = FIELD ("Job Task No."),
                                                                             "Job Task No." = FIELD (FILTER (Totaling)),
                                                                             "Entry Type" = CONST (Sale),
                                                                             "Posting Date" = FIELD ("Posting Date Filter")));
            Caption = 'Billable (Invoiced Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Contract (Invoiced Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = - Sum ("Job Ledger Entry"."Total Cost (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                            "Job Task No." = FIELD ("Job Task No."),
                                                                            "Job Task No." = FIELD (FILTER (Totaling)),
                                                                            "Entry Type" = CONST (Sale),
                                                                            "Posting Date" = FIELD ("Posting Date Filter")));
            Caption = 'Billable (Invoiced Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Posting Date Filter"; Date)
        {
            Caption = 'Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(20; "Planning Date Filter"; Date)
        {
            Caption = 'Planning Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(22; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(23; "No. of Blank Lines"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Blank Lines';
            MinValue = 0;
        }
        field(24; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(34; "Recognized Sales Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Sales Amount';
            Editable = false;
        }
        field(37; "Recognized Costs Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Costs Amount';
            Editable = false;
        }
        field(56; "Recognized Sales G/L Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Sales G/L Amount';
            Editable = false;
        }
        field(57; "Recognized Costs G/L Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Costs G/L Amount';
            Editable = false;
        }
        field(60; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(61; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(62; "Outstanding Orders"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                                      "Job No." = FIELD ("Job No."),
                                                                                      "Job Task No." = FIELD ("Job Task No."),
                                                                                      "Job Task No." = FIELD (FILTER (Totaling))));
            Caption = 'Outstanding Orders';
            FieldClass = FlowField;
        }
        field(63; "Amt. Rcd. Not Invoiced"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Purchase Line"."A. Rcd. Not Inv. Ex. VAT (LCY)" WHERE ("Document Type" = CONST (Order),
                                                                                      "Job No." = FIELD ("Job No."),
                                                                                      "Job Task No." = FIELD ("Job Task No."),
                                                                                      "Job Task No." = FIELD (FILTER (Totaling))));
            Caption = 'Amt. Rcd. Not Invoiced';
            FieldClass = FlowField;
        }
        field(64; "Remaining (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Remaining Total Cost (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                                      "Job Task No." = FIELD ("Job Task No."),
                                                                                      "Job Task No." = FIELD (FILTER (Totaling)),
                                                                                      "Schedule Line" = CONST (true),
                                                                                      "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Remaining (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Remaining (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Job Planning Line"."Remaining Line Amount (LCY)" WHERE ("Job No." = FIELD ("Job No."),
                                                                                       "Job Task No." = FIELD ("Job Task No."),
                                                                                       "Job Task No." = FIELD (FILTER (Totaling)),
                                                                                       "Schedule Line" = CONST (true),
                                                                                       "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Remaining (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Start Date"; Date)
        {
            CalcFormula = Min ("Job Planning Line"."Planning Date" WHERE ("Job No." = FIELD ("Job No."),
                                                                         "Job Task No." = FIELD ("Job Task No.")));
            Caption = 'Start Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "End Date"; Date)
        {
            CalcFormula = Max ("Job Planning Line"."Planning Date" WHERE ("Job No." = FIELD ("Job No."),
                                                                         "Job Task No." = FIELD ("Job Task No.")));
            Caption = 'End Date';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.")
        {
            Clustered = true;
        }
        key(Key2; "Job Task No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Task No.", Description, "Job Task Type")
        {
        }
    }
}

