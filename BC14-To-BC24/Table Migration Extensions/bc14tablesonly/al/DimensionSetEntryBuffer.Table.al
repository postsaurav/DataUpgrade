table 5489 "Dimension Set Entry Buffer"
{
    Caption = 'Dimension Set Entry Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
        }
        field(2; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(3; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(4; "Dimension Value ID"; Integer)
        {
            Caption = 'Dimension Value ID';
            DataClassification = SystemMetadata;
        }
        field(5; "Dimension Name"; Text[30])
        {
            CalcFormula = Lookup (Dimension.Name WHERE (Code = FIELD ("Dimension Code")));
            Caption = 'Dimension Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Dimension Value Name"; Text[50])
        {
            CalcFormula = Lookup ("Dimension Value".Name WHERE ("Dimension Code" = FIELD ("Dimension Code"),
                                                               Code = FIELD ("Dimension Value Code")));
            Caption = 'Dimension Value Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8000; "Dimension Id"; Guid)
        {
            Caption = 'Dimension Id';
            DataClassification = SystemMetadata;
        }
        field(8001; "Value Id"; Guid)
        {
            Caption = 'Value Id';
            DataClassification = SystemMetadata;
        }
        field(8002; "Parent Id"; Guid)
        {
            Caption = 'Parent Id';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Parent Id", "Dimension Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

