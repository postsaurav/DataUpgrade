table 5606 "FA Posting Group"
{
    Caption = 'FA Posting Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Acquisition Cost Account"; Code[20])
        {
            Caption = 'Acquisition Cost Account';
            TableRelation = "G/L Account";
        }
        field(3; "Accum. Depreciation Account"; Code[20])
        {
            Caption = 'Accum. Depreciation Account';
            TableRelation = "G/L Account";
        }
        field(4; "Write-Down Account"; Code[20])
        {
            Caption = 'Write-Down Account';
            TableRelation = "G/L Account";
        }
        field(5; "Appreciation Account"; Code[20])
        {
            Caption = 'Appreciation Account';
            TableRelation = "G/L Account";
        }
        field(6; "Custom 1 Account"; Code[20])
        {
            Caption = 'Custom 1 Account';
            TableRelation = "G/L Account";
        }
        field(7; "Custom 2 Account"; Code[20])
        {
            Caption = 'Custom 2 Account';
            TableRelation = "G/L Account";
        }
        field(8; "Acq. Cost Acc. on Disposal"; Code[20])
        {
            Caption = 'Acq. Cost Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(9; "Accum. Depr. Acc. on Disposal"; Code[20])
        {
            Caption = 'Accum. Depr. Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(10; "Write-Down Acc. on Disposal"; Code[20])
        {
            Caption = 'Write-Down Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(11; "Appreciation Acc. on Disposal"; Code[20])
        {
            Caption = 'Appreciation Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(12; "Custom 1 Account on Disposal"; Code[20])
        {
            Caption = 'Custom 1 Account on Disposal';
            TableRelation = "G/L Account";
        }
        field(13; "Custom 2 Account on Disposal"; Code[20])
        {
            Caption = 'Custom 2 Account on Disposal';
            TableRelation = "G/L Account";
        }
        field(14; "Gains Acc. on Disposal"; Code[20])
        {
            Caption = 'Gains Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(15; "Losses Acc. on Disposal"; Code[20])
        {
            Caption = 'Losses Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(16; "Book Val. Acc. on Disp. (Gain)"; Code[20])
        {
            Caption = 'Book Val. Acc. on Disp. (Gain)';
            TableRelation = "G/L Account";
        }
        field(17; "Sales Acc. on Disp. (Gain)"; Code[20])
        {
            Caption = 'Sales Acc. on Disp. (Gain)';
            TableRelation = "G/L Account";
        }
        field(18; "Write-Down Bal. Acc. on Disp."; Code[20])
        {
            Caption = 'Write-Down Bal. Acc. on Disp.';
            TableRelation = "G/L Account";
        }
        field(19; "Apprec. Bal. Acc. on Disp."; Code[20])
        {
            Caption = 'Apprec. Bal. Acc. on Disp.';
            TableRelation = "G/L Account";
        }
        field(20; "Custom 1 Bal. Acc. on Disposal"; Code[20])
        {
            Caption = 'Custom 1 Bal. Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(21; "Custom 2 Bal. Acc. on Disposal"; Code[20])
        {
            Caption = 'Custom 2 Bal. Acc. on Disposal';
            TableRelation = "G/L Account";
        }
        field(22; "Maintenance Expense Account"; Code[20])
        {
            Caption = 'Maintenance Expense Account';
            TableRelation = "G/L Account";
        }
        field(23; "Maintenance Bal. Acc."; Code[20])
        {
            Caption = 'Maintenance Bal. Acc.';
            TableRelation = "G/L Account";
        }
        field(24; "Acquisition Cost Bal. Acc."; Code[20])
        {
            Caption = 'Acquisition Cost Bal. Acc.';
            TableRelation = "G/L Account";
        }
        field(25; "Depreciation Expense Acc."; Code[20])
        {
            Caption = 'Depreciation Expense Acc.';
            TableRelation = "G/L Account";
        }
        field(26; "Write-Down Expense Acc."; Code[20])
        {
            Caption = 'Write-Down Expense Acc.';
            TableRelation = "G/L Account";
        }
        field(27; "Appreciation Bal. Account"; Code[20])
        {
            Caption = 'Appreciation Bal. Account';
            TableRelation = "G/L Account";
        }
        field(28; "Custom 1 Expense Acc."; Code[20])
        {
            Caption = 'Custom 1 Expense Acc.';
            TableRelation = "G/L Account";
        }
        field(29; "Custom 2 Expense Acc."; Code[20])
        {
            Caption = 'Custom 2 Expense Acc.';
            TableRelation = "G/L Account";
        }
        field(30; "Sales Bal. Acc."; Code[20])
        {
            Caption = 'Sales Bal. Acc.';
            TableRelation = "G/L Account";
        }
        field(31; "Allocated Acquisition Cost %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Acquisition)));
            Caption = 'Allocated Acquisition Cost %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Allocated Depreciation %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Depreciation)));
            Caption = 'Allocated Depreciation %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Allocated Write-Down %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST ("Write-Down")));
            Caption = 'Allocated Write-Down %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Allocated Appreciation %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Appreciation)));
            Caption = 'Allocated Appreciation %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Allocated Custom 1 %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST ("Custom 1")));
            Caption = 'Allocated Custom 1 %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Allocated Custom 2 %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST ("Custom 2")));
            Caption = 'Allocated Custom 2 %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Allocated Sales Price %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Disposal)));
            Caption = 'Allocated Sales Price %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "Allocated Maintenance %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Maintenance)));
            Caption = 'Allocated Maintenance %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "Allocated Gain %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Gain)));
            Caption = 'Allocated Gain %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Allocated Loss %"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST (Loss)));
            Caption = 'Allocated Loss %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Allocated Book Value % (Gain)"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST ("Book Value (Gain)")));
            Caption = 'Allocated Book Value % (Gain)';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Allocated Book Value % (Loss)"; Decimal)
        {
            CalcFormula = Sum ("FA Allocation"."Allocation %" WHERE (Code = FIELD (Code),
                                                                    "Allocation Type" = CONST ("Book Value (Loss)")));
            Caption = 'Allocated Book Value % (Loss)';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Sales Acc. on Disp. (Loss)"; Code[20])
        {
            Caption = 'Sales Acc. on Disp. (Loss)';
            TableRelation = "G/L Account";
        }
        field(44; "Book Val. Acc. on Disp. (Loss)"; Code[20])
        {
            Caption = 'Book Val. Acc. on Disp. (Loss)';
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Code")
        {
        }
    }
}

