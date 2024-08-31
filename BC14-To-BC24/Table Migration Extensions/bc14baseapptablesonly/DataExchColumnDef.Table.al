table 1223 "Data Exch. Column Def"
{
    Caption = 'Data Exch. Column Def';

    fields
    {
        field(1; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Def";
        }
        field(2; "Column No."; Integer)
        {
            Caption = 'Column No.';
            MinValue = 1;
            NotBlank = true;
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(4; Show; Boolean)
        {
            Caption = 'Show';
        }
        field(5; "Data Type"; Option)
        {
            Caption = 'Data Type';
            OptionCaption = 'Text,Date,Decimal,DateTime';
            OptionMembers = Text,Date,Decimal,DateTime;
        }
        field(6; "Data Format"; Text[100])
        {
            Caption = 'Data Format';
        }
        field(7; "Data Formatting Culture"; Text[10])
        {
            Caption = 'Data Formatting Culture';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Line Def".Code WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"));
        }
        field(11; Length; Integer)
        {
            Caption = 'Length';
        }
        field(12; Constant; Text[30])
        {
            Caption = 'Constant';
        }
        field(13; Path; Text[250])
        {
            Caption = 'Path';
        }
        field(14; "Negative-Sign Identifier"; Text[30])
        {
            Caption = 'Negative-Sign Identifier';
        }
        field(15; "Text Padding Required"; Boolean)
        {
            Caption = 'Text Padding Required';
        }
        field(16; "Pad Character"; Text[1])
        {
            Caption = 'Pad Character';
        }
        field(17; Justification; Option)
        {
            Caption = 'Justification';
            OptionCaption = 'Right,Left';
            OptionMembers = Right,Left;
        }
        field(18; "Use Node Name as Value"; Boolean)
        {
            Caption = 'Use Node Name as Value';
        }
    }

    keys
    {
        key(Key1; "Data Exch. Def Code", "Data Exch. Line Def Code", "Column No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

