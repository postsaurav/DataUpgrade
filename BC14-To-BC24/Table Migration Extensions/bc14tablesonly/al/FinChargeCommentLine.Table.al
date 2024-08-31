table 306 "Fin. Charge Comment Line"
{
    Caption = 'Fin. Charge Comment Line';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Finance Charge Memo,Issued Finance Charge Memo';
            OptionMembers = "Finance Charge Memo","Issued Finance Charge Memo";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF (Type = CONST ("Finance Charge Memo")) "Finance Charge Memo Header"
            ELSE
            IF (Type = CONST ("Issued Finance Charge Memo")) "Issued Fin. Charge Memo Header";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; Type, "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

