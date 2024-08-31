table 130415 "Semi-Manual Test Wizard"
{
    Caption = 'Semi-Manual Test Wizard';
    ReplicateData = false;

    fields
    {
        field(1; "Codeunit number"; Integer)
        {
            BlankZero = true;
            Caption = 'Codeunit number';
        }
        field(2; "Codeunit name"; Text[250])
        {
            Caption = 'Codeunit name';
        }
        field(3; "Step number"; Integer)
        {
            Caption = 'Step number';
        }
        field(4; "Step heading"; Text[250])
        {
            Caption = 'Step heading';
        }
        field(5; "Manual detailed steps"; BLOB)
        {
            Caption = 'Manual detailed steps';
        }
        field(6; "Total steps"; Integer)
        {
            Caption = 'Total steps';
        }
        field(7; "Skip current step"; Boolean)
        {
            Caption = 'Skip current step';
        }
    }

    keys
    {
        key(Key1; "Codeunit name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

