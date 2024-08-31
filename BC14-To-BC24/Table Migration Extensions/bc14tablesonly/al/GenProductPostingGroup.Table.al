table 251 "Gen. Product Posting Group"
{
    Caption = 'Gen. Product Posting Group';
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
        field(3; "Def. VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'Def. VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
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
        fieldgroup(Brick; "Code", Description, "Def. VAT Prod. Posting Group")
        {
        }
    }
}

