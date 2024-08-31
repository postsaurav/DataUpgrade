table 1150 "Report Totals Buffer"
{
    Caption = 'Report Totals Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(3; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(4; "Amount Formatted"; Text[30])
        {
            Caption = 'Amount Formatted';
            DataClassification = SystemMetadata;
        }
        field(5; "Font Bold"; Boolean)
        {
            Caption = 'Font Bold';
            DataClassification = SystemMetadata;
        }
        field(6; "Font Underline"; Boolean)
        {
            Caption = 'Font Underline';
            DataClassification = SystemMetadata;
        }
        field(7; "Font Italics"; Boolean)
        {
            Caption = 'Font Italics';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

