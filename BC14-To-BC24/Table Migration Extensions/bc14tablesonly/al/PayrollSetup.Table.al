table 1660 "Payroll Setup"
{
    Caption = 'Payroll Setup';

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Primary Key';
        }
        field(2; "General Journal Template Name"; Code[10])
        {
            Caption = 'General Journal Template Name';
            TableRelation = "Gen. Journal Template" WHERE (Type = FILTER (General),
                                                           Recurring = CONST (false));
        }
        field(3; "General Journal Batch Name"; Code[10])
        {
            Caption = 'General Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("General Journal Template Name"));
        }
        field(10; "User Name"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
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

