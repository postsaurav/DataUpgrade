table 99000770 "Manufacturing Comment Line"
{
    Caption = 'Manufacturing Comment Line';

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Work Center,Machine Center,Routing Header,Production BOM Header';
            OptionMembers = "Work Center","Machine Center","Routing Header","Production BOM Header";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF ("Table Name" = CONST ("Work Center")) "Work Center"
            ELSE
            IF ("Table Name" = CONST ("Machine Center")) "Machine Center"
            ELSE
            IF ("Table Name" = CONST ("Routing Header")) "Routing Header"
            ELSE
            IF ("Table Name" = CONST ("Production BOM Header")) "Production BOM Header";
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
        key(Key1; "Table Name", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

