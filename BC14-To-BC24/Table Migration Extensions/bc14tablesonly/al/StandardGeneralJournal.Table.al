table 750 "Standard General Journal"
{
    Caption = 'Standard General Journal';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

