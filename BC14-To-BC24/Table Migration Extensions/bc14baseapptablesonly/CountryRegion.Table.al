table 9 "Country/Region"
{
    Caption = 'Country/Region';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; "ISO Code"; Code[2])
        {
            Caption = 'ISO Code';
            DataClassification = CustomerContent;
        }
        field(5; "ISO Numeric Code"; Code[3])
        {
            Caption = 'ISO Numeric Code';
            DataClassification = CustomerContent;
        }
        field(6; "EU Country/Region Code"; Code[10])
        {
            Caption = 'EU Country/Region Code';
        }
        field(7; "Intrastat Code"; Code[10])
        {
            Caption = 'Intrastat Code';
        }
        field(8; "Address Format"; Option)
        {
            Caption = 'Address Format';
            InitValue = "City+Post Code";
            OptionCaption = 'Post Code+City,City+Post Code,City+County+Post Code,Blank Line+Post Code+City,,,,,,,,,,Custom';
            OptionMembers = "Post Code+City","City+Post Code","City+County+Post Code","Blank Line+Post Code+City",,,,,,,,,,Custom;
        }
        field(9; "Contact Address Format"; Option)
        {
            Caption = 'Contact Address Format';
            InitValue = "After Company Name";
            OptionCaption = 'First,After Company Name,Last';
            OptionMembers = First,"After Company Name",Last;
        }
        field(10; "VAT Scheme"; Code[10])
        {
            Caption = 'VAT Scheme';
        }
        field(11; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(12; "County Name"; Text[30])
        {
            Caption = 'County Name';
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
        key(Key2; "EU Country/Region Code")
        {
        }
        key(Key3; "Intrastat Code")
        {
        }
        key(Key4; Name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Code", Name, "VAT Scheme")
        {
        }
    }
}

