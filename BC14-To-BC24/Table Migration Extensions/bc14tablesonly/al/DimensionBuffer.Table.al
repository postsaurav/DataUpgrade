table 360 "Dimension Buffer"
{
    Caption = 'Dimension Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(4; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(5; "New Dimension Value Code"; Code[20])
        {
            Caption = 'New Dimension Value Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(7; "No. Of Dimensions"; Integer)
        {
            Caption = 'No. Of Dimensions';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Table ID", "Entry No.", "Dimension Code")
        {
            Clustered = true;
        }
        key(Key2; "No. Of Dimensions")
        {
        }
    }

    fieldgroups
    {
    }
}

