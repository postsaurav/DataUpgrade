table 1113 "Cost Object"
{
    Caption = 'Cost Object';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Cost Type Filter"; Code[20])
        {
            Caption = 'Cost Type Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Type";
        }
        field(4; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5; "Net Change"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Object Code" = FIELD (Code),
                                                         "Cost Object Code" = FIELD (FILTER (Totaling)),
                                                         "Cost Type No." = FIELD ("Cost Type Filter"),
                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Balance at Date"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Object Code" = FIELD (Code),
                                                         "Cost Object Code" = FIELD (FILTER (Totaling)),
                                                         "Cost Type No." = FIELD ("Cost Type Filter"),
                                                         "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Sorting Order"; Code[10])
        {
            Caption = 'Sorting Order';
        }
        field(8; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(9; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Cost Object,Heading,Total,Begin-Total,End-Total';
            OptionMembers = "Cost Object",Heading,Total,"Begin-Total","End-Total";
        }
        field(10; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(11; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(12; "Blank Line"; Boolean)
        {
            Caption = 'Blank Line';
            MinValue = false;
        }
        field(13; Indentation; Integer)
        {
            Caption = 'Indentation';
            Editable = false;
            MinValue = 0;
        }
        field(14; Totaling; Text[250])
        {
            Caption = 'Totaling';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Sorting Order")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Name)
        {
        }
    }
}

