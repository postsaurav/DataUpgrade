table 1312 "Trial Balance Setup"
{
    Caption = 'Trial Balance Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Account Schedule Name"; Code[10])
        {
            Caption = 'Account Schedule Name';
            NotBlank = true;
            TableRelation = "Acc. Schedule Name".Name;
        }
        field(3; "Column Layout Name"; Code[10])
        {
            Caption = 'Column Layout Name';
            NotBlank = true;
            TableRelation = "Column Layout Name".Name;
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

