table 130416 "Semi-Manual Execution Log"
{
    Caption = 'Semi-Manual Execution Log';
    ReplicateData = false;

    fields
    {
        field(1; "Time stamp"; DateTime)
        {
            Caption = 'Time stamp';
        }
        field(2; "Step description 1"; Text[250])
        {
            Caption = 'Step description 1';
        }
        field(3; "Step description 2"; Text[250])
        {
            Caption = 'Step description 2';
        }
        field(4; "Step description 3"; Text[250])
        {
            Caption = 'Step description 3';
        }
        field(5; "Step description 4"; Text[250])
        {
            Caption = 'Step description 4';
        }
        field(6; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

