table 1237 "Transformation Rule"
{
    Caption = 'Transformation Rule';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Transformation Type"; Option)
        {
            Caption = 'Transformation Type';
            OptionCaption = 'Uppercase,Lowercase,Title Case,Trim,Substring,Replace,Regular Expression - Replace,Remove Non-Alphanumeric Characters,Date Formatting,Decimal Formatting,Regular Expression - Match,Custom,Date and Time Formatting';
            OptionMembers = Uppercase,Lowercase,"Title Case",Trim,Substring,Replace,"Regular Expression - Replace","Remove Non-Alphanumeric Characters","Date Formatting","Decimal Formatting","Regular Expression - Match",Custom,"Date and Time Formatting";
        }
        field(10; "Find Value"; Text[250])
        {
            Caption = 'Find Value';
        }
        field(11; "Replace Value"; Text[250])
        {
            Caption = 'Replace Value';
        }
        field(12; "Starting Text"; Text[250])
        {
            Caption = 'Starting Text';
        }
        field(13; "Ending Text"; Text[250])
        {
            Caption = 'Ending Text';
        }
        field(15; "Start Position"; Integer)
        {
            BlankZero = true;
            Caption = 'Start Position';
        }
        field(16; Length; Integer)
        {
            BlankZero = true;
            Caption = 'Length';
        }
        field(18; "Data Format"; Text[100])
        {
            Caption = 'Data Format';
        }
        field(20; "Data Formatting Culture"; Text[10])
        {
            Caption = 'Data Formatting Culture';
        }
        field(30; "Next Transformation Rule"; Code[20])
        {
            Caption = 'Next Transformation Rule';
            TableRelation = "Transformation Rule".Code;
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

