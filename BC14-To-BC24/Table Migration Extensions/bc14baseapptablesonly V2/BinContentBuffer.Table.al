table 7330 "Bin Content Buffer"
{
    Caption = 'Bin Content Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(2; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(3; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            DataClassification = SystemMetadata;
            NotBlank = true;

        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(5; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = SystemMetadata;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = SystemMetadata;
        }
        field(10; Cubage; Decimal)
        {
            Caption = 'Cubage';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(11; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(12; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            DataClassification = SystemMetadata;
        }
        field(50; "Qty. to Handle (Base)"; Decimal)
        {
            Caption = 'Qty. to Handle (Base)';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(51; "Qty. Outstanding (Base)"; Decimal)
        {
            Caption = 'Qty. Outstanding (Base)';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(6500; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
            DataClassification = SystemMetadata;
        }
        field(6501; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Location Code", "Bin Code", "Item No.", "Variant Code", "Unit of Measure Code", "Lot No.", "Serial No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

