table 9805 "Table Filter"
{
    Caption = 'Table Filter';

    fields
    {
        field(1; "Table Number"; Integer)
        {
            Caption = 'Table Number';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Table Name"; Text[30])
        {
            Caption = 'Table Name';
        }
        field(5; "Field Number"; Integer)
        {
            Caption = 'Field Number';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table Number"));
        }
        field(6; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
        }
        field(7; "Field Caption"; Text[80])
        {
            Caption = 'Field Caption';
        }
        field(8; "Field Filter"; Text[250])
        {
            Caption = 'Field Filter';
        }
    }

    keys
    {
        key(Key1; "Table Number", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

