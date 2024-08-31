table 1224 "Data Exch. Mapping"
{
    Caption = 'Data Exch. Mapping';

    fields
    {
        field(1; "Data Exch. Def Code"; Code[20])
        {
            Caption = 'Data Exch. Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Def";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(4; "Mapping Codeunit"; Integer)
        {
            Caption = 'Mapping Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(6; "Data Exch. No. Field ID"; Integer)
        {
            Caption = 'Data Exch. No. Field ID';
            Description = 'The ID of the field in the target table that contains the Data Exchange No..';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(7; "Data Exch. Line Field ID"; Integer)
        {
            Caption = 'Data Exch. Line Field ID';
            Description = 'The ID of the field in the target table that contains the Data Exchange Line No..';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(8; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
            NotBlank = true;
            TableRelation = "Data Exch. Line Def".Code WHERE ("Data Exch. Def Code" = FIELD ("Data Exch. Def Code"));
        }
        field(9; "Pre-Mapping Codeunit"; Integer)
        {
            Caption = 'Pre-Mapping Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(10; "Post-Mapping Codeunit"; Integer)
        {
            Caption = 'Post-Mapping Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(20; "Use as Intermediate Table"; Boolean)
        {
            Caption = 'Use as Intermediate Table';
        }
    }

    keys
    {
        key(Key1; "Data Exch. Def Code", "Data Exch. Line Def Code", "Table ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

