table 1227 "Data Exch. Line Def"
{
    Caption = 'Data Exch. Line Def';

    fields
    {
        field(1; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Def".Code;
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Column Count"; Integer)
        {
            Caption = 'Column Count';
        }
        field(5; "Data Line Tag"; Text[250])
        {
            Caption = 'Data Line Tag';
        }
        field(6; Namespace; Text[250])
        {
            Caption = 'Namespace';
        }
        field(10; "Parent Code"; Code[20])
        {
            Caption = 'Parent Code';
            TableRelation = "Data Exch. Line Def".Code WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"));
        }
        field(11; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Detail,Header,Footer';
            OptionMembers = Detail,Header,Footer;
        }
    }

    keys
    {
        key(Key1; "Data Exch. Def Code", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Data Exch. Def Code", "Parent Code")
        {
        }
    }

    fieldgroups
    {
    }
}

