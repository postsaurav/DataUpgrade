table 366 "Analysis View Budget Entry"
{
    Caption = 'Analysis View Budget Entry';

    fields
    {
        field(1; "Analysis View Code"; Code[10])
        {
            Caption = 'Analysis View Code';
            NotBlank = true;
            TableRelation = "Analysis View";
        }
        field(2; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            TableRelation = "G/L Budget Name";
        }
        field(3; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(4; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(5; "Dimension 1 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Value Code';
        }
        field(6; "Dimension 2 Value Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Value Code';
        }
        field(7; "Dimension 3 Value Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Value Code';
        }
        field(8; "Dimension 4 Value Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 4 Value Code';
        }
        field(9; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(10; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(11; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
    }

    keys
    {
        key(Key1; "Analysis View Code", "Budget Name", "G/L Account No.", "Dimension 1 Value Code", "Dimension 2 Value Code", "Dimension 3 Value Code", "Dimension 4 Value Code", "Business Unit Code", "Posting Date", "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Analysis View Code", "Business Unit Code", "Budget Name", "G/L Account No.", "Posting Date", "Dimension 1 Value Code", "Dimension 2 Value Code", "Dimension 3 Value Code", "Dimension 4 Value Code")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

