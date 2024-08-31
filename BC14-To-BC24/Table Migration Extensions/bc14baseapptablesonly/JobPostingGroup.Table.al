table 208 "Job Posting Group"
{
    Caption = 'Job Posting Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "WIP Costs Account"; Code[20])
        {
            Caption = 'WIP Costs Account';
            TableRelation = "G/L Account";
        }
        field(3; "WIP Accrued Costs Account"; Code[20])
        {
            Caption = 'WIP Accrued Costs Account';
            TableRelation = "G/L Account";
        }
        field(4; "Job Costs Applied Account"; Code[20])
        {
            Caption = 'Job Costs Applied Account';
            TableRelation = "G/L Account";
        }
        field(5; "Job Costs Adjustment Account"; Code[20])
        {
            Caption = 'Job Costs Adjustment Account';
            TableRelation = "G/L Account";
        }
        field(6; "G/L Expense Acc. (Contract)"; Code[20])
        {
            Caption = 'G/L Expense Acc. (Contract)';
            TableRelation = "G/L Account";
        }
        field(7; "Job Sales Adjustment Account"; Code[20])
        {
            Caption = 'Job Sales Adjustment Account';
            TableRelation = "G/L Account";
        }
        field(8; "WIP Accrued Sales Account"; Code[20])
        {
            Caption = 'WIP Accrued Sales Account';
            TableRelation = "G/L Account";
        }
        field(9; "WIP Invoiced Sales Account"; Code[20])
        {
            Caption = 'WIP Invoiced Sales Account';
            TableRelation = "G/L Account";
        }
        field(10; "Job Sales Applied Account"; Code[20])
        {
            Caption = 'Job Sales Applied Account';
            TableRelation = "G/L Account";
        }
        field(11; "Recognized Costs Account"; Code[20])
        {
            Caption = 'Recognized Costs Account';
            TableRelation = "G/L Account";
        }
        field(12; "Recognized Sales Account"; Code[20])
        {
            Caption = 'Recognized Sales Account';
            TableRelation = "G/L Account";
        }
        field(13; "Item Costs Applied Account"; Code[20])
        {
            Caption = 'Item Costs Applied Account';
            TableRelation = "G/L Account";
        }
        field(14; "Resource Costs Applied Account"; Code[20])
        {
            Caption = 'Resource Costs Applied Account';
            TableRelation = "G/L Account";
        }
        field(15; "G/L Costs Applied Account"; Code[20])
        {
            Caption = 'G/L Costs Applied Account';
            TableRelation = "G/L Account";
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
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

