table 471 "Job Queue Category"
{
    Caption = 'Job Queue Category';
    DataCaptionFields = "Code", Description;
    Permissions = TableData "Job Queue Category" = rimd;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
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
    }
}

