table 1706 "Deferral Posting Buffer"
{
    Caption = 'Deferral Posting Buffer';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Prepmt. Exch. Rate Difference,G/L Account,Item,Resource,Fixed Asset';
            OptionMembers = "Prepmt. Exch. Rate Difference","G/L Account",Item,Resource,"Fixed Asset";
        }
        field(3; "G/L Account"; Code[20])
        {
            Caption = 'G/L Account';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                 Blocked = CONST (false));
        }
        field(4; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Business Posting Group";
        }
        field(5; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "Gen. Product Posting Group";
        }
        field(6; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Business Posting Group";
        }
        field(7; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Product Posting Group";
        }
        field(8; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Area";
        }
        field(9; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = SystemMetadata;
            TableRelation = "Tax Group";
        }
        field(10; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
            DataClassification = SystemMetadata;
        }
        field(11; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
            DataClassification = SystemMetadata;
        }
        field(12; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = SystemMetadata;
            TableRelation = Job;
        }
        field(13; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = SystemMetadata;
        }
        field(14; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = SystemMetadata;
        }
        field(15; "Amount (LCY)"; Decimal)
        {
            Caption = 'Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(16; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            DataClassification = SystemMetadata;
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = SystemMetadata;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(19; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(20; "Deferral Account"; Code[20])
        {
            Caption = 'Deferral Account';
            DataClassification = SystemMetadata;
        }
        field(21; "Period Description"; Text[100])
        {
            Caption = 'Period Description';
            DataClassification = SystemMetadata;
        }
        field(22; "Deferral Doc. Type"; Option)
        {
            Caption = 'Deferral Doc. Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Purchase,Sales,G/L';
            OptionMembers = Purchase,Sales,"G/L";
        }
        field(23; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(24; "Sales/Purch Amount"; Decimal)
        {
            Caption = 'Sales/Purch Amount';
            DataClassification = SystemMetadata;
        }
        field(25; "Sales/Purch Amount (LCY)"; Decimal)
        {
            Caption = 'Sales/Purch Amount (LCY)';
            DataClassification = SystemMetadata;
        }
        field(26; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(27; "Partial Deferral"; Boolean)
        {
            Caption = 'Partial Deferral';
            DataClassification = SystemMetadata;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1700; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            DataClassification = SystemMetadata;
            TableRelation = "Deferral Template"."Deferral Code";
        }
        field(1701; "Deferral Line No."; Integer)
        {
            Caption = 'Deferral Line No.';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Deferral Doc. Type", "Document No.", "Deferral Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

