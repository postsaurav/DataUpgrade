table 9186 "Generic Chart Memo Buffer"
{
    Caption = 'Generic Chart Memo Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(2; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = Language.Code;
        }
        field(4; "Language Name"; Text[50])
        {
            CalcFormula = Lookup (Language.Name WHERE (Code = FIELD ("Language Code")));
            Caption = 'Language Name';
            FieldClass = FlowField;
        }
        field(11; Memo1; Text[250])
        {
            Caption = 'Memo1';
            DataClassification = SystemMetadata;
        }
        field(12; Memo2; Text[250])
        {
            Caption = 'Memo2';
            DataClassification = SystemMetadata;
        }
        field(13; Memo3; Text[250])
        {
            Caption = 'Memo3';
            DataClassification = SystemMetadata;
        }
        field(14; Memo4; Text[250])
        {
            Caption = 'Memo4';
            DataClassification = SystemMetadata;
        }
        field(15; Memo5; Text[250])
        {
            Caption = 'Memo5';
            DataClassification = SystemMetadata;
        }
        field(16; Memo6; Text[250])
        {
            Caption = 'Memo6';
            DataClassification = SystemMetadata;
        }
        field(17; Memo7; Text[250])
        {
            Caption = 'Memo7';
            DataClassification = SystemMetadata;
        }
        field(18; Memo8; Text[250])
        {
            Caption = 'Memo8';
            DataClassification = SystemMetadata;
        }
        field(19; Memo9; Text[250])
        {
            Caption = 'Memo9';
            DataClassification = SystemMetadata;
        }
        field(20; Memo10; Text[250])
        {
            Caption = 'Memo10';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Code", "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

