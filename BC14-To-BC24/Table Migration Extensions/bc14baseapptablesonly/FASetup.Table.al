table 5603 "FA Setup"
{
    Caption = 'FA Setup';
    Permissions = TableData "Ins. Coverage Ledger Entry" = r;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(3; "Allow Posting to Main Assets"; Boolean)
        {
            Caption = 'Allow Posting to Main Assets';
        }
        field(4; "Default Depr. Book"; Code[10])
        {
            Caption = 'Default Depr. Book';
            TableRelation = "Depreciation Book";
        }
        field(5; "Allow FA Posting From"; Date)
        {
            Caption = 'Allow FA Posting From';
        }
        field(6; "Allow FA Posting To"; Date)
        {
            Caption = 'Allow FA Posting To';
        }
        field(7; "Insurance Depr. Book"; Code[10])
        {
            Caption = 'Insurance Depr. Book';
            TableRelation = "Depreciation Book";
        }
        field(8; "Automatic Insurance Posting"; Boolean)
        {
            Caption = 'Automatic Insurance Posting';
            InitValue = true;
        }
        field(9; "Fixed Asset Nos."; Code[20])
        {
            Caption = 'Fixed Asset Nos.';
            TableRelation = "No. Series";
        }
        field(10; "Insurance Nos."; Code[20])
        {
            AccessByPermission = TableData Insurance = R;
            Caption = 'Insurance Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

