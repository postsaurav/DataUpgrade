table 7702 "Miniform Function Group"
{
    Caption = 'Miniform Function Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(11; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(20; KeyDef; Option)
        {
            Caption = 'KeyDef';
            OptionCaption = 'Input,Esc,First,Last,Code,PgUp,PgDn,LnUp,LnDn,Reset,Register', Locked = true;
            OptionMembers = Input,Esc,First,Last,"Code",PgUp,PgDn,LnUp,LnDn,Reset,Register;
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

