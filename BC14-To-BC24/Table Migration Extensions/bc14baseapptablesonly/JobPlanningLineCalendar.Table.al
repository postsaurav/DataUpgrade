table 1034 "Job Planning Line - Calendar"
{
    Caption = 'Job Planning Line - Calendar';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = "Job Planning Line"."Job No.";
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Planning Line"."Job Task No.";
        }
        field(3; "Planning Line No."; Integer)
        {
            Caption = 'Planning Line No.';
            TableRelation = "Job Planning Line"."Line No.";
        }
        field(4; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource."No.";
        }
        field(6; "Planning Date"; Date)
        {
            Caption = 'Planning Date';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; UID; Guid)
        {
            Caption = 'UID';
        }
        field(10; Sequence; Integer)
        {
            Caption = 'Sequence';
            InitValue = 1;
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Planning Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

