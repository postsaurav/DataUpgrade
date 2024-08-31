table 5810 "Rounding Residual Buffer"
{
    Caption = 'Rounding Residual Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Adjusted Cost"; Decimal)
        {
            Caption = 'Adjusted Cost';
            DataClassification = SystemMetadata;
        }
        field(3; "Adjusted Cost (ACY)"; Decimal)
        {
            Caption = 'Adjusted Cost (ACY)';
            DataClassification = SystemMetadata;
        }
        field(4; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely Invoiced';
            DataClassification = SystemMetadata;
        }
        field(5; "No. of Hits"; Integer)
        {
            Caption = 'No. of Hits';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Item Ledger Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

