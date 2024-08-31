table 980 "Payment Registration Setup"
{
    Caption = 'Payment Registration Setup';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(3; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(4; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = ' ,G/L Account,Bank Account';
            OptionMembers = " ","G/L Account","Bank Account";
        }
        field(5; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account";
        }
        field(6; "Use this Account as Def."; Boolean)
        {
            Caption = 'Use this Account as Def.';
            InitValue = true;
        }
        field(7; "Auto Fill Date Received"; Boolean)
        {
            Caption = 'Auto Fill Date Received';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

