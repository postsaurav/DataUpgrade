table 7158 "Analysis Dim. Selection Buffer"
{
    Caption = 'Analysis Dim. Selection Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Text[30])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(3; Selected; Boolean)
        {
            Caption = 'Selected';
            DataClassification = SystemMetadata;
        }
        field(4; "New Dimension Value Code"; Code[20])
        {
            Caption = 'New Dimension Value Code';
            DataClassification = SystemMetadata;
            TableRelation = IF (Code = CONST ('Item')) Item."No."
            ELSE
            IF (Code = CONST ('Location')) Location.Code
            ELSE
            "Dimension Value".Code WHERE ("Dimension Code" = FIELD (Code));
        }
        field(5; "Dimension Value Filter"; Code[250])
        {
            Caption = 'Dimension Value Filter';
            DataClassification = SystemMetadata;
            TableRelation = IF (Code = CONST ('Item')) Item."No."
            ELSE
            IF (Code = CONST ('Location')) Location.Code
            ELSE
            "Dimension Value".Code WHERE ("Dimension Code" = FIELD (Code));
            ValidateTableRelation = false;
        }
        field(6; Level; Option)
        {
            Caption = 'Level';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Level 1,Level 2,Level 3';
            OptionMembers = " ","Level 1","Level 2","Level 3";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Level, "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

