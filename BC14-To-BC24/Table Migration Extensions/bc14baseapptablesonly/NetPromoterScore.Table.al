table 1433 "Net Promoter Score"
{
    Caption = 'Net Promoter Score';
    DataPerCompany = false;

    fields
    {
        field(1; "User SID"; Guid)
        {
            Caption = 'User SID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(4; "Last Request Time"; DateTime)
        {
            Caption = 'Last Request Time';
        }
        field(5; "Send Request"; Boolean)
        {
            Caption = 'Send Request';
        }
    }

    keys
    {
        key(Key1; "User SID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

