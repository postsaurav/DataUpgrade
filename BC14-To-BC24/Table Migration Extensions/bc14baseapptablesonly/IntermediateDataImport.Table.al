table 1214 "Intermediate Data Import"
{
    Caption = 'Intermediate Data Import';

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Data Exch. No."; Integer)
        {
            Caption = 'Data Exch. No.';
            NotBlank = true;
            TableRelation = "Data Exch.";
        }
        field(3; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(4; "Record No."; Integer)
        {
            Caption = 'Record No.';
        }
        field(5; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(6; Value; Text[250])
        {
            Caption = 'Value';
        }
        field(7; "Validate Only"; Boolean)
        {
            Caption = 'Validate Only';
        }
        field(8; "Parent Record No."; Integer)
        {
            Caption = 'Parent Record No.';
        }
        field(16; "Value BLOB"; BLOB)
        {
            Caption = 'Value BLOB';
        }
    }

    keys
    {
        key(Key1; ID)
        {
        }
        key(Key2; "Data Exch. No.", "Table ID", "Record No.", "Field ID")
        {
            Clustered = true;
        }
        key(Key3; "Data Exch. No.", "Table ID", "Field ID")
        {
        }
    }

    fieldgroups
    {
    }
}

