table 1800 "Data Migrator Registration"
{
    Caption = 'Data Migrator Registration';
    ReplicateData = false;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

