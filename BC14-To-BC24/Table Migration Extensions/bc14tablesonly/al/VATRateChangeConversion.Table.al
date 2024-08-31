table 551 "VAT Rate Change Conversion"
{
    Caption = 'VAT Rate Change Conversion';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group";
        }
        field(2; "From Code"; Code[20])
        {
            Caption = 'From Code';
            NotBlank = true;
            TableRelation = IF (Type = CONST ("VAT Prod. Posting Group")) "VAT Product Posting Group"
            ELSE
            IF (Type = CONST ("Gen. Prod. Posting Group")) "Gen. Product Posting Group";
        }
        field(3; "To Code"; Code[20])
        {
            Caption = 'To Code';
            NotBlank = true;
            TableRelation = IF (Type = CONST ("VAT Prod. Posting Group")) "VAT Product Posting Group"
            ELSE
            IF (Type = CONST ("Gen. Prod. Posting Group")) "Gen. Product Posting Group";
        }
        field(10; "Converted Date"; Date)
        {
            Caption = 'Converted Date';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Type, "From Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

