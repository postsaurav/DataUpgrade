table 1221 "Data Exch. Field"
{
    Caption = 'Data Exch. Field';
    Permissions = TableData "Data Exch. Field" = rimd;

    fields
    {
        field(1; "Data Exch. No."; Integer)
        {
            Caption = 'Data Exch. No.';
            NotBlank = true;
            TableRelation = "Data Exch.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            NotBlank = true;
        }
        field(3; "Column No."; Integer)
        {
            Caption = 'Column No.';
            NotBlank = true;
        }
        field(4; Value; Text[250])
        {
            Caption = 'Value';
        }
        field(5; "Node ID"; Text[250])
        {
            Caption = 'Node ID';
        }
        field(6; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
            TableRelation = "Data Exch. Line Def".Code;
        }
        field(10; "Parent Node ID"; Text[250])
        {
            Caption = 'Parent Node ID';
        }
        field(11; "Data Exch. Def Code"; Code[20])
        {
            CalcFormula = Lookup ("Data Exch."."Data Exch. Def Code" WHERE ("Entry No." = FIELD ("Data Exch. No.")));
            Caption = 'Data Exch. Def Code';
            FieldClass = FlowField;
        }
        field(16; "Value BLOB"; BLOB)
        {
            Caption = 'Value BLOB';
        }
    }

    keys
    {
        key(Key1; "Data Exch. No.", "Line No.", "Column No.", "Node ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

