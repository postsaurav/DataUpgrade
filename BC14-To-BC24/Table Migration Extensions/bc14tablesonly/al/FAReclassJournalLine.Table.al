table 5624 "FA Reclass. Journal Line"
{
    Caption = 'FA Reclass. Journal Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "FA Reclass. Journal Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "FA Reclass. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "FA No."; Code[20])
        {
            Caption = 'FA No.';
            TableRelation = "Fixed Asset";
        }
        field(5; "New FA No."; Code[20])
        {
            Caption = 'New FA No.';
            TableRelation = "Fixed Asset";
        }
        field(6; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(8; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";
        }
        field(9; "Reclassify Acq. Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Reclassify Acq. Cost Amount';
            MinValue = 0;
        }
        field(10; "Reclassify Acq. Cost %"; Decimal)
        {
            Caption = 'Reclassify Acq. Cost %';
            DecimalPlaces = 0 : 8;
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "Reclassify Acquisition Cost"; Boolean)
        {
            Caption = 'Reclassify Acquisition Cost';
        }
        field(12; "Reclassify Depreciation"; Boolean)
        {
            Caption = 'Reclassify Depreciation';
        }
        field(13; "Reclassify Write-Down"; Boolean)
        {
            Caption = 'Reclassify Write-Down';
        }
        field(14; "Reclassify Appreciation"; Boolean)
        {
            Caption = 'Reclassify Appreciation';
        }
        field(15; "Reclassify Custom 1"; Boolean)
        {
            Caption = 'Reclassify Custom 1';
        }
        field(16; "Reclassify Custom 2"; Boolean)
        {
            Caption = 'Reclassify Custom 2';
        }
        field(17; "Reclassify Salvage Value"; Boolean)
        {
            Caption = 'Reclassify Salvage Value';
        }
        field(18; "Insert Bal. Account"; Boolean)
        {
            Caption = 'Insert Bal. Account';
        }
        field(19; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(20; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(22; "Calc. DB1 Depr. Amount"; Boolean)
        {
            Caption = 'Calc. DB1 Depr. Amount';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Journal Template Name", "Journal Batch Name", "FA Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

