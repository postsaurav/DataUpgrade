table 5605 "FA Journal Setup"
{
    Caption = 'FA Journal Setup';

    fields
    {
        field(1; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            NotBlank = true;
            TableRelation = "Depreciation Book";
        }
        field(2; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(3; "FA Jnl. Template Name"; Code[10])
        {
            Caption = 'FA Jnl. Template Name';
            Editable = true;
            TableRelation = "FA Journal Template";
        }
        field(4; "FA Jnl. Batch Name"; Code[10])
        {
            Caption = 'FA Jnl. Batch Name';
            TableRelation = "FA Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("FA Jnl. Template Name"));
        }
        field(5; "Gen. Jnl. Template Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(6; "Gen. Jnl. Batch Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Gen. Jnl. Template Name"));
        }
        field(7; "Insurance Jnl. Template Name"; Code[10])
        {
            Caption = 'Insurance Jnl. Template Name';
            TableRelation = "Insurance Journal Template";
        }
        field(8; "Insurance Jnl. Batch Name"; Code[10])
        {
            Caption = 'Insurance Jnl. Batch Name';
            TableRelation = "Insurance Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Insurance Jnl. Template Name"));
        }
    }

    keys
    {
        key(Key1; "Depreciation Book Code", "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

