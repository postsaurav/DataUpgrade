table 1014 "Job G/L Account Price"
{
    Caption = 'Job G/L Account Price';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            NotBlank = true;
            TableRelation = Job;
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(5; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
        }
        field(6; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(7; "Unit Cost Factor"; Decimal)
        {
            Caption = 'Unit Cost Factor';
        }
        field(8; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(10; Description; Text[100])
        {
            CalcFormula = Lookup ("G/L Account".Name WHERE ("No." = FIELD ("G/L Account No.")));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.", "G/L Account No.", "Currency Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

