table 394 "XBRL Taxonomy"
{
    Caption = 'XBRL Taxonomy';

    fields
    {
        field(1; Name; Code[20])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "xmlns:xbrli"; Text[250])
        {
            Caption = 'xmlns:xbrli';
        }
        field(4; targetNamespace; Text[250])
        {
            Caption = 'targetNamespace';
        }
        field(5; schemaLocation; Text[250])
        {
            Caption = 'schemaLocation';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

