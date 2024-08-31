table 5813 "Inventory Posting Setup"
{
    Caption = 'Inventory Posting Setup';

    fields
    {
        field(1; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(2; "Invt. Posting Group Code"; Code[20])
        {
            Caption = 'Invt. Posting Group Code';
            NotBlank = true;
            TableRelation = "Inventory Posting Group";
        }
        field(6; "Inventory Account"; Code[20])
        {
            Caption = 'Inventory Account';
            TableRelation = "G/L Account";
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(21; "View All Accounts on Lookup"; Boolean)
        {
            Caption = 'View All Accounts on Lookup';
        }
        field(5800; "Inventory Account (Interim)"; Code[20])
        {
            Caption = 'Inventory Account (Interim)';
            TableRelation = "G/L Account";
        }
        field(99000750; "WIP Account"; Code[20])
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'WIP Account';
            TableRelation = "G/L Account";
        }
        field(99000753; "Material Variance Account"; Code[20])
        {
            Caption = 'Material Variance Account';
            TableRelation = "G/L Account";
        }
        field(99000754; "Capacity Variance Account"; Code[20])
        {
            Caption = 'Capacity Variance Account';
            TableRelation = "G/L Account";
        }
        field(99000755; "Mfg. Overhead Variance Account"; Code[20])
        {
            Caption = 'Mfg. Overhead Variance Account';
            TableRelation = "G/L Account";
        }
        field(99000756; "Cap. Overhead Variance Account"; Code[20])
        {
            Caption = 'Cap. Overhead Variance Account';
            TableRelation = "G/L Account";
        }
        field(99000757; "Subcontracted Variance Account"; Code[20])
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Subcontracted Variance Account';
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1; "Location Code", "Invt. Posting Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

