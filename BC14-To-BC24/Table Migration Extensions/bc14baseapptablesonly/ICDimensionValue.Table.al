table 412 "IC Dimension Value"
{
    Caption = 'IC Dimension Value';

    fields
    {
        field(1; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            NotBlank = true;
            TableRelation = "IC Dimension";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; "Dimension Value Type"; Option)
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension Value Type';
            OptionCaption = 'Standard,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Standard,Heading,Total,"Begin-Total","End-Total";
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; "Map-to Dimension Code"; Code[20])
        {
            Caption = 'Map-to Dimension Code';
            TableRelation = Dimension.Code;
        }
        field(7; "Map-to Dimension Value Code"; Code[20])
        {
            Caption = 'Map-to Dimension Value Code';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Map-to Dimension Code"));
        }
        field(8; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
    }

    keys
    {
        key(Key1; "Dimension Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

