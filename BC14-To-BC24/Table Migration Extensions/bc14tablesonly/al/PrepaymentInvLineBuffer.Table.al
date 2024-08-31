table 461 "Prepayment Inv. Line Buffer"
{
    Caption = 'Prepayment Inv. Line Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            DataClassification = SystemMetadata;
            TableRelation = "G/L Account";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(3; Amount; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(5; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Business Posting Group";
        }
        field(6; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Product Posting Group";
        }
        field(7; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Business Posting Group";
        }
        field(8; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Product Posting Group";
        }
        field(9; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
            DataClassification = SystemMetadata;
        }
        field(10; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(11; "VAT Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
            DataClassification = SystemMetadata;
        }
        field(12; "Amount (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (ACY)';
            DataClassification = SystemMetadata;
        }
        field(13; "VAT Amount (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount (ACY)';
            DataClassification = SystemMetadata;
        }
        field(14; "VAT Base Amount (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount (ACY)';
            DataClassification = SystemMetadata;
        }
        field(15; "VAT Difference"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            DataClassification = SystemMetadata;
        }
        field(16; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DataClassification = SystemMetadata;
            DecimalPlaces = 1 : 1;
        }
        field(17; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(21; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = SystemMetadata;
            TableRelation = Job;
        }
        field(22; "Amount Incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Incl. VAT';
            DataClassification = SystemMetadata;
        }
        field(24; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Area";
        }
        field(25; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
            DataClassification = SystemMetadata;
        }
        field(26; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Group";
        }
        field(27; "Invoice Rounding"; Boolean)
        {
            Caption = 'Invoice Rounding';
            DataClassification = SystemMetadata;
        }
        field(28; Adjustment; Boolean)
        {
            Caption = 'Adjustment';
            DataClassification = SystemMetadata;
        }
        field(29; "VAT Base Before Pmt. Disc."; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Before Pmt. Disc.';
            DataClassification = SystemMetadata;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = SystemMetadata;
            TableRelation = "Job Task";
        }
    }

    keys
    {
        key(Key1; "G/L Account No.", "Job No.", "Tax Area Code", "Tax Liable", "Tax Group Code", "Invoice Rounding", Adjustment, "Line No.", "Dimension Set ID")
        {
            Clustered = true;
        }
        key(Key2; Adjustment)
        {
        }
    }

    fieldgroups
    {
    }
}

