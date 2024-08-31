table 5700 "Stockkeeping Unit"
{
    Caption = 'Stockkeeping Unit';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(4; Description; Text[100])
        {
            CalcFormula = Lookup (Item.Description WHERE ("No." = FIELD ("Item No.")));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Description 2"; Text[50])
        {
            CalcFormula = Lookup (Item."Description 2" WHERE ("No." = FIELD ("Item No.")));
            Caption = 'Description 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Assembly BOM"; Boolean)
        {
            CalcFormula = Exist ("BOM Component" WHERE ("Parent Item No." = FIELD ("Item No.")));
            Caption = 'Assembly BOM';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Shelf No."; Code[10])
        {
            Caption = 'Shelf No.';
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
        field(31; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(32; "Vendor Item No."; Text[20])
        {
            Caption = 'Vendor Item No.';
        }
        field(33; "Lead Time Calculation"; DateFormula)
        {
            Caption = 'Lead Time Calculation';
        }
        field(34; "Reorder Point"; Decimal)
        {
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
            Caption = 'Reorder Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(53; Comment; Boolean)
        {
            CalcFormula = Exist ("Stockkeeping Unit Comment Line" WHERE ("Item No." = FIELD ("Item No."),
                                                                        "Variant Code" = FIELD ("Variant Code"),
                                                                        "Location Code" = FIELD ("Location Code")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
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
        field(68; Inventory; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Item No." = FIELD ("Item No."),
                                                                  "Location Code" = FIELD ("Location Code"),
                                                                  "Global Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                  "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD ("Variant Code")));
            Caption = 'Inventory';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(84; "Qty. on Purch. Order"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Purchase Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST (Order),
                                                                               Type = CONST (Item),
                                                                               "No." = FIELD ("Item No."),
                                                                               "Location Code" = FIELD ("Location Code"),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                               "Variant Code" = FIELD ("Variant Code"),
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
                                                                            "No." = FIELD ("Item No."),
                                                                            "Location Code" = FIELD ("Location Code"),
                                                                            "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                            "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                            "Drop Shipment" = FIELD ("Drop Shipment Filter"),
                                                                            "Variant Code" = FIELD ("Variant Code"),
                                                                            "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Sales Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(89; "Drop Shipment Filter"; Boolean)
        {
            Caption = 'Drop Shipment Filter';
            FieldClass = FlowFilter;
        }
        field(910; "Assembly Policy"; Option)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Assembly Policy';
            OptionCaption = 'Assemble-to-Stock,Assemble-to-Order';
            OptionMembers = "Assemble-to-Stock","Assemble-to-Order";
        }
        field(977; "Qty. on Assembly Order"; Decimal)
        {
            CalcFormula = Sum ("Assembly Header"."Remaining Quantity (Base)" WHERE ("Document Type" = CONST (Order),
                                                                                   "Item No." = FIELD ("Item No."),
                                                                                   "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                   "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                   "Location Code" = FIELD ("Location Code"),
                                                                                   "Variant Code" = FIELD ("Variant Code"),
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
                                                                                 "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                 "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                 "No." = FIELD ("Item No."),
                                                                                 "Location Code" = FIELD ("Location Code"),
                                                                                 "Variant Code" = FIELD ("Variant Code"),
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
                                                                                 "No." = FIELD ("Item No."),
                                                                                 "Location Code" = FIELD ("Location Code"),
                                                                                 "Variant Code" = FIELD ("Variant Code"),
                                                                                 "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Job Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5400; "Transfer-Level Code"; Integer)
        {
            Caption = 'Transfer-Level Code';
            Editable = false;
        }
        field(5401; "Lot Size"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Lot Size';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5410; "Discrete Order Quantity"; Integer)
        {
            Caption = 'Discrete Order Quantity';
            MinValue = 0;
        }
        field(5411; "Minimum Order Quantity"; Decimal)
        {
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
        field(5416; "Components at Location"; Code[10])
        {
            Caption = 'Components at Location';
            TableRelation = Location;
        }
        field(5417; "Flushing Method"; Option)
        {
            Caption = 'Flushing Method';
            OptionCaption = 'Manual,Forward,Backward,Pick + Forward,Pick + Backward';
            OptionMembers = Manual,Forward,Backward,"Pick + Forward","Pick + Backward";
        }
        field(5419; "Replenishment System"; Option)
        {
            Caption = 'Replenishment System';
            OptionCaption = 'Purchase,Prod. Order,Transfer,Assembly';
            OptionMembers = Purchase,"Prod. Order",Transfer,Assembly;
        }
        field(5420; "Scheduled Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Ending Date" = FIELD ("Date Filter")));
            Caption = 'Scheduled Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5421; "Scheduled Need (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Component"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                     "Item No." = FIELD ("Item No."),
                                                                                     "Location Code" = FIELD ("Location Code"),
                                                                                     "Variant Code" = FIELD ("Variant Code"),
                                                                                     "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                     "Due Date" = FIELD ("Date Filter")));
            Caption = 'Scheduled Need (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5423; "Bin Filter"; Code[20])
        {
            Caption = 'Bin Filter';
            FieldClass = FlowFilter;
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(5428; "Time Bucket"; DateFormula)
        {
            Caption = 'Time Bucket';
        }
        field(5440; "Reordering Policy"; Option)
        {
            Caption = 'Reordering Policy';
            OptionCaption = ' ,Fixed Reorder Qty.,Maximum Qty.,Order,Lot-for-Lot';
            OptionMembers = " ","Fixed Reorder Qty.","Maximum Qty.","Order","Lot-for-Lot";
        }
        field(5441; "Include Inventory"; Boolean)
        {
            Caption = 'Include Inventory';
        }
        field(5442; "Manufacturing Policy"; Option)
        {
            Caption = 'Manufacturing Policy';
            OptionCaption = 'Make-to-Stock,Make-to-Order';
            OptionMembers = "Make-to-Stock","Make-to-Order";
        }
        field(5443; "Rescheduling Period"; DateFormula)
        {
            Caption = 'Rescheduling Period';
        }
        field(5444; "Lot Accumulation Period"; DateFormula)
        {
            Caption = 'Lot Accumulation Period';
        }
        field(5445; "Dampener Period"; DateFormula)
        {
            Caption = 'Dampener Period';
        }
        field(5446; "Dampener Quantity"; Decimal)
        {
            Caption = 'Dampener Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5447; "Overflow Level"; Decimal)
        {
            Caption = 'Overflow Level';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(5700; "Transfer-from Code"; Code[10])
        {
            Caption = 'Transfer-from Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(5701; "Qty. in Transit"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Qty. in Transit (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                              "Item No." = FIELD ("Item No."),
                                                                              "Transfer-to Code" = FIELD ("Location Code"),
                                                                              "Variant Code" = FIELD ("Variant Code"),
                                                                              "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Qty. in Transit';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5702; "Trans. Ord. Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Outstanding Qty. (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                               "Item No." = FIELD ("Item No."),
                                                                               "Transfer-to Code" = FIELD ("Location Code"),
                                                                               "Variant Code" = FIELD ("Variant Code"),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Receipt Date" = FIELD ("Date Filter")));
            Caption = 'Trans. Ord. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5703; "Trans. Ord. Shipment (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Transfer Line"."Outstanding Qty. (Base)" WHERE ("Derived From Line No." = CONST (0),
                                                                               "Item No." = FIELD ("Item No."),
                                                                               "Transfer-from Code" = FIELD ("Location Code"),
                                                                               "Variant Code" = FIELD ("Variant Code"),
                                                                               "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                               "Shipment Date" = FIELD ("Date Filter")));
            Caption = 'Trans. Ord. Shipment (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5901; "Qty. on Service Order"; Decimal)
        {
            CalcFormula = Sum ("Service Line"."Outstanding Qty. (Base)" WHERE ("Document Type" = CONST (Order),
                                                                              Type = CONST (Item),
                                                                              "No." = FIELD ("Item No."),
                                                                              "Location Code" = FIELD ("Location Code"),
                                                                              "Variant Code" = FIELD ("Variant Code"),
                                                                              "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                              "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                              "Needed by Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Service Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
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
            Caption = 'Put-away Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(7380; "Phys Invt Counting Period Code"; Code[10])
        {
            Caption = 'Phys Invt Counting Period Code';
            TableRelation = "Phys. Invt. Counting Period";
        }
        field(7381; "Last Counting Period Update"; Date)
        {
            Caption = 'Last Counting Period Update';
            Editable = false;
        }
        field(7383; "Last Phys. Invt. Date"; Date)
        {
            CalcFormula = Max ("Phys. Inventory Ledger Entry"."Posting Date" WHERE ("Item No." = FIELD ("Item No."),
                                                                                   "Location Code" = FIELD ("Location Code"),
                                                                                   "Variant Code" = FIELD ("Variant Code"),
                                                                                   "Phys Invt Counting Period Type" = FILTER (" " | SKU)));
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
        }
        field(7386; "Next Counting End Date"; Date)
        {
            Caption = 'Next Counting End Date';
        }
        field(99000765; "Planned Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Planned),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Ending Date" = FIELD ("Date Filter")));
            Caption = 'Planned Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000766; "FP Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST ("Firm Planned"),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Ending Date" = FIELD ("Date Filter")));
            Caption = 'FP Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000767; "Rel. Order Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Released),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Ending Date" = FIELD ("Date Filter")));
            Caption = 'Rel. Order Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000769; "Planned Order Release (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = CONST (Planned),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Starting Date" = FIELD ("Date Filter")));
            Caption = 'Planned Order Release (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000770; "Purch. Req. Receipt (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("Item No."),
                                                                          "Location Code" = FIELD ("Location Code"),
                                                                          "Variant Code" = FIELD ("Variant Code"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Due Date" = FIELD ("Date Filter")));
            Caption = 'Purch. Req. Receipt (Qty.)';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(99000771; "Purch. Req. Release (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Requisition Line"."Quantity (Base)" WHERE (Type = CONST (Item),
                                                                          "No." = FIELD ("Item No."),
                                                                          "Location Code" = FIELD ("Location Code"),
                                                                          "Variant Code" = FIELD ("Variant Code"),
                                                                          "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                          "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                          "Order Date" = FIELD ("Date Filter")));
            Caption = 'Purch. Req. Release (Qty.)';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(99000777; "Qty. on Prod. Order"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Line"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                "Item No." = FIELD ("Item No."),
                                                                                "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                "Location Code" = FIELD ("Location Code"),
                                                                                "Variant Code" = FIELD ("Variant Code"),
                                                                                "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Prod. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000778; "Qty. on Component Lines"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Component"."Remaining Qty. (Base)" WHERE (Status = FILTER (Planned .. Released),
                                                                                     "Item No." = FIELD ("Item No."),
                                                                                     "Shortcut Dimension 1 Code" = FIELD ("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = FIELD ("Global Dimension 2 Filter"),
                                                                                     "Location Code" = FIELD ("Location Code"),
                                                                                     "Variant Code" = FIELD ("Variant Code"),
                                                                                     "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Component Lines';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Location Code", "Item No.", "Variant Code")
        {
            Clustered = true;
        }
        key(Key2; "Replenishment System", "Vendor No.", "Transfer-from Code")
        {
        }
        key(Key3; "Item No.", "Location Code", "Variant Code")
        {
        }
        key(Key4; "Item No.", "Transfer-Level Code")
        {
        }
    }

    fieldgroups
    {
    }
}

