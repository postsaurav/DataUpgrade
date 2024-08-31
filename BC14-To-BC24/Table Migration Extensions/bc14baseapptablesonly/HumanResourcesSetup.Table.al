table 5218 "Human Resources Setup"
{
    Caption = 'Human Resources Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Employee Nos."; Code[20])
        {
            Caption = 'Employee Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Human Resource Unit of Measure";
        }
        field(4; "Automatically Create Resource"; Boolean)
        {
            Caption = 'Automatically Create Resource';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

