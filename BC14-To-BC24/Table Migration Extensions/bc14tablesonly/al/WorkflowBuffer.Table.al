table 1500 "Workflow Buffer"
{
    Caption = 'Workflow Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = SystemMetadata;
            TableRelation = "Workflow Category".Code;
        }
        field(2; "Workflow Code"; Code[20])
        {
            Caption = 'Workflow Code';
            DataClassification = SystemMetadata;
            TableRelation = Workflow.Code;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; Indentation; Integer)
        {
            Caption = 'Indentation';
            DataClassification = SystemMetadata;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(6; Template; Boolean)
        {
            CalcFormula = Lookup (Workflow.Template WHERE (Code = FIELD ("Workflow Code")));
            Caption = 'Template';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Enabled; Boolean)
        {
            CalcFormula = Lookup (Workflow.Enabled WHERE (Code = FIELD ("Workflow Code")));
            Caption = 'Enabled';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "External Client ID"; Guid)
        {
            CalcFormula = Lookup ("Workflow Webhook Subscription"."Client Id" WHERE ("WF Definition Id" = FIELD ("Workflow Code"),
                                                                                    Enabled = CONST (true)));
            Caption = 'External Client ID';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "External Client Type"; Text[50])
        {
            CalcFormula = Lookup ("Workflow Webhook Subscription"."Client Type" WHERE ("WF Definition Id" = FIELD ("Workflow Code"),
                                                                                      Enabled = CONST (true)));
            Caption = 'External Client Type';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Category Code", "Workflow Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

