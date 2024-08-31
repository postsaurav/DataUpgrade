table 725 "Custom Address Format"
{
    Caption = 'Custom Address Format';

    fields
    {
        field(1; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(2; "Line Position"; Option)
        {
            Caption = 'Line Position';
            OptionCaption = '1,2,3,4,5,6,7,8';
            OptionMembers = "1","2","3","4","5","6","7","8";
        }
        field(3; "Line Format"; Text[80])
        {
            Caption = 'Line Format';
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(5; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = SystemMetadata;
            TableRelation = Field."No." WHERE (TableNo = CONST (79),
                                               "No." = FILTER (2 | 3 | 4 | 5 | 6 | 30 | 31 | 36 | 51));
        }
    }

    keys
    {
        key(Key1; "Country/Region Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Country/Region Code", "Line Position")
        {
        }
    }

    fieldgroups
    {
    }
}

