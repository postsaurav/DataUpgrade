table 560 "VAT Clause"
{
    Caption = 'VAT Clause';

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
        field(3; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
        }
        field(10; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
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

