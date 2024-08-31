table 1315 "Purch. Price Line Disc. Buff."
{
    Caption = 'Purch. Price Line Disc. Buff.';

    fields
    {
        field(3; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = SystemMetadata;
            TableRelation = Currency;
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = SystemMetadata;
        }
        field(5; "Line Discount %"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Line Discount %';
            DataClassification = SystemMetadata;
            MaxValue = 100;
            MinValue = 0;
        }
        field(6; "Direct Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
            DataClassification = SystemMetadata;
            MinValue = 0;
        }
        field(14; "Minimum Quantity"; Decimal)
        {
            Caption = 'Minimum Quantity';
            DataClassification = SystemMetadata;
            MinValue = 0;
        }
        field(15; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = SystemMetadata;
        }
        field(1300; "Line Type"; Option)
        {
            Caption = 'Line Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Purchase Line Discount,Purchase Price';
            OptionMembers = " ","Purchase Line Discount","Purchase Price";
        }
        field(1301; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(1303; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(5400; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = SystemMetadata;
            TableRelation = "Item Unit of Measure";
        }
        field(5700; "Variant Code"; Code[20])
        {
            Caption = 'Variant Code';
            DataClassification = SystemMetadata;
            TableRelation = "Item Variant";
        }
    }

    keys
    {
        key(Key1; "Line Type", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity", "Item No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

