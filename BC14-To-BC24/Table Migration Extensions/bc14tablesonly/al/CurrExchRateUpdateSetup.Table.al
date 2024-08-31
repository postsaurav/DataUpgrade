table 1650 "Curr. Exch. Rate Update Setup"
{
    Caption = 'Curr. Exch. Rate Update Setup';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Web Service URL"; BLOB)
        {
            Caption = 'Service URL';
        }
        field(5; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(10; "Service Provider"; Text[30])
        {
            Caption = 'Service Provider';
        }
        field(11; "Terms of Service"; Text[250])
        {
            Caption = 'Terms of Service';
            ExtendedDatatype = URL;
        }
        field(20; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            TableRelation = "Data Exch. Def".Code;
        }
        field(21; "Log Web Requests"; Boolean)
        {
            Caption = 'Log Web Requests';
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

