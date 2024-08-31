table 9600 "XML Schema"
{
    Caption = 'XML Schema';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(3; "Target Namespace"; Text[250])
        {
            Caption = 'Target Namespace';
        }
        field(4; XSD; BLOB)
        {
            Caption = 'XSD';
        }
        field(6; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
        field(7; Path; Text[250])
        {
            Caption = 'Path';
        }
        field(10; "Target Namespace Aliases"; Text[250])
        {
            Caption = 'Target Namespace Aliases';
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

