table 1103 "Cost Type"
{
    Caption = 'Cost Type';
    DataCaptionFields = "No.", Name;
    Permissions =;

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
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Cost Type,Heading,Total,Begin-Total,End-Total';
            OptionMembers = "Cost Type",Heading,Total,"Begin-Total","End-Total";
        }
        field(6; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(7; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(10; "Combine Entries"; Option)
        {
            Caption = 'Combine Entries';
            OptionCaption = 'None,Day,Month';
            OptionMembers = "None",Day,Month;
        }
        field(13; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(17; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(18; "Blank Line"; Boolean)
        {
            BlankZero = true;
            Caption = 'Blank Line';
            MinValue = false;
        }
        field(19; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(20; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(22; "Cost Classification"; Option)
        {
            Caption = 'Cost Classification';
            OptionCaption = ' ,Fixed,Variable,Step Variable';
            OptionMembers = " ","Fixed",Variable,"Step Variable";
        }
        field(23; "Fixed Share"; Text[30])
        {
            Caption = 'Fixed Share';
        }
        field(26; "Modified Date"; Date)
        {
            Caption = 'Modified Date';
            Editable = false;
        }
        field(27; "Modified By"; Code[50])
        {
            Caption = 'Modified By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(28; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(29; "Cost Center Filter"; Code[20])
        {
            Caption = 'Cost Center Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Center";
        }
        field(30; "Cost Object Filter"; Code[20])
        {
            Caption = 'Cost Object Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Object";
        }
        field(31; "Balance at Date"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                         "Cost Type No." = FIELD (FILTER (Totaling)),
                                                         "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                         "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                         "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Net Change"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                         "Cost Type No." = FIELD (FILTER (Totaling)),
                                                         "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                         "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Budget Amount"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Budget Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                                "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                Date = FIELD ("Date Filter"),
                                                                "Budget Name" = FIELD ("Budget Filter")));
            Caption = 'Budget Amount';
            FieldClass = FlowField;
        }
        field(34; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Cost Type";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(35; "Budget Filter"; Code[10])
        {
            Caption = 'Budget Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Budget Name";
        }
        field(36; Balance; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                         "Cost Type No." = FIELD (FILTER (Totaling)),
                                                         "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                         "Cost Object Code" = FIELD ("Cost Object Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Budget at Date"; Decimal)
        {
            Caption = 'Budget at Date';
            Editable = false;
        }
        field(40; "G/L Account Range"; Text[50])
        {
            Caption = 'G/L Account Range';
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(47; "Debit Amount"; Decimal)
        {
            CalcFormula = Sum ("Cost Entry"."Debit Amount" WHERE ("Cost Type No." = FIELD ("No."),
                                                                 "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                 "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                 "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                 "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Debit Amount';
            FieldClass = FlowField;
        }
        field(48; "Credit Amount"; Decimal)
        {
            CalcFormula = Sum ("Cost Entry"."Credit Amount" WHERE ("Cost Type No." = FIELD ("No."),
                                                                  "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                  "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                  "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                  "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Credit Amount';
            FieldClass = FlowField;
        }
        field(51; "Balance to Allocate"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                         "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                         "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                         Allocated = CONST (false),
                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Balance to Allocate';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Budget Debit Amount"; Decimal)
        {
            BlankNumbers = BlankNegAndZero;
            CalcFormula = Sum ("Cost Budget Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                                "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                Date = FIELD ("Date Filter"),
                                                                "Budget Name" = FIELD ("Budget Filter")));
            Caption = 'Budget Debit Amount';
            FieldClass = FlowField;
        }
        field(72; "Budget Credit Amount"; Decimal)
        {
            BlankNumbers = BlankNegAndZero;
            CalcFormula = - Sum ("Cost Budget Entry".Amount WHERE ("Cost Type No." = FIELD ("No."),
                                                                 "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                 "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                 "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                 Date = FIELD ("Date Filter"),
                                                                 "Budget Name" = FIELD ("Budget Filter")));
            Caption = 'Budget Credit Amount';
            FieldClass = FlowField;
        }
        field(73; "Add. Currency Net Change"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry"."Additional-Currency Amount" WHERE ("Cost Type No." = FIELD ("No."),
                                                                               "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                               "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                               "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                               "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Add. Currency Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(74; "Add. Currency Balance at Date"; Decimal)
        {
            CalcFormula = Sum ("Cost Entry"."Additional-Currency Amount" WHERE ("Cost Type No." = FIELD ("No."),
                                                                               "Cost Type No." = FIELD (FILTER (Totaling)),
                                                                               "Cost Center Code" = FIELD ("Cost Center Filter"),
                                                                               "Cost Object Code" = FIELD ("Cost Object Filter"),
                                                                               "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Add. Currency Balance at Date';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Type)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, Type)
        {
        }
    }
}

