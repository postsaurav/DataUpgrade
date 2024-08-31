table 1017 "Job Buffer"
{
    Caption = 'Job Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Account No. 1"; Code[20])
        {
            Caption = 'Account No. 1';
            DataClassification = SystemMetadata;
        }
        field(2; "Account No. 2"; Code[20])
        {
            Caption = 'Account No. 2';
            DataClassification = SystemMetadata;
        }
        field(3; "Amount 1"; Decimal)
        {
            Caption = 'Amount 1';
            DataClassification = SystemMetadata;
        }
        field(4; "Amount 2"; Decimal)
        {
            Caption = 'Amount 2';
            DataClassification = SystemMetadata;
        }
        field(5; "Amount 3"; Decimal)
        {
            Caption = 'Amount 3';
            DataClassification = SystemMetadata;
        }
        field(6; "Amount 4"; Decimal)
        {
            Caption = 'Amount 4';
            DataClassification = SystemMetadata;
        }
        field(7; "Amount 5"; Decimal)
        {
            Caption = 'Amount 5';
            DataClassification = SystemMetadata;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(11; "New Total"; Boolean)
        {
            Caption = 'New Total';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Account No. 1", "Account No. 2")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

