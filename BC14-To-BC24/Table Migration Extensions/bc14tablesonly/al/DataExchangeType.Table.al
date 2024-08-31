table 1213 "Data Exchange Type"
{
    Caption = 'Data Exchange Type';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Data Exch. Def. Code"; Code[20])
        {
            Caption = 'Data Exch. Def. Code';
            TableRelation = "Data Exch. Def".Code;
        }
        field(4; "Entity Type"; Option)
        {
            Caption = 'Entity Type';
            OptionCaption = 'Invoice,Credit Memo';
            OptionMembers = Invoice,"Credit Memo";
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

