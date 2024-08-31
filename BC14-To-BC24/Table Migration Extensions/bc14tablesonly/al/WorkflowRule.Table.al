table 1524 "Workflow Rule"
{
    Caption = 'Workflow Rule';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = FILTER (Table));
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table ID"));
        }
        field(4; Operator; Option)
        {
            Caption = 'Operator';
            InitValue = Changed;
            OptionCaption = 'Increased,Decreased,Changed';
            OptionMembers = Increased,Decreased,Changed;
        }
        field(8; "Workflow Code"; Code[20])
        {
            Caption = 'Workflow Code';
            TableRelation = Workflow.Code;
        }
        field(9; "Workflow Step ID"; Integer)
        {
            Caption = 'Workflow Step ID';
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"));
        }
        field(10; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field No.")));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(11; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
            TableRelation = "Workflow Step Instance".ID;
        }
    }

    keys
    {
        key(Key1; "Workflow Code", "Workflow Step ID", ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

