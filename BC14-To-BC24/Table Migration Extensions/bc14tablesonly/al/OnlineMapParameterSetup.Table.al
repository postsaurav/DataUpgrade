table 801 "Online Map Parameter Setup"
{
    Caption = 'Online Map Parameter Setup';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; "Map Service"; Text[250])
        {
            Caption = 'Map Service';
        }
        field(4; "Directions Service"; Text[250])
        {
            Caption = 'Directions Service';
        }
        field(5; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        field(6; "URL Encode Non-ASCII Chars"; Boolean)
        {
            Caption = 'URL Encode Non-ASCII Chars';
        }
        field(7; "Miles/Kilometers Option List"; Text[250])
        {
            Caption = 'Miles/Kilometers Option List';
        }
        field(8; "Quickest/Shortest Option List"; Text[250])
        {
            Caption = 'Quickest/Shortest Option List';
        }
        field(9; "Directions from Location Serv."; Text[250])
        {
            Caption = 'Directions from Location Serv.';
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
        fieldgroup(DropDown; "Code", Name)
        {
        }
    }
}

