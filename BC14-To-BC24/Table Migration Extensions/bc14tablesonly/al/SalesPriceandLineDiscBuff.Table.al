table 1304 "Sales Price and Line Disc Buff"
{
    Caption = 'Sales Price and Line Disc Buff';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
            NotBlank = true;
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST ("Item Disc. Group")) "Item Discount Group";
        }
        field(2; "Sales Code"; Code[20])
        {
            Caption = 'Sales Code';
            DataClassification = SystemMetadata;
            TableRelation = IF ("Sales Type" = CONST ("Customer Price/Disc. Group"),
                                "Line Type" = CONST ("Sales Line Discount")) "Customer Discount Group"
            ELSE
            IF ("Sales Type" = CONST ("Customer Price/Disc. Group"),
                                         "Line Type" = CONST ("Sales Price")) "Customer Price Group"
            ELSE
            IF ("Sales Type" = CONST (Customer)) Customer;
        }
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
        field(6; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            DataClassification = SystemMetadata;
            MinValue = 0;
        }
        field(7; "Price Includes VAT"; Boolean)
        {
            Caption = 'Price Includes VAT';
            DataClassification = SystemMetadata;
        }
        field(10; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            DataClassification = SystemMetadata;
            InitValue = true;
        }
        field(11; "VAT Bus. Posting Gr. (Price)"; Code[20])
        {
            Caption = 'VAT Bus. Posting Gr. (Price)';
            DataClassification = SystemMetadata;
            TableRelation = "VAT Business Posting Group";
        }
        field(13; "Sales Type"; Option)
        {
            Caption = 'Sales Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Customer,Customer Price/Disc. Group,All Customers,Campaign';
            OptionMembers = Customer,"Customer Price/Disc. Group","All Customers",Campaign;
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
        field(21; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Item,Item Disc. Group';
            OptionMembers = Item,"Item Disc. Group";
        }
        field(1300; "Line Type"; Option)
        {
            Caption = 'Line Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Sales Line Discount,Sales Price';
            OptionMembers = " ","Sales Line Discount","Sales Price";
        }
        field(1301; "Loaded Item No."; Code[20])
        {
            Caption = 'Loaded Item No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(1302; "Loaded Disc. Group"; Code[20])
        {
            Caption = 'Loaded Disc. Group';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(1303; "Loaded Customer No."; Code[20])
        {
            Caption = 'Loaded Customer No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(1304; "Loaded Price Group"; Code[20])
        {
            Caption = 'Loaded Price Group';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(5400; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = SystemMetadata;
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD (Code));
        }
        field(5700; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = SystemMetadata;
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD (Code));
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
            DataClassification = SystemMetadata;
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Line Type", Type, "Code", "Sales Type", "Sales Code", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity", "Loaded Item No.", "Loaded Disc. Group", "Loaded Customer No.", "Loaded Price Group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

