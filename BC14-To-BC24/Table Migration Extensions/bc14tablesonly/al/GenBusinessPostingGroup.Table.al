table 250 "Gen. Business Posting Group"
{
    Caption = 'Gen. Business Posting Group';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Def. VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Def. VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(4; "Auto Insert Default"; Boolean)
        {
            Caption = 'Auto Insert Default';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Code", Description, "Def. VAT Bus. Posting Group")
        {
        }
    }
}

