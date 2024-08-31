table 1525 "Workflow - Record Change"
{
    Caption = 'Workflow - Record Change';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(4; "Old Value"; Text[250])
        {
            Caption = 'Old Value';
        }
        field(5; "New Value"; Text[250])
        {
            Caption = 'New Value';
        }
        field(6; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(7; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
        }
        field(8; "Field Caption"; Text[250])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Field No.")));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(9; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Workflow Step Instance ID", "Record ID")
        {
        }
    }

    fieldgroups
    {
    }
}

