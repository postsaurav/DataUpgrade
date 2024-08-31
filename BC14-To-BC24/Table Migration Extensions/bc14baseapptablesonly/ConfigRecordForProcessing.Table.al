table 8632 "Config. Record For Processing"
{
    Caption = 'Config. Record For Processing';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(3; "Rule No."; Integer)
        {
            Caption = 'Rule No.';
        }
        field(4; "Record No."; Integer)
        {
            Caption = 'Record No.';
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Rule No.", "Record No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

