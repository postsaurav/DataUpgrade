table 726 "Custom Address Format Line"
{
    Caption = 'Custom Address Format Line';

    fields
    {
        field(1; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
        }
        field(3; "Field Position"; Option)
        {
            Caption = 'Field Position';
            DataClassification = SystemMetadata;
            OptionCaption = '1,2,3';
            OptionMembers = "1","2","3";
        }
        field(4; Separator; Text[10])
        {
            Caption = 'Separator';
            DataClassification = SystemMetadata;
        }
        field(5; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = SystemMetadata;
            TableRelation = Field."No." WHERE (TableNo = CONST (79),
                                               "No." = FILTER (2 | 3 | 4 | 5 | 6 | 30 | 31 | 36 | 51));
        }
        field(6; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            DataClassification = SystemMetadata;
        }
        field(7; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Country/Region Code", "Line No.", "Field ID")
        {
            Clustered = true;
        }
        key(Key2; "Country/Region Code", "Line No.", "Field Position")
        {
        }
    }

    fieldgroups
    {
    }
}

