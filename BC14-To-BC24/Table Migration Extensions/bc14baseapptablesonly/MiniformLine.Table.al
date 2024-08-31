table 7701 "Miniform Line"
{
    Caption = 'Miniform Line';

    fields
    {
        field(1; "Miniform Code"; Code[20])
        {
            Caption = 'Miniform Code';
            NotBlank = true;
            TableRelation = "Miniform Header".Code;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(11; "Area"; Option)
        {
            Caption = 'Area';
            OptionCaption = 'Header,Body,Footer', Locked = true;
            OptionMembers = Header,Body,Footer;
        }
        field(12; "Field Type"; Option)
        {
            Caption = 'Field Type';
            OptionCaption = 'Text,Input,Output,Asterisk', Locked = true;
            OptionMembers = Text,Input,Output,Asterisk;
        }
        field(13; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(14; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(15; Text; Text[30])
        {
            Caption = 'Text';
        }
        field(16; "Field Length"; Integer)
        {
            Caption = 'Field Length';
        }
        field(21; "Call Miniform"; Code[20])
        {
            Caption = 'Call Miniform';
            TableRelation = "Miniform Header";
        }
    }

    keys
    {
        key(Key1; "Miniform Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Area")
        {
        }
    }

    fieldgroups
    {
    }
}

