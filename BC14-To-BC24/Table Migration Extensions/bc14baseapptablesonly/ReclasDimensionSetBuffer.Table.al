table 482 "Reclas. Dimension Set Buffer"
{
    Caption = 'Reclas. Dimension Set Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(2; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(3; "Dimension Value ID"; Integer)
        {
            Caption = 'Dimension Value ID';
            DataClassification = SystemMetadata;
        }
        field(4; "New Dimension Value Code"; Code[20])
        {
            Caption = 'New Dimension Value Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(5; "New Dimension Value ID"; Integer)
        {
            Caption = 'New Dimension Value ID';
            DataClassification = SystemMetadata;
        }
        field(6; "Dimension Name"; Text[30])
        {
            CalcFormula = Lookup (Dimension.Name WHERE (Code = FIELD ("Dimension Code")));
            Caption = 'Dimension Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Dimension Value Name"; Text[50])
        {
            CalcFormula = Lookup ("Dimension Value".Name WHERE ("Dimension Code" = FIELD ("Dimension Code"),
                                                               Code = FIELD ("Dimension Value Code")));
            Caption = 'Dimension Value Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "New Dimension Value Name"; Text[50])
        {
            CalcFormula = Lookup ("Dimension Value".Name WHERE ("Dimension Code" = FIELD ("Dimension Code"),
                                                               Code = FIELD ("New Dimension Value Code")));
            Caption = 'New Dimension Value Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Dimension Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

