table 1112 "Cost Center"
{
    Caption = 'Cost Center';

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
        field(3; "Cost Subtype"; Option)
        {
            Caption = 'Cost Subtype';
            OptionCaption = ' ,Service Cost Center,Aux. Cost Center,Main Cost Center';
            OptionMembers = " ","Service Cost Center","Aux. Cost Center","Main Cost Center";
        }
        field(4; "Cost Type Filter"; Code[20])
        {
            Caption = 'Cost Type Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cost Type";
        }
        field(5; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(6; "Net Change"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Center Code" = FIELD (Code),
                                                         "Cost Center Code" = FIELD (FILTER (Totaling)),
                                                         "Cost Type No." = FIELD ("Cost Type Filter"),
                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Balance at Date"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Center Code" = FIELD (Code),
                                                         "Cost Center Code" = FIELD (FILTER (Totaling)),
                                                         "Cost Type No." = FIELD ("Cost Type Filter"),
                                                         "Posting Date" = FIELD (UPPERLIMIT ("Date Filter"))));
            Caption = 'Balance at Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Balance to Allocate"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum ("Cost Entry".Amount WHERE ("Cost Center Code" = FIELD (Code),
                                                         "Cost Center Code" = FIELD (FILTER (Totaling)),
                                                         "Cost Type No." = FIELD ("Cost Type Filter"),
                                                         "Posting Date" = FIELD ("Date Filter"),
                                                         Allocated = CONST (false)));
            Caption = 'Balance to Allocate';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Responsible Person"; Code[50])
        {
            Caption = 'Responsible Person';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Sorting Order"; Code[10])
        {
            Caption = 'Sorting Order';
        }
        field(11; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(12; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Cost Center,Heading,Total,Begin-Total,End-Total';
            OptionMembers = "Cost Center",Heading,Total,"Begin-Total","End-Total";
        }
        field(13; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(14; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(15; "Blank Line"; Boolean)
        {
            Caption = 'Blank Line';
            MinValue = false;
        }
        field(16; Indentation; Integer)
        {
            Caption = 'Indentation';
            Editable = false;
            MinValue = 0;
        }
        field(17; Totaling; Text[250])
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
        key(Key2; "Cost Subtype")
        {
        }
        key(Key3; "Sorting Order")
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

