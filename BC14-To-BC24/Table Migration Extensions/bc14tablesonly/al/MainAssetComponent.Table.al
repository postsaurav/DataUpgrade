table 5640 "Main Asset Component"
{
    Caption = 'Main Asset Component';

    fields
    {
        field(1; "Main Asset No."; Code[20])
        {
            Caption = 'Main Asset No.';
            Editable = false;
            NotBlank = true;
            TableRelation = "Fixed Asset";
        }
        field(3; "FA No."; Code[20])
        {
            Caption = 'FA No.';
            NotBlank = true;
            TableRelation = "Fixed Asset";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Main Asset No.", "FA No.")
        {
            Clustered = true;
        }
        key(Key2; "FA No.")
        {
        }
    }

    fieldgroups
    {
    }
}

