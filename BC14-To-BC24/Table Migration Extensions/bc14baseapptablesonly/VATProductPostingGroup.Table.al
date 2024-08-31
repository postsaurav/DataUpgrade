table 324 "VAT Product Posting Group"
{
    Caption = 'VAT Product Posting Group';
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
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8005; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
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
        fieldgroup(Brick; Description)
        {
        }
    }
}

