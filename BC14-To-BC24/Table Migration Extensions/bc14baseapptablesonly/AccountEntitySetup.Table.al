table 5481 "Account Entity Setup"
{
    Caption = 'Account Entity Setup';
    ObsoleteReason = 'Became obsolete after refactoring of the NAV APIs.';
    ObsoleteState = Pending;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Show Balance"; Boolean)
        {
            Caption = 'Show Balance';
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

