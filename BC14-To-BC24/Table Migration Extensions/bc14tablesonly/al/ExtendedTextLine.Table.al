table 280 "Extended Text Line"
{
    Caption = 'Extended Text Line';

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Standard Text,G/L Account,Item,Resource';
            OptionMembers = "Standard Text","G/L Account",Item,Resource;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF ("Table Name" = CONST ("Standard Text")) "Standard Text"
            ELSE
            IF ("Table Name" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Table Name" = CONST (Item)) Item
            ELSE
            IF ("Table Name" = CONST (Resource)) Resource;
        }
        field(3; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(4; "Text No."; Integer)
        {
            Caption = 'Text No.';
        }
        field(5; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(6; Text; Text[100])
        {
            Caption = 'Text';
        }
    }

    keys
    {
        key(Key1; "Table Name", "No.", "Language Code", "Text No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

