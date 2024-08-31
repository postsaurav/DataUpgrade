table 5820 "Cost Element Buffer"
{
    Caption = 'Cost Element Buffer';
    ReplicateData = false;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Direct Cost,Revaluation,Rounding,Indirect Cost,Variance,Total';
            OptionMembers = "Direct Cost",Revaluation,Rounding,"Indirect Cost",Variance,Total;
        }
        field(2; "Variance Type"; Option)
        {
            Caption = 'Variance Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead,Subcontracted';
            OptionMembers = " ",Purchase,Material,Capacity,"Capacity Overhead","Manufacturing Overhead",Subcontracted;
        }
        field(3; "Actual Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Actual Cost';
            DataClassification = SystemMetadata;
        }
        field(4; "Actual Cost (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Actual Cost (ACY)';
            DataClassification = SystemMetadata;
        }
        field(5; "Rounding Residual"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Rounding Residual';
            DataClassification = SystemMetadata;
        }
        field(6; "Rounding Residual (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Rounding Residual (ACY)';
            DataClassification = SystemMetadata;
        }
        field(7; "Expected Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Cost';
            DataClassification = SystemMetadata;
        }
        field(8; "Expected Cost (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Cost (ACY)';
            DataClassification = SystemMetadata;
        }
        field(9; "Invoiced Quantity"; Decimal)
        {
            Caption = 'Invoiced Quantity';
            DataClassification = SystemMetadata;
        }
        field(10; "Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            DataClassification = SystemMetadata;
        }
        field(11; "Inbound Completely Invoiced"; Boolean)
        {
            Caption = 'Inbound Completely Invoiced';
            DataClassification = SystemMetadata;
        }
        field(12; "Last Valid Value Entry No"; Integer)
        {
            Caption = 'Last Valid Value Entry No';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Type, "Variance Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

