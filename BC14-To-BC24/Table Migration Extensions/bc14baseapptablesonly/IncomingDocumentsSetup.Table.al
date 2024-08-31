table 131 "Incoming Documents Setup"
{
    Caption = 'Incoming Documents Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "General Journal Template Name"; Code[10])
        {
            Caption = 'General Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(3; "General Journal Batch Name"; Code[10])
        {
            Caption = 'General Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("General Journal Template Name"));
        }
        field(5; "Require Approval To Create"; Boolean)
        {
            Caption = 'Require Approval To Create';
        }
        field(6; "Require Approval To Post"; Boolean)
        {
            Caption = 'Require Approval To Post';
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

