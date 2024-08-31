table 7700 "Miniform Header"
{
    Caption = 'Miniform Header';

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
        field(12; "No. of Records in List"; Integer)
        {
            Caption = 'No. of Records in List';
        }
        field(13; "Form Type"; Option)
        {
            Caption = 'Form Type';
            OptionCaption = 'Card,Selection List,Data List,Data List Input', Locked = true;
            OptionMembers = Card,"Selection List","Data List","Data List Input";
        }
        field(15; "Start Miniform"; Boolean)
        {
            Caption = 'Start Miniform';
        }
        field(20; "Handling Codeunit"; Integer)
        {
            Caption = 'Handling Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(21; "Next Miniform"; Code[20])
        {
            Caption = 'Next Miniform';
            TableRelation = "Miniform Header";
        }
        field(25; XMLin; BLOB)
        {
            Caption = 'XMLin';
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

