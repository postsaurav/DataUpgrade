table 1799 "Data Migration Status"
{
    Caption = 'Data Migration Status';
    ReplicateData = false;

    fields
    {
        field(1; "Migration Type"; Text[250])
        {
            Caption = 'Migration Type';
        }
        field(2; "Destination Table ID"; Integer)
        {
            Caption = 'Destination Table ID';
            DataClassification = SystemMetadata;
        }
        field(3; "Total Number"; Integer)
        {
            Caption = 'Total Number';
        }
        field(4; "Migrated Number"; Integer)
        {
            Caption = 'Migrated Number';
        }
        field(5; "Progress Percent"; Decimal)
        {
            Caption = 'Progress Percent';
            DataClassification = SystemMetadata;
            ExtendedDatatype = Ratio;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Pending,In Progress,Completed,Completed with Errors,Stopped,Failed';
            OptionMembers = Pending,"In Progress",Completed,"Completed with Errors",Stopped,Failed;
        }
        field(7; "Source Staging Table ID"; Integer)
        {
            Caption = 'Source Staging Table ID';
            DataClassification = SystemMetadata;
        }
        field(8; "Migration Codeunit To Run"; Integer)
        {
            Caption = 'Migration Codeunit To Run';
            DataClassification = SystemMetadata;
        }
        field(9; "Error Count"; Integer)
        {
            CalcFormula = Count ("Data Migration Error" WHERE ("Migration Type" = FIELD ("Migration Type"),
                                                              "Destination Table ID" = FIELD ("Destination Table ID")));
            Caption = 'Error Count';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Migration Type", "Destination Table ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

