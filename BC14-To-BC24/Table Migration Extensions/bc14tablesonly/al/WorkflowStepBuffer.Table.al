table 1507 "Workflow Step Buffer"
{
    Caption = 'Workflow Step Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Order"; Integer)
        {
            Caption = 'Order';
            DataClassification = SystemMetadata;
        }
        field(2; Indent; Integer)
        {
            Caption = 'Indent';
            DataClassification = SystemMetadata;
        }
        field(3; "Event Description"; Text[250])
        {
            Caption = 'Event Description';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Event".Description;
            ValidateTableRelation = false;
        }
        field(4; Condition; Text[100])
        {
            Caption = 'Condition';
            DataClassification = SystemMetadata;
        }
        field(5; "Response Description"; Text[250])
        {
            Caption = 'Response Description';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Response".Description;
            ValidateTableRelation = false;
        }
        field(7; "Event Step ID"; Integer)
        {
            Caption = 'Event Step ID';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"),
                                                      Type = CONST (Event));
        }
        field(8; "Response Step ID"; Integer)
        {
            Caption = 'Response Step ID';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"),
                                                      Type = CONST (Response));
        }
        field(9; "Workflow Code"; Code[20])
        {
            Caption = 'Workflow Code';
            DataClassification = SystemMetadata;
            TableRelation = Workflow.Code;
        }
        field(10; "Parent Event Step ID"; Integer)
        {
            Caption = 'Parent Event Step ID';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"),
                                                      Type = CONST (Event));
        }
        field(11; "Previous Workflow Step ID"; Integer)
        {
            Caption = 'Previous Workflow Step ID';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"));
        }
        field(12; "Response Description Style"; Text[30])
        {
            Caption = 'Response Description Style';
            DataClassification = SystemMetadata;
        }
        field(14; "Entry Point"; Boolean)
        {
            Caption = 'Entry Point';
            DataClassification = SystemMetadata;
        }
        field(15; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
            DataClassification = SystemMetadata;
        }
        field(16; "Next Step Description"; Text[250])
        {
            Caption = 'Next Step Description';
            DataClassification = SystemMetadata;
        }
        field(17; Argument; Guid)
        {
            Caption = 'Argument';
            DataClassification = SystemMetadata;
        }
        field(18; Template; Boolean)
        {
            CalcFormula = Lookup (Workflow.Template WHERE (Code = FIELD ("Workflow Code")));
            Caption = 'Template';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Order")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

