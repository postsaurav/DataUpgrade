table 225 "Post Code"
{
    Caption = 'Post Code';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; City; Text[30])
        {
            Caption = 'City';
            NotBlank = true;
        }
        field(3; "Search City"; Code[30])
        {
            Caption = 'Search City';
        }
        field(4; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(5; County; Text[30])
        {
            Caption = 'County';
        }
        field(30; "Time Zone"; Text[180])
        {
            Caption = 'Time Zone';
        }
    }

    keys
    {
        key(Key1; "Code", City)
        {
            Clustered = true;
        }
        key(Key2; City, "Code")
        {
        }
        key(Key3; "Search City")
        {
        }
        key(Key4; "Country/Region Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", City, "Country/Region Code", County)
        {
        }
        fieldgroup(Brick; "Code", City, County, "Country/Region Code")
        {
        }
    }
}

