table 27 Item
{
    Caption = 'Item';
    DataCaptionFields = "No.", Description;
    Permissions = TableData "Service Item" = rm,
                  TableData "Service Item Component" = rm;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "No. 2"; Code[20])
        {
            Caption = 'No. 2';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(5; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(6; "Assembly BOM"; Boolean)
        {
            CalcFormula = Exist ("BOM Component" WHERE ("Parent Item No." = FIELD ("No.")));
            Caption = 'Assembly BOM';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
            ValidateTableRelation = false;
        }
        field(9; "Price Unit Conversion"; Integer)
        {
            Caption = 'Price Unit Conversion';
        }
        field(10; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Inventory,Service,Non-Inventory';
            OptionMembers = Inventory,Service,"Non-Inventory";
        }
        field(11; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(12; "Shelf No."; Code[10])
        {
            Caption = 'Shelf No.';
        }
        field(14; "Item Disc. Group"; Code[20])
        {
            Caption = 'Item Disc. Group';
            TableRelation = "Item Discount Group";
        }
        field(15; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
            InitValue = true;
        }
        field(16; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(17; "Commission Group"; Integer)
        {
            Caption = 'Commission Group';
        }
        field(18; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;
        }
        field(19; "Price/Profit Calculation"; Option)
        {
            Caption = 'Price/Profit Calculation';
            OptionCaption = 'Profit=Price-Cost,Price=Cost+Profit,No Relationship';
            OptionMembers = "Profit=Price-Cost","Price=Cost+Profit","No Relationship";
        }
        field(20; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
        }
        field(21; "Costing Method"; Option)
        {
            Caption = 'Costing Method';
            OptionCaption = 'FIFO,LIFO,Specific,Average,Standard';
            OptionMembers = FIFO,LIFO,Specific,"Average",Standard;
        }
        field(22; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            MinValue = 0;
        }
        field(24; "Standard Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Standard Cost';
            MinValue = 0;
        }
        field(25; "Last Direct Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Last Direct Cost';
            MinValue = 0;
        }
        field(28; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(29; "Cost is Adjusted"; Boolean)
        {
            Caption = 'Cost is Adjusted';
            Editable = false;
            InitValue = true;
        }
        field(30; "Allow Online Adjustment"; Boolean)
        {
            Caption = 'Allow Online Adjustment';
            Editable = false;
            InitValue = true;
        }
        field(31; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;
        }
        field(32; "Vendor Item No."; Text[20])
        {
            Caption = 'Vendor Item No.';
        }
        field(33; "Lead Time Calculation"; DateFormula)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lead Time Calculation';
        }
        field(34; "Reorder Point"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Reorder Point';
            DecimalPlaces = 0 : 5;
        }
        field(35; "Maximum Inventory"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Maximum Inventory';
            DecimalPlaces = 0 : 5;
        }
        field(36; "Reorder Quantity"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Reorder Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(37; "Alternative Item No."; Code[20])
        {
            Caption = 'Alternative Item No.';
            TableRelation = Item;
        }
        field(38; "Unit List Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit List Price';
            MinValue = 0;
        }
        field(39; "Duty Due %"; Decimal)
        {
            Caption = 'Duty Due %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(40; "Duty Code"; Code[10])
        {
            Caption = 'Duty Code';
        }
        field(41; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(42; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(43; "Units per Parcel"; Decimal)
        {
            Caption = 'Units per Parcel';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(44; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(45; Durability; Code[10])
        {
            Caption = 'Durability';
        }
        field(46; "Freight Type"; Code[10])
        {
            Caption = 'Freight Type';
        }
        field(47; "Tariff No."; Code[20])
        {
            Caption = 'Tariff No.';
            TableRelation = "Tariff Number";
            ValidateTableRelation = false;
        }
        field(48; "Duty Unit Conversion"; Decimal)
        {
            Caption = 'Duty Unit Conversion';
            DecimalPlaces = 0 : 5;
        }
        field(49; "Country/Region Purchased Code"; Code[10])
        {
            Caption = 'Country/Region Purchased Code';
            TableRelation = "Country/Region";
        }
        field(50; "Budget Quantity"; Decimal)
        {
            Caption = 'Budget Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(51; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(52; "Budget Profit"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budget Profit';
        }
        field(53; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Item),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(55; "Cost is Posted to G/L"; Boolean)
        {
            CalcFormula = - Exist ("Post Value Entry to G/L" WHERE ("Item No." = FIELD ("No.")));
            Caption = 'Cost is Posted to G/L';
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Block Reason"; Text[250])
        {
            Caption = 'Block Reason';
        }
        field(61; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(62; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(63; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
            Editable = false;
        }
        field(64; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(65; "Global Dimension 1 Filter"; Code[20])
        {
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(66; "Global Dimension 2 Filter"; Code[20])
        {
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(67; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(68; Inventory; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Item No." = FIELD ("No."),
                                                                  "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                  "Location Code" = FIELD ("Location Filter"),
                                                                  "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD ("Variant Filter"),
                                                                  "Lot No." = FIELD ("Lot No. Filter"),
                                                                  "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(69; "Net Invoiced Qty."; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Invoiced Quantity" WHERE ("Item No." = FIELD ("No."),
                                                                             "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Location Code" = FIELD ("Location Filter"),
                                                                             "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                             "Variant Code" = FIELD ("Variant Filter"),
                                                                             "Lot No." = FIELD ("Lot No. Filter"),
                                                                             "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Net Invoiced Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70; "Net Change"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Item No." = FIELD ("No."),
                                                                  "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                  "Location Code" = FIELD ("Location Filter"),
                                                                  "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                  "Posting Date" = FIELD ("Date Filter"),
                                                                  "Variant Code" = FIELD ("Variant Filter"),
                                                                  "Lot No." = FIELD ("Lot No. Filter"),
                                                                  "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Net Change';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(71; "Purchases (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Invoiced Quantity" WHERE ("Entry Type" = CONST (Purchase),
                                                                             "Item No." = FIELD ("No."),
                                                                             "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Location Code" = FIELD ("Location Filter"),
                                                                             "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                             "Variant Code" = FIELD ("Variant Filter"),
                                                                             "Posting Date" = FIELD ("Date Filter"),
                                                                             "Lot No." = FIELD ("Lot No. Filter"),
                                                                             "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Purchases (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(72; "Sales (Qty.)"; Decimal)
        {
            CalcFormula = - Sum ("Value Entry"."Invoiced Quantity" WHERE ("Item Ledger Entry Type" = CONST (Sale),
                                                                        "Item No." = FIELD ("No."),
                                                                        "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                        "Location Code" = FIELD ("Location Filter"),
                                                                        "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                        "Variant Code" = FIELD ("Variant Filter"),
                                                                        "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(73; "Positive Adjmt. (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Invoiced Quantity" WHERE ("Entry Type" = CONST ("Positive Adjmt."),
                                                                             "Item No." = FIELD ("No."),
                                                                             "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Location Code" = FIELD ("Location Filter"),
                                                                             "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                             "Variant Code" = FIELD ("Variant Filter"),
                                                                             "Posting Date" = FIELD ("Date Filter"),
                                                                             "Lot No." = FIELD ("Lot No. Filter"),
                                                                             "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Positive Adjmt. (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(74; "Negative Adjmt. (Qty.)"; Decimal)
        {
            CalcFormula = - Sum ("Item Ledger Entry"."Invoiced Quantity" WHERE ("Entry Type" = CONST ("Negative Adjmt."),
                                                                              "Item No." = FIELD ("No."),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Location Code" = FIELD ("Location Filter"),
                                                                              "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                              "Variant Code" = FIELD ("Variant Filter"),
                                                                              "Posting Date" = FIELD ("Date Filter"),
                                                                              "Lot No." = FIELD ("Lot No. Filter"),
                                                                              "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Negative Adjmt. (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(77; "Purchases (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Value Entry"."Purchase Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST (Purchase),
                                                                              "Item No." = FIELD ("No."),
                                                                              "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Location Code" = FIELD ("Location Filter"),
                                                                              "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                              "Variant Code" = FIELD ("Variant Filter"),
                                                                              "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Purchases (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78; "Sales (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Value Entry"."Sales Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST (Sale),
                                                                           "Item No." = FIELD ("No."),
                                                                           "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79; "Positive Adjmt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Value Entry"."Cost Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST ("Positive Adjmt."),
                                                                          "Item No." = FIELD ("No."),
                                                                          "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Positive Adjmt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "Negative Adjmt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Value Entry"."Cost Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST ("Negative Adjmt."),
                                                                          "Item No." = FIELD ("No."),
                                                                          "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Negative Adjmt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(83; "COGS (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Value Entry"."Cost Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST (Sale),
                                                                           "Item No." = FIELD ("No."),
                                                                           "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter")));
            Caption = 'COGS (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(84; "Qty. on Purch. Order"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Purchase Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST (Order),
                                                                               Type = CONST (Item),
                                                                               "No." = FIELD ("No."),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Location Code" = FIELD ("Location Filter"),
                                                                               "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                               "Variant Code" = FIELD ("Variant Filter"),
                                                                               "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(85; "Qty. on Sales Order"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Sum ("Sales Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST (Order),
                                                                            Type = CONST (Item),
                                                                            "No." = FIELD ("No."),
                                                                            "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                            "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Sales Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(87; "Price Includes VAT"; Boolean)
        {
            Caption = 'Price Includes VAT';
        }
        field(89; "Drop Shipment Filter"; Boolean)
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Drop Shipment Filter';
            FieldClass = FlowFilter;
        }
        field(90; "VAT Bus. Posting Gr. (Price)"; Code[20])
        {
            Caption = 'VAT Bus. Posting Gr. (Price)';
            TableRelation = "VAT Business Posting Group";
        }
        field(91; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(92; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(93; "Transferred (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Invoiced Quantity" WHERE ("Entry Type" = CONST (Transfer),
                                                                             "Item No." = FIELD ("No."),
                                                                             "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                             "Location Code" = FIELD ("Location Filter"),
                                                                             "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                             "Variant Code" = FIELD ("Variant Filter"),
                                                                             "Posting Date" = FIELD ("Date Filter"),
                                                                             "Lot No." = FIELD ("Lot No. Filter"),
                                                                             "Serial No." = FIELD ("Serial No. Filter")));
            Caption = 'Transferred (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Transferred (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Value Entry"."Sales Amount (Actual)" WHERE ("Item Ledger Entry Type" = CONST (Transfer),
                                                                           "Item No." = FIELD ("No."),
                                                                           "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Transferred (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(95; "Country/Region of Origin Code"; Code[10])
        {
            Caption = 'Country/Region of Origin Code';
            TableRelation = "Country/Region";
        }
        field(96; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
        }
        field(97; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(98; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(99; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(100; Reserve; Option)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Reserve';
            InitValue = Optional;
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(101; "Reserved Qty. on Inventory"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (32),
                                                                           "Source Subtype" = CONST ("0"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Serial No." = FIELD ("Serial No. Filter"),
                                                                           "Lot No." = FIELD ("Lot No. Filter"),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter")));
            Caption = 'Reserved Qty. on Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(102; "Reserved Qty. on Purch. Orders"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (39),
                                                                           "Source Subtype" = CONST ("1"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Reserved Qty. on Purch. Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(103; "Reserved Qty. on Sales Orders"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (37),
                                                                            "Source Subtype" = CONST ("1"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Reserved Qty. on Sales Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(105; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(106; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(107; "Res. Qty. on Outbound Transfer"; Decimal)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (5741),
                                                                            "Source Subtype" = CONST ("0"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Outbound Transfer';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(108; "Res. Qty. on Inbound Transfer"; Decimal)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (5741),
                                                                           "Source Subtype" = CONST ("1"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Inbound Transfer';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(109; "Res. Qty. on Sales Returns"; Decimal)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (37),
                                                                           "Source Subtype" = CONST ("5"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Sales Returns';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(110; "Res. Qty. on Purch. Returns"; Decimal)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (39),
                                                                            "Source Subtype" = CONST ("5"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Purch. Returns';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(120; "Stockout Warning"; Option)
        {
            Caption = 'Stockout Warning';
            OptionCaption = 'Default,No,Yes';
            OptionMembers = Default,No,Yes;
        }
        field(121; "Prevent Negative Inventory"; Option)
        {
            Caption = 'Prevent Negative Inventory';
            OptionCaption = 'Default,No,Yes';
            OptionMembers = Default,No,Yes;
        }
        field(200; "Cost of Open Production Orders"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Cost Amount" WHERE (Status = FILTER (Planned | "Firm Planned" | Released),
                                                                      "Item No." = FIELD ("No.")));
            Caption = 'Cost of Open Production Orders';
            FieldClass = FlowField;
        }
        field(521; "Application Wksh. User ID"; Code[128])
        {
            Caption = 'Application Wksh. User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(910; "Assembly Policy"; Option)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Assembly Policy';
            OptionCaption = 'Assemble-to-Stock,Assemble-to-Order';
            OptionMembers = "Assemble-to-Stock","Assemble-to-Order";
        }
        field(929; "Res. Qty. on Assembly Order"; Decimal)
        {
            AccessByPermission = TableData "BOM Component" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (900),
                                                                           "Source Subtype" = CONST ("1"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Assembly Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(930; "Res. Qty. on  Asm. Comp."; Decimal)
        {
            AccessByPermission = TableData "BOM Component" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (901),
                                                                            "Source Subtype" = CONST ("1"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on  Asm. Comp.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(977; "Qty. on Assembly Order"; Decimal)
        {
            CalcFormula = Sum ("Assembly Header"."Remaining Quantity (Base)" WHERE ("Document Type" = CONST (Order),
                                                                                   "Item No." = FIELD ("No."),
                                                                                   "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Location Code" = FIELD ("Location Filter"),
                                                                                   "Variant Code" = FIELD ("Variant Filter"),
                                                                                   "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Assembly Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(978; "Qty. on Asm. Component"; Decimal)
        {
            CalcFormula = Sum ("Assembly Line"."Remaining Quantity (Base)" WHERE ("Document Type" = CONST (Order),
                                                                                 Type = CONST (Item),
                                                                                 "No." = FIELD ("No."),
                                                                                 "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "Location Code" = FIELD ("Location Filter"),
                                                                                 "Variant Code" = FIELD ("Variant Filter"),
                                                                                 "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Asm. Component';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1001; "Qty. on Job Order"; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Order),
                                                                                 Type = CONST (Item),
                                                                                 "No." = FIELD ("No."),
                                                                                 "Location Code" = FIELD ("Location Filter"),
                                                                                 "Variant Code" = FIELD ("Variant Filter"),
                                                                                 "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Job Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1002; "Res. Qty. on Job Order"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (1003),
                                                                            "Source Subtype" = CONST ("2"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Job Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(1217; GTIN; Code[14])
        {
            Caption = 'GTIN';
            Numeric = true;
        }
        field(1700; "Default Deferral Template Code"; Code[10])
        {
            Caption = 'Default Deferral Template Code';
            TableRelation = "Deferral Template"."Deferral Code";
        }
        field(5400; "Low-Level Code"; Integer)
        {
            Caption = 'Low-Level Code';
            Editable = false;
        }
        field(5401; "Lot Size"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Lot Size';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5402; "Serial Nos."; Code[20])
        {
            Caption = 'Serial Nos.';
            TableRelation = "No. Series";
        }
        field(5403; "Last Unit Cost Calc. Date"; Date)
        {
            Caption = 'Last Unit Cost Calc. Date';
            Editable = false;
        }
        field(5404; "Rolled-up Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Material Cost';
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(5405; "Rolled-up Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Capacity Cost';
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(5407; "Scrap %"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Scrap %';
            DecimalPlaces = 0 : 2;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5409; "Inventory Value Zero"; Boolean)
        {
            Caption = 'Inventory Value Zero';
        }
        field(5410; "Discrete Order Quantity"; Integer)
        {
            Caption = 'Discrete Order Quantity';
            MinValue = 0;
        }
        field(5411; "Minimum Order Quantity"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Minimum Order Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5412; "Maximum Order Quantity"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Maximum Order Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5413; "Safety Stock Quantity"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Safety Stock Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5414; "Order Multiple"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Order Multiple';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5415; "Safety Lead Time"; DateFormula)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Safety Lead Time';
        }
        field(5417; "Flushing Method"; Option)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Flushing Method';
            OptionCaption = 'Manual,Forward,Backward,Pick + Forward,Pick + Backward';
            OptionMembers = Manual,Forward,Backward,"Pick + Forward","Pick + Backward";
        }
        field(5419; "Replenishment System"; Option)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Replenishment System';
            OptionCaption = 'Purchase,Prod. Order,,Assembly';
            OptionMembers = Purchase,"Prod. Order",,Assembly;
        }
        field(5420; "Scheduled Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = FILTER ("Firm Planned" | Released),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'Scheduled Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5421; "Scheduled Need (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Component"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                     "Item No." = FIELD ("No."),
                                                                                     "Variant Code" = FIELD ("Variant Filter"),
                                                                                     "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                     "Location Code" = FIELD ("Location Filter"),
                                                                                     "Due Date" = FIELD ("Date Filter")));
            Caption = 'Scheduled Need (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5422; "Rounding Precision"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Rounding Precision';
            DecimalPlaces = 0 : 5;
            InitValue = 1;
        }
        field(5423; "Bin Filter"; Code[20])
        {
            Caption = 'Bin Filter';
            FieldClass = FlowFilter;
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Filter"));
        }
        field(5424; "Variant Filter"; Code[10])
        {
            Caption = 'Variant Filter';
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5425; "Sales Unit of Measure"; Code[10])
        {
            Caption = 'Sales Unit of Measure';
            TableRelation = IF ("No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(5426; "Purch. Unit of Measure"; Code[10])
        {
            Caption = 'Purch. Unit of Measure';
            TableRelation = IF ("No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(5428; "Time Bucket"; DateFormula)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Time Bucket';
        }
        field(5429; "Reserved Qty. on Prod. Order"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (5406),
                                                                           "Source Subtype" = FILTER ("1" .. "3"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Reserved Qty. on Prod. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5430; "Res. Qty. on Prod. Order Comp."; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (5407),
                                                                            "Source Subtype" = FILTER ("1" .. "3"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Prod. Order Comp.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5431; "Res. Qty. on Req. Line"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                           "Source Type" = CONST (246),
                                                                           "Source Subtype" = FILTER ("0"),
                                                                           "Reservation Status" = CONST (Reservation),
                                                                           "Location Code" = FIELD ("Location Filter"),
                                                                           "Variant Code" = FIELD ("Variant Filter"),
                                                                           "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Req. Line';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5440; "Reordering Policy"; Option)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Reordering Policy';
            OptionCaption = ' ,Fixed Reorder Qty.,Maximum Qty.,Order,Lot-for-Lot';
            OptionMembers = " ","Fixed Reorder Qty.","Maximum Qty.","Order","Lot-for-Lot";
        }
        field(5441; "Include Inventory"; Boolean)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Include Inventory';
        }
        field(5442; "Manufacturing Policy"; Option)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Manufacturing Policy';
            OptionCaption = 'Make-to-Stock,Make-to-Order';
            OptionMembers = "Make-to-Stock","Make-to-Order";
        }
        field(5443; "Rescheduling Period"; DateFormula)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Rescheduling Period';
        }
        field(5444; "Lot Accumulation Period"; DateFormula)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Lot Accumulation Period';
        }
        field(5445; "Dampener Period"; DateFormula)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Dampener Period';
        }
        field(5446; "Dampener Quantity"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Dampener Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5447; "Overflow Level"; Decimal)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Overflow Level';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5449; "Planning Transfer Ship. (Qty)."; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE ("Worksheet Template Name" = FILTER (<> ''),
                                                                          "Journal Batch Name" = FILTER (<> ''),
                                                                          "Replenishment System" = CONST (Transfer),
                                                                          Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Transfer-from Code" = FIELD ("Location Filter"),
                                                                          "Transfer Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Planning Transfer Ship. (Qty).';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5450; "Planning Worksheet (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE ("Planning Line Origin" = CONST (Planning),
                                                                          Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Due Date" = FIELD ("Date Filter"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Planning Worksheet (Qty.)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5700; "Stockkeeping Unit Exists"; Boolean)
        {
            CalcFormula = Exist ("Stockkeeping Unit" WHERE ("Item No." = FIELD ("No.")));
            Caption = 'Stockkeeping Unit Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5701; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            TableRelation = Manufacturer;
        }
        field(5702; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(5703; "Created From Nonstock Item"; Boolean)
        {
            AccessByPermission = TableData "Nonstock Item" = R;
            Caption = 'Created From Catalog Item';
            Editable = false;
        }
        field(5704; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            ObsoleteReason = 'Product Groups became first level children of Item Categories.';
            ObsoleteState = Removed;
        }
        field(5706; "Substitutes Exist"; Boolean)
        {
            CalcFormula = Exist ("Item Substitution" WHERE (Type = CONST (Item),
                                                           "No." = FIELD ("No.")));
            Caption = 'Substitutes Exist';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5707; "Qty. in Transit"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Qty. in Transit (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                              "Item No." = FIELD ("No."),
                                                                              "Transfer-to Code" = FIELD ("Location Filter"),
                                                                              "Variant Code" = FIELD ("Variant Filter"),
                                                                              "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Qty. in Transit';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5708; "Trans. Ord. Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Outstanding Qty. (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                               "Item No." = FIELD ("No."),
                                                                               "Transfer-to Code" = FIELD ("Location Filter"),
                                                                               "Variant Code" = FIELD ("Variant Filter"),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Trans. Ord. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5709; "Trans. Ord. Shipment (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Outstanding Qty. (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                               "Item No." = FIELD ("No."),
                                                                               "Transfer-from Code" = FIELD ("Location Filter"),
                                                                               "Variant Code" = FIELD ("Variant Filter"),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Trans. Ord. Shipment (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5776; "Qty. Assigned to ship"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                                         "Location Code" = FIELD ("Location Filter"),
                                                                                         "Variant Code" = FIELD ("Variant Filter"),
                                                                                         "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. Assigned to ship';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5777; "Qty. Picked"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Shipment Line"."Qty. Picked (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                                    "Location Code" = FIELD ("Location Filter"),
                                                                                    "Variant Code" = FIELD ("Variant Filter"),
                                                                                    "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. Picked';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5900; "Service Item Group"; Code[10])
        {
            Caption = 'Service Item Group';
            TableRelation = "Service Item Group".Code;
        }
        field(5901; "Qty. on Service Order"; Decimal)
        {
            CalcFormula = Sum ("Service Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST (Order),
                                                                              Type = CONST (Item),
                                                                              "No." = FIELD ("No."),
                                                                              "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Location Code" = FIELD ("Location Filter"),
                                                                              "Variant Code" = FIELD ("Variant Filter"),
                                                                              "Needed by Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Service Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5902; "Res. Qty. on Service Orders"; Decimal)
        {
            AccessByPermission = TableData "Service Header" = R;
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                            "Source Type" = CONST (5902),
                                                                            "Source Subtype" = CONST ("1"),
                                                                            "Reservation Status" = CONST (Reservation),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Res. Qty. on Service Orders';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(6500; "Item Tracking Code"; Code[10])
        {
            Caption = 'Item Tracking Code';
            TableRelation = "Item Tracking Code";
        }
        field(6501; "Lot Nos."; Code[20])
        {
            Caption = 'Lot Nos.';
            TableRelation = "No. Series";
        }
        field(6502; "Expiration Calculation"; DateFormula)
        {
            Caption = 'Expiration Calculation';
        }
        field(6503; "Lot No. Filter"; Code[50])
        {
            Caption = 'Lot No. Filter';
            FieldClass = FlowFilter;
        }
        field(6504; "Serial No. Filter"; Code[50])
        {
            Caption = 'Serial No. Filter';
            FieldClass = FlowFilter;
        }
        field(6650; "Qty. on Purch. Return"; Decimal)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Sum ("Purchase Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST ("Return Order"),
                                                                               Type = CONST (Item),
                                                                               "No." = FIELD ("No."),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Location Code" = FIELD ("Location Filter"),
                                                                               "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                               "Variant Code" = FIELD ("Variant Filter"),
                                                                               "Expected Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Purch. Return';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(6660; "Qty. on Sales Return"; Decimal)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Sum ("Sales Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST ("Return Order"),
                                                                            Type = CONST (Item),
                                                                            "No." = FIELD ("No."),
                                                                            "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                            "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                            "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                            "Variant Code" = FIELD ("Variant Filter"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Sales Return';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(7171; "No. of Substitutes"; Integer)
        {
            CalcFormula = Count ("Item Substitution" WHERE (Type = CONST (Item),
                                                           "No." = FIELD ("No.")));
            Caption = 'No. of Substitutes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7300; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            TableRelation = "Warehouse Class";
        }
        field(7301; "Special Equipment Code"; Code[10])
        {
            Caption = 'Special Equipment Code';
            TableRelation = "Special Equipment";
        }
        field(7302; "Put-away Template Code"; Code[10])
        {
            Caption = 'Put-away Template Code';
            TableRelation = "Put-away Template Header";
        }
        field(7307; "Put-away Unit of Measure Code"; Code[10])
        {
            AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
            Caption = 'Put-away Unit of Measure Code';
            TableRelation = IF ("No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(7380; "Phys Invt Counting Period Code"; Code[10])
        {
            Caption = 'Phys Invt Counting Period Code';
            TableRelation = "Phys. Invt. Counting Period";
        }
        field(7381; "Last Counting Period Update"; Date)
        {
            AccessByPermission = TableData "Phys. Invt. Item Selection" = R;
            Caption = 'Last Counting Period Update';
            Editable = false;
        }
        field(7383; "Last Phys. Invt. Date"; Date)
        {
            CalcFormula = Max ("Phys. Inventory Ledger Entry"."Posting Date" WHERE ("Item No." = FIELD ("No."),
                                                                                   "Phys Invt Counting Period Type" = FILTER (" " | Item)));
            Caption = 'Last Phys. Invt. Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7384; "Use Cross-Docking"; Boolean)
        {
            AccessByPermission = TableData "Bin Content" = R;
            Caption = 'Use Cross-Docking';
            InitValue = true;
        }
        field(7385; "Next Counting Start Date"; Date)
        {
            Caption = 'Next Counting Start Date';
            Editable = false;
        }
        field(7386; "Next Counting End Date"; Date)
        {
            Caption = 'Next Counting End Date';
            Editable = false;
        }
        field(7700; "Identifier Code"; Code[20])
        {
            CalcFormula = Lookup ("Item Identifier".Code WHERE ("Item No." = FIELD ("No.")));
            Caption = 'Identifier Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Unit of Measure Id"; Guid)
        {
            Caption = 'Unit of Measure Id';
            TableRelation = "Unit of Measure".Id;
        }
        field(8002; "Tax Group Id"; Guid)
        {
            Caption = 'Tax Group Id';
            TableRelation = "Tax Group".Id;
        }
        field(8003; "Sales Blocked"; Boolean)
        {
            Caption = 'Sales Blocked';
            DataClassification = CustomerContent;
        }
        field(8004; "Purchasing Blocked"; Boolean)
        {
            Caption = 'Purchasing Blocked';
            DataClassification = CustomerContent;
        }
        field(8005; "Item Category Id"; Guid)
        {
            Caption = 'Item Category Id';
            DataClassification = SystemMetadata;
            TableRelation = "Item Category".Id;
        }
        field(10500; "Reverse Charge Applies"; Boolean)
        {
            Caption = 'Reverse Charge Applies';
        }
        field(99000750; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
        field(99000751; "Production BOM No."; Code[20])
        {
            Caption = 'Production BOM No.';
            TableRelation = "Production BOM Header";
        }
        field(99000752; "Single-Level Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Material Cost';
            Editable = false;
        }
        field(99000753; "Single-Level Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Capacity Cost';
            Editable = false;
        }
        field(99000754; "Single-Level Subcontrd. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Subcontrd. Cost';
            Editable = false;
        }
        field(99000755; "Single-Level Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Cap. Ovhd Cost';
            Editable = false;
        }
        field(99000756; "Single-Level Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Level Mfg. Ovhd Cost';
            Editable = false;
        }
        field(99000757; "Overhead Rate"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            AutoFormatType = 2;
            Caption = 'Overhead Rate';
        }
        field(99000758; "Rolled-up Subcontracted Cost"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            AutoFormatType = 2;
            Caption = 'Rolled-up Subcontracted Cost';
            Editable = false;
        }
        field(99000759; "Rolled-up Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Mfg. Ovhd Cost';
            Editable = false;
        }
        field(99000760; "Rolled-up Cap. Overhead Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Cap. Overhead Cost';
            Editable = false;
        }
        field(99000761; "Planning Issues (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Planning Component"."Expected Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                                     "Due Date" = FIELD ("Date Filter"),
                                                                                     "Location Code" = FIELD ("Location Filter"),
                                                                                     "Variant Code" = FIELD ("Variant Filter"),
                                                                                     "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                     "Planning Line Origin" = CONST (" ")));
            Caption = 'Planning Issues (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000762; "Planning Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Due Date" = FIELD ("Date Filter"),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Planning Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000765; "Planned Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Planned),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'Planned Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000766; "FP Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST ("Firm Planned"),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'FP Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000767; "Rel. Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Released),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'Rel. Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000768; "Planning Release (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Starting Date" = FIELD ("Date Filter"),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter")));
            Caption = 'Planning Release (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000769; "Planned Order Release (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Planned),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Starting Date" = FIELD ("Date Filter")));
            Caption = 'Planned Order Release (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000770; "Purch. Req. Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Due Date" = FIELD ("Date Filter"),
                                                                          "Planning Line Origin" = CONST (" ")));
            Caption = 'Purch. Req. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000771; "Purch. Req. Release (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("No."),
                                                                          "Location Code" = FIELD ("Location Filter"),
                                                                          "Variant Code" = FIELD ("Variant Filter"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Order Date" = FIELD ("Date Filter")));
            Caption = 'Purch. Req. Release (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000773; "Order Tracking Policy"; Option)
        {
            Caption = 'Order Tracking Policy';
            OptionCaption = 'None,Tracking Only,Tracking & Action Msg.';
            OptionMembers = "None","Tracking Only","Tracking & Action Msg.";
        }
        field(99000774; "Prod. Forecast Quantity (Base)"; Decimal)
        {
            CalcFormula = Sum ("Production Forecast Entry"."Forecast Quantity (Base)" WHERE ("Item No." = FIELD ("No."),
                                                                                            "Production Forecast Name" = FIELD ("Production Forecast Name"),
                                                                                            "Forecast Date" = FIELD ("Date Filter"),
                                                                                            "Location Code" = FIELD ("Location Filter"),
                                                                                            "Component Forecast" = FIELD ("Component Forecast")));
            Caption = 'Prod. Forecast Quantity (Base)';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(99000775; "Production Forecast Name"; Code[10])
        {
            Caption = 'Production Forecast Name';
            FieldClass = FlowFilter;
            TableRelation = "Production Forecast Name";
        }
        field(99000776; "Component Forecast"; Boolean)
        {
            Caption = 'Component Forecast';
            FieldClass = FlowFilter;
        }
        field(99000777; "Qty. on Prod. Order"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                "Item No." = FIELD ("No."),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Filter"),
                                                                                "Variant Code" = FIELD ("Variant Filter"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Prod. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000778; "Qty. on Component Lines"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Component"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                     "Item No." = FIELD ("No."),
                                                                                     "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                     "Location Code" = FIELD ("Location Filter"),
                                                                                     "Variant Code" = FIELD ("Variant Filter"),
                                                                                     "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Component Lines';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000875; Critical; Boolean)
        {
            Caption = 'Critical';
        }
        field(99008500; "Common Item No."; Code[20])
        {
            Caption = 'Common Item No.';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Description")
        {
        }
        key(Key3; "Inventory Posting Group")
        {
        }
        key(Key4; "Shelf No.")
        {
        }
        key(Key5; "Vendor No.")
        {
        }
        key(Key6; "Gen. Prod. Posting Group")
        {
        }
        key(Key7; "Low-Level Code")
        {
        }
        key(Key8; "Production BOM No.")
        {
        }
        key(Key9; "Routing No.")
        {
        }
        key(Key10; "Vendor Item No.", "Vendor No.")
        {
        }
        key(Key11; "Common Item No.")
        {
        }
        key(Key12; "Service Item Group")
        {
        }
        key(Key13; "Cost is Adjusted", "Allow Online Adjustment")
        {
        }
        key(Key14; Description)
        {
        }
        key(Key15; "Base Unit of Measure")
        {
        }
        key(Key16; Type)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Base Unit of Measure", "Unit Price")
        {
        }
        fieldgroup(Brick; "No.", Description, Inventory, "Unit Price", "Base Unit of Measure", "Description 2", Picture)
        {
        }
    }
}

