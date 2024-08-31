table 368 "Dimension Selection Buffer"
{
    Caption = 'Dimension Selection Buffer';
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
            TableRelation = IF (Code = CONST ('G/L Account')) "G/L Account"."No."
            ELSE
            IF (Code = CONST ('Business Unit')) "Business Unit".Code
            ELSE
            "Dimension Value".Code WHERE ("Dimension Code" = FIELD (Code));
        }
        field(5; "Dimension Value Filter"; Code[250])
        {
            Caption = 'Dimension Value Filter';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Filter Lookup Table No." = CONST (15)) "G/L Account"."No."
            ELSE
            IF ("Filter Lookup Table No." = CONST (220)) "Business Unit".Code
            ELSE
            IF ("Filter Lookup Table No." = CONST (841)) "Cash Flow Account"."No."
            ELSE
            IF ("Filter Lookup Table No." = CONST (840)) "Cash Flow Forecast"."No."
            ELSE
            "Dimension Value".Code WHERE ("Dimension Code" = FIELD (Code));
            ValidateTableRelation = false;
        }
        field(6; Level; Option)
        {
            Caption = 'Level';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Level 1,Level 2,Level 3,Level 4';
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4";
        }
        field(7; "Filter Lookup Table No."; Integer)
        {
            Caption = 'Filter Lookup Table No.';
            DataClassification = SystemMetadata;
            Editable = false;
            InitValue = 349;
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

