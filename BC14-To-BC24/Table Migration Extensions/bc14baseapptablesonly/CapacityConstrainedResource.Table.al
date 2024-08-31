table 99000866 "Capacity Constrained Resource"
{
    Caption = 'Capacity Constrained Resource';
    Permissions = TableData "Prod. Order Capacity Need" = r;

    fields
    {
        field(1; "Capacity No."; Code[20])
        {
            Caption = 'Capacity No.';
            TableRelation = IF ("Capacity Type" = CONST ("Work Center")) "Work Center"
            ELSE
            IF ("Capacity Type" = CONST ("Machine Center")) "Machine Center";
        }
        field(2; "Capacity Type"; Option)
        {
            Caption = 'Capacity Type';
            OptionCaption = 'Work Center,Machine Center';
            OptionMembers = "Work Center","Machine Center";
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(10; "Critical Load %"; Decimal)
        {
            Caption = 'Critical Load %';
            DecimalPlaces = 1 : 1;
        }
        field(11; "Dampener (% of Total Capacity)"; Decimal)
        {
            Caption = 'Dampener (% of Total Capacity)';
            DecimalPlaces = 1 : 1;
        }
        field(14; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            TableRelation = "Work Center";
        }
        field(39; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(40; "Work Shift Filter"; Code[10])
        {
            Caption = 'Work Shift Filter';
            FieldClass = FlowFilter;
            TableRelation = "Work Shift";
        }
        field(42; "Capacity (Effective)"; Decimal)
        {
            CalcFormula = Sum ("Calendar Entry"."Capacity (Effective)" WHERE ("Capacity Type" = FIELD ("Capacity Type"),
                                                                             "No." = FIELD ("Capacity No."),
                                                                             "Work Shift Code" = FIELD ("Work Shift Filter"),
                                                                             Date = FIELD ("Date Filter")));
            Caption = 'Capacity (Effective)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Prod. Order Need Qty."; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Allocated Time" WHERE (Type = FIELD ("Capacity Type"),
                                                                                  "No." = FIELD ("Capacity No."),
                                                                                  Date = FIELD ("Date Filter")));
            Caption = 'Prod. Order Need Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Work Center Load Qty."; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Allocated Time" WHERE ("Work Center No." = FIELD ("Work Center No."),
                                                                                  Date = FIELD ("Date Filter")));
            Caption = 'Work Center Load Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Prod. Order Need Qty. for Plan"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Allocated Time" WHERE (Type = FIELD ("Capacity Type"),
                                                                                  "No." = FIELD ("Capacity No."),
                                                                                  Date = FIELD ("Date Filter"),
                                                                                  Active = CONST (true)));
            Caption = 'Prod. Order Need Qty. for Plan';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Work Center Load Qty. for Plan"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Allocated Time" WHERE ("Work Center No." = FIELD ("Work Center No."),
                                                                                  Date = FIELD ("Date Filter"),
                                                                                  Active = CONST (true)));
            Caption = 'Work Center Load Qty. for Plan';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Capacity Type", "Capacity No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

