table 1220 "Data Exch."
{
    Caption = 'Data Exch.';
    Permissions = TableData "Data Exch." = i,
                  TableData "Data Exch. Field" = rimd;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "File Name"; Text[250])
        {
            Caption = 'File Name';
        }
        field(3; "File Content"; BLOB)
        {
            Caption = 'File Content';
        }
        field(4; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            TableRelation = "Data Exch. Def";
        }
        field(5; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
            TableRelation = "Data Exch. Line Def".Code WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"));
        }
        field(6; "Table Filters"; BLOB)
        {
            Caption = 'Table Filters';
        }
        field(10; "Incoming Entry No."; Integer)
        {
            Caption = 'Incoming Entry No.';
            TableRelation = "Incoming Document";
        }
        field(11; "Related Record"; RecordID)
        {
            Caption = 'Related Record';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Data Exch. Def Code")
        {
        }
    }

    fieldgroups
    {
    }
}

