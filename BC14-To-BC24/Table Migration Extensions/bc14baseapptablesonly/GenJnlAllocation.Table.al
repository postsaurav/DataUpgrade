table 221 "Gen. Jnl. Allocation"
{
    Caption = 'Gen. Jnl. Allocation';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(3; "Journal Line No."; Integer)
        {
            Caption = 'Journal Line No.';
            TableRelation = "Gen. Journal Line"."Line No." WHERE ("Journal Template Name" = FIELD ("Journal Template Name"),
                                                                  "Journal Batch Name" = FIELD ("Journal Batch Name"));
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = "G/L Account";
        }
        field(6; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(7; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(8; "Allocation Quantity"; Decimal)
        {
            Caption = 'Allocation Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(9; "Allocation %"; Decimal)
        {
            Caption = 'Allocation %';
            DecimalPlaces = 2 : 2;
        }
        field(10; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(11; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale';
            OptionMembers = " ",Purchase,Sale;
        }
        field(12; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(13; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(14; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(15; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
            Editable = false;
        }
        field(16; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(17; "Account Name"; Text[100])
        {
            CalcFormula = Lookup ("G/L Account".Name WHERE ("No." = FIELD ("Account No.")));
            Caption = 'Account Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(19; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(20; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(21; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(22; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(23; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(24; "Additional-Currency Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional-Currency Amount';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Journal Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

