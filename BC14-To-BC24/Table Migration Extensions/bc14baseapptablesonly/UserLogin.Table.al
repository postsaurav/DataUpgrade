table 9008 "User Login"
{
    Caption = 'User Login';
    Permissions = TableData "User Login" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "User SID"; Guid)
        {
            Caption = 'User SID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(2; "First Login Date"; Date)
        {
            Caption = 'First Login Date';
        }
        field(3; "Penultimate Login Date"; DateTime)
        {
            Caption = 'Penultimate Login Date';
            DataClassification = CustomerContent;
        }
        field(4; "Last Login Date"; DateTime)
        {
            Caption = 'Last Login Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "User SID")
        {
            Clustered = true;
        }
        key(Key2; "Last Login Date")
        {
        }
    }

    fieldgroups
    {
    }
}

