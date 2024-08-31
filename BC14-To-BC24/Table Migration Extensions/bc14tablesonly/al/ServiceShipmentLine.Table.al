table 5991 "Service Shipment Line"
{
    Caption = 'Service Shipment Line';
    Permissions = TableData "Item Ledger Entry" = r,
                  TableData "Value Entry" = r;

    fields
    {
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Service Shipment Header"."No.";
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Item,Resource,Cost,G/L Account';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (" ")) "Standard Text"
            ELSE
            IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST (Cost)) "Service Cost"
            ELSE
            IF (Type = CONST ("G/L Account")) "G/L Account";
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(8; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            TableRelation = IF (Type = CONST (Item)) "Inventory Posting Group";
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(13; "Unit of Measure"; Text[50])
        {
            Caption = 'Unit of Measure';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
        }
        field(23; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';
        }
        field(25; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(32; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            InitValue = true;
        }
        field(34; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
        }
        field(35; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
        }
        field(36; "Units per Parcel"; Decimal)
        {
            Caption = 'Units per Parcel';
            DecimalPlaces = 0 : 5;
        }
        field(37; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Appl.-to Item Entry';
        }
        field(39; "Item Shpt. Entry No."; Integer)
        {
            Caption = 'Item Shpt. Entry No.';
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(42; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            Editable = false;
            TableRelation = "Customer Price Group";
        }
        field(52; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(58; "Qty. Shipped Not Invoiced"; Decimal)
        {
            Caption = 'Qty. Shipped Not Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(61; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(65; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(66; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
        }
        field(68; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(74; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(75; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(77; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(78; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(79; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(80; "Attached to Line No."; Integer)
        {
            Caption = 'Attached to Line No.';
            Editable = false;
        }
        field(81; "Exit Point"; Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(82; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(83; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(85; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(86; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(87; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(89; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(90; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(91; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(99; "VAT Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
        }
        field(100; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(950; "Time Sheet No."; Code[20])
        {
            Caption = 'Time Sheet No.';
            TableRelation = "Time Sheet Header";
        }
        field(951; "Time Sheet Line No."; Integer)
        {
            Caption = 'Time Sheet Line No.';
            TableRelation = "Time Sheet Line"."Line No." WHERE ("Time Sheet No." = FIELD ("Time Sheet No."));
        }
        field(952; "Time Sheet Date"; Date)
        {
            Caption = 'Time Sheet Date';
            TableRelation = "Time Sheet Detail".Date WHERE ("Time Sheet No." = FIELD ("Time Sheet No."),
                                                            "Time Sheet Line No." = FIELD ("Time Sheet Line No."));
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5403; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(5415; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5458; "Qty. Shipped Not Invd. (Base)"; Decimal)
        {
            Caption = 'Qty. Shipped Not Invd. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5461; "Qty. Invoiced (Base)"; Decimal)
        {
            Caption = 'Qty. Invoiced (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5709; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category".Code;
        }
        field(5710; Nonstock; Boolean)
        {
            Caption = 'Catalog';
        }
        field(5712; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            ObsoleteReason = 'Product Groups became first level children of Item Categories.';
            ObsoleteState = Removed;
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
            ValidateTableRelation = false;
        }
        field(5817; Correction; Boolean)
        {
            Caption = 'Correction';
        }
        field(5901; "Appl.-to Warranty Entry"; Integer)
        {
            Caption = 'Appl.-to Warranty Entry';
        }
        field(5902; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
            TableRelation = "Service Item"."No.";
        }
        field(5903; "Appl.-to Service Entry"; Integer)
        {
            Caption = 'Appl.-to Service Entry';
        }
        field(5904; "Service Item Line No."; Integer)
        {
            Caption = 'Service Item Line No.';
        }
        field(5905; "Service Item Serial No."; Code[50])
        {
            Caption = 'Service Item Serial No.';
        }
        field(5906; "Service Item Line Description"; Text[100])
        {
            Caption = 'Service Item Line Description';
        }
        field(5908; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5909; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(5910; "Needed by Date"; Date)
        {
            Caption = 'Needed by Date';
        }
        field(5916; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Customer No."));
        }
        field(5918; "Quantity Consumed"; Decimal)
        {
            Caption = 'Quantity Consumed';
            DecimalPlaces = 0 : 5;
        }
        field(5920; "Qty. Consumed (Base)"; Decimal)
        {
            Caption = 'Qty. Consumed (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5928; "Service Price Group Code"; Code[10])
        {
            Caption = 'Service Price Group Code';
            TableRelation = "Service Price Group";
        }
        field(5929; "Fault Area Code"; Code[10])
        {
            Caption = 'Fault Area Code';
            TableRelation = "Fault Area";
        }
        field(5930; "Symptom Code"; Code[10])
        {
            Caption = 'Symptom Code';
            TableRelation = "Symptom Code";
        }
        field(5931; "Fault Code"; Code[10])
        {
            Caption = 'Fault Code';
            TableRelation = "Fault Code".Code WHERE ("Fault Area Code" = FIELD ("Fault Area Code"),
                                                     "Symptom Code" = FIELD ("Symptom Code"));
        }
        field(5932; "Resolution Code"; Code[10])
        {
            Caption = 'Resolution Code';
            TableRelation = "Resolution Code";
        }
        field(5933; "Exclude Warranty"; Boolean)
        {
            Caption = 'Exclude Warranty';
        }
        field(5934; Warranty; Boolean)
        {
            Caption = 'Warranty';
        }
        field(5936; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            TableRelation = "Service Contract Header"."Contract No." WHERE ("Contract Type" = CONST (Contract));
        }
        field(5938; "Contract Disc. %"; Decimal)
        {
            Caption = 'Contract Disc. %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5939; "Warranty Disc. %"; Decimal)
        {
            Caption = 'Warranty Disc. %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5965; "Component Line No."; Integer)
        {
            Caption = 'Component Line No.';
        }
        field(5966; "Spare Part Action"; Option)
        {
            Caption = 'Spare Part Action';
            OptionCaption = ' ,Permanent,Temporary,Component Replaced,Component Installed';
            OptionMembers = " ",Permanent,"Temporary","Component Replaced","Component Installed";
        }
        field(5967; "Fault Reason Code"; Code[10])
        {
            Caption = 'Fault Reason Code';
            TableRelation = "Fault Reason Code";
        }
        field(5968; "Replaced Item No."; Code[20])
        {
            Caption = 'Replaced Item No.';
            TableRelation = IF ("Replaced Item Type" = CONST (Item)) Item
            ELSE
            IF ("Replaced Item Type" = CONST ("Service Item")) "Service Item";
        }
        field(5969; "Exclude Contract Discount"; Boolean)
        {
            Caption = 'Exclude Contract Discount';
        }
        field(5970; "Replaced Item Type"; Option)
        {
            Caption = 'Replaced Item Type';
            OptionCaption = ' ,Service Item,Item';
            OptionMembers = " ","Service Item",Item;
        }
        field(5994; "Price Adjmt. Status"; Option)
        {
            Caption = 'Price Adjmt. Status';
            OptionCaption = ' ,Adjusted,Modified';
            OptionMembers = " ",Adjusted,Modified;
        }
        field(5997; "Line Discount Type"; Option)
        {
            Caption = 'Line Discount Type';
            OptionCaption = ' ,Warranty Disc.,Contract Disc.,Line Disc.,Manual';
            OptionMembers = " ","Warranty Disc.","Contract Disc.","Line Disc.",Manual;
        }
        field(5999; "Copy Components From"; Option)
        {
            Caption = 'Copy Components From';
            OptionCaption = 'None,Item BOM,Old Service Item,Old Serv.Item w/o Serial No.';
            OptionMembers = "None","Item BOM","Old Service Item","Old Serv.Item w/o Serial No.";
        }
        field(6608; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
        }
        field(7002; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Order No.", "Order Line No.")
        {
        }
        key(Key3; "Item Shpt. Entry No.")
        {
        }
        key(Key4; "Service Item No.", Type, "Posting Date")
        {
        }
        key(Key5; "Customer No.")
        {
        }
        key(Key6; "Bill-to Customer No.")
        {
        }
        key(Key7; "Fault Reason Code")
        {
        }
        key(Key8; "Contract No.")
        {
        }
    }

    fieldgroups
    {
    }
}

