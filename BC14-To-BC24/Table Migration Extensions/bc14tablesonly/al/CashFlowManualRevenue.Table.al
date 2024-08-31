table 849 "Cash Flow Manual Revenue"
{
    Caption = 'Cash Flow Manual Revenue';

    fields
    {
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; "Cash Flow Account No."; Code[20])
        {
            Caption = 'Cash Flow Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(6; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(7; "Recurring Frequency"; DateFormula)
        {
            Caption = 'Recurring Frequency';
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Starting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

