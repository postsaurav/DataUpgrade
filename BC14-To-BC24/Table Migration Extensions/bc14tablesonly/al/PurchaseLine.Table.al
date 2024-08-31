table 39 "Purchase Line"
{
    Caption = 'Purchase Line';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            Editable = false;
            TableRelation = Vendor;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Purchase Header"."No." WHERE ("Document Type" = FIELD ("Document Type"));
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (" ")) "Standard Text"
            ELSE
            IF (Type = CONST ("G/L Account"),
                                     "System-Created Entry" = CONST (false)) "G/L Account" WHERE ("Direct Posting" = CONST (true),
                                                                                               "Account Type" = CONST (Posting),
                                                                                               Blocked = CONST (false))
            ELSE
            IF (Type = CONST ("G/L Account"),
                                                                                                        "System-Created Entry" = CONST (true)) "G/L Account"
            ELSE
            IF (Type = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST ("Charge (Item)")) "Item Charge"
            ELSE
            IF (Type = CONST (Item),
                                                                                                                 "Document Type" = FILTER (<> "Credit Memo" & <> "Return Order")) Item WHERE (Blocked = CONST (false),
                                                                                                                                                                                       "Purchasing Blocked" = CONST (false))
            ELSE
            IF (Type = CONST (Item),
                                                                                                                                                                                                "Document Type" = FILTER ("Credit Memo" | "Return Order")) Item WHERE (Blocked = CONST (false));
            ValidateTableRelation = false;
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(8; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = IF (Type = CONST (Item)) "Inventory Posting Group"
            ELSE
            IF (Type = CONST ("Fixed Asset")) "FA Posting Group";
        }
        field(10; "Expected Receipt Date"; Date)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Expected Receipt Date';
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
            TableRelation = IF (Type = CONST ("G/L Account"),
                                "System-Created Entry" = CONST (false)) "G/L Account".Name WHERE ("Direct Posting" = CONST (true),
                                                                                               "Account Type" = CONST (Posting),
                                                                                               Blocked = CONST (false))
            ELSE
            IF (Type = CONST ("G/L Account"),
                                                                                                        "System-Created Entry" = CONST (true)) "G/L Account".Name
            ELSE
            IF (Type = CONST (Item),
                                                                                                                 "Document Type" = FILTER (<> "Credit Memo" & <> "Return Order")) Item.Description WHERE (Blocked = CONST (false),
                                                                                                                                                                                                   "Purchasing Blocked" = CONST (false))
            ELSE
            IF (Type = CONST (Item),
                                                                                                                                                                                                            "Document Type" = FILTER ("Credit Memo" | "Return Order")) Item.Description WHERE (Blocked = CONST (false))
            ELSE
            IF (Type = CONST ("Fixed Asset")) "Fixed Asset".Description
            ELSE
            IF (Type = CONST ("Charge (Item)")) "Item Charge".Description;
            ValidateTableRelation = false;
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
        field(16; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(17; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;
        }
        field(18; "Qty. to Receive"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Qty. to Receive';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Direct Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
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
        field(28; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
        }
        field(29; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;
        }
        field(30; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            Editable = false;
        }
        field(31; "Unit Price (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price (LCY)';
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
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1),
                                                          Blocked = CONST (false));
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2),
                                                          Blocked = CONST (false));
        }
        field(45; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(54; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(56; "Recalculate Invoice Disc."; Boolean)
        {
            Caption = 'Recalculate Invoice Disc.';
            Editable = false;
        }
        field(57; "Outstanding Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Outstanding Amount';
            Editable = false;
        }
        field(58; "Qty. Rcd. Not Invoiced"; Decimal)
        {
            Caption = 'Qty. Rcd. Not Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(59; "Amt. Rcd. Not Invoiced"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amt. Rcd. Not Invoiced';
            Editable = false;
        }
        field(60; "Quantity Received"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Quantity Received';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(61; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(63; "Receipt No."; Code[20])
        {
            Caption = 'Receipt No.';
            Editable = false;
        }
        field(64; "Receipt Line No."; Integer)
        {
            Caption = 'Receipt Line No.';
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
        field(67; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(68; "Pay-to Vendor No."; Code[20])
        {
            Caption = 'Pay-to Vendor No.';
            Editable = false;
            TableRelation = Vendor;
        }
        field(69; "Inv. Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount Amount';
            Editable = false;
        }
        field(70; "Vendor Item No."; Text[20])
        {
            Caption = 'Vendor Item No.';
        }
        field(71; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            Editable = false;
            TableRelation = IF ("Drop Shipment" = CONST (true)) "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(72; "Sales Order Line No."; Integer)
        {
            Caption = 'Sales Order Line No.';
            Editable = false;
            TableRelation = IF ("Drop Shipment" = CONST (true)) "Sales Line"."Line No." WHERE ("Document Type" = CONST (Order),
                                                                                            "Document No." = FIELD ("Sales Order No."));
        }
        field(73; "Drop Shipment"; Boolean)
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Drop Shipment';
            Editable = false;
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
            TableRelation = "Purchase Line"."Line No." WHERE ("Document Type" = FIELD ("Document Type"),
                                                              "Document No." = FIELD ("Document No."));
        }
        field(81; "Entry Point"; Code[10])
        {
            Caption = 'Entry Point';
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
        field(88; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
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
        field(92; "Outstanding Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Outstanding Amount (LCY)';
            Editable = false;
        }
        field(93; "Amt. Rcd. Not Invoiced (LCY)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            Caption = 'Amt. Rcd. Not Invoiced (LCY)';
            Editable = false;
        }
        field(95; "Reserved Quantity"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Sum ("Reservation Entry".Quantity WHERE ("Source ID" = FIELD ("Document No."),
                                                                  "Source Ref. No." = FIELD ("Line No."),
                                                                  "Source Type" = CONST (39),
                                                                  "Source Subtype" = FIELD ("Document Type"),
                                                                  "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(97; "Blanket Order No."; Code[20])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Blanket Order No.';
            TableRelation = "Purchase Header"."No." WHERE ("Document Type" = CONST ("Blanket Order"));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(98; "Blanket Order Line No."; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Blanket Order Line No.';
            TableRelation = "Purchase Line"."Line No." WHERE ("Document Type" = CONST ("Blanket Order"),
                                                              "Document No." = FIELD ("Blanket Order No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(99; "VAT Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
            Editable = false;
        }
        field(100; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            Editable = false;
        }
        field(101; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(103; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
        }
        field(104; "VAT Difference"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            Editable = false;
        }
        field(105; "Inv. Disc. Amount to Invoice"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Disc. Amount to Invoice';
            Editable = false;
        }
        field(106; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier';
            Editable = false;
        }
        field(107; "IC Partner Ref. Type"; Option)
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'IC Partner Ref. Type';
            OptionCaption = ' ,G/L Account,Item,,,Charge (Item),Cross Reference,Common Item No.,Vendor Item No.';
            OptionMembers = " ","G/L Account",Item,,,"Charge (Item)","Cross Reference","Common Item No.","Vendor Item No.";
        }
        field(108; "IC Partner Reference"; Code[20])
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'IC Partner Reference';
        }
        field(109; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(110; "Prepmt. Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Line Amount';
            MinValue = 0;
        }
        field(111; "Prepmt. Amt. Inv."; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Amt. Inv.';
            Editable = false;
        }
        field(112; "Prepmt. Amt. Incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Amt. Incl. VAT';
            Editable = false;
        }
        field(113; "Prepayment Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepayment Amount';
            Editable = false;
        }
        field(114; "Prepmt. VAT Base Amt."; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. VAT Base Amt.';
            Editable = false;
        }
        field(115; "Prepayment VAT %"; Decimal)
        {
            Caption = 'Prepayment VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(116; "Prepmt. VAT Calc. Type"; Option)
        {
            Caption = 'Prepmt. VAT Calc. Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(117; "Prepayment VAT Identifier"; Code[20])
        {
            Caption = 'Prepayment VAT Identifier';
            Editable = false;
        }
        field(118; "Prepayment Tax Area Code"; Code[20])
        {
            Caption = 'Prepayment Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(119; "Prepayment Tax Liable"; Boolean)
        {
            Caption = 'Prepayment Tax Liable';
        }
        field(120; "Prepayment Tax Group Code"; Code[20])
        {
            Caption = 'Prepayment Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(121; "Prepmt Amt to Deduct"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt Amt to Deduct';
            MinValue = 0;
        }
        field(122; "Prepmt Amt Deducted"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt Amt Deducted';
            Editable = false;
        }
        field(123; "Prepayment Line"; Boolean)
        {
            Caption = 'Prepayment Line';
            Editable = false;
        }
        field(124; "Prepmt. Amount Inv. Incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Amount Inv. Incl. VAT';
            Editable = false;
        }
        field(129; "Prepmt. Amount Inv. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt. Amount Inv. (LCY)';
            Editable = false;
        }
        field(130; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(132; "Prepmt. VAT Amount Inv. (LCY)"; Decimal)
        {
            Caption = 'Prepmt. VAT Amount Inv. (LCY)';
            Editable = false;
        }
        field(135; "Prepayment VAT Difference"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepayment VAT Difference';
            Editable = false;
        }
        field(136; "Prepmt VAT Diff. to Deduct"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt VAT Diff. to Deduct';
            Editable = false;
        }
        field(137; "Prepmt VAT Diff. Deducted"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Prepmt VAT Diff. Deducted';
            Editable = false;
        }
        field(140; "Outstanding Amt. Ex. VAT (LCY)"; Decimal)
        {
            Caption = 'Outstanding Amt. Ex. VAT (LCY)';
        }
        field(141; "A. Rcd. Not Inv. Ex. VAT (LCY)"; Decimal)
        {
            Caption = 'A. Rcd. Not Inv. Ex. VAT (LCY)';
        }
        field(145; "Pmt. Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Pmt. Discount Amount';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(1002; "Job Line Type"; Option)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Line Type';
            OptionCaption = ' ,Budget,Billable,Both Budget and Billable';
            OptionMembers = " ",Budget,Billable,"Both Budget and Billable";
        }
        field(1003; "Job Unit Price"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Unit Price';
        }
        field(1004; "Job Total Price"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Total Price';
            Editable = false;
        }
        field(1005; "Job Line Amount"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Job Line Amount';
        }
        field(1006; "Job Line Discount Amount"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Job Line Discount Amount';
        }
        field(1007; "Job Line Discount %"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(1008; "Job Unit Price (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Unit Price (LCY)';
            Editable = false;
        }
        field(1009; "Job Total Price (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Total Price (LCY)';
            Editable = false;
        }
        field(1010; "Job Line Amount (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Job Line Amount (LCY)';
            Editable = false;
        }
        field(1011; "Job Line Disc. Amount (LCY)"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Job Line Disc. Amount (LCY)';
            Editable = false;
        }
        field(1012; "Job Currency Factor"; Decimal)
        {
            BlankZero = true;
            Caption = 'Job Currency Factor';
        }
        field(1013; "Job Currency Code"; Code[20])
        {
            Caption = 'Job Currency Code';
        }
        field(1019; "Job Planning Line No."; Integer)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Planning Line No.';
        }
        field(1030; "Job Remaining Qty."; Decimal)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Remaining Qty.';
            DecimalPlaces = 0 : 5;
        }
        field(1031; "Job Remaining Qty. (Base)"; Decimal)
        {
            Caption = 'Job Remaining Qty. (Base)';
        }
        field(1700; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            TableRelation = "Deferral Template"."Deferral Code";
        }
        field(1702; "Returns Deferral Start Date"; Date)
        {
            Caption = 'Returns Deferral Start Date';
        }
        field(5401; "Prod. Order No."; Code[20])
        {
            AccessByPermission = TableData "Machine Center" = R;
            Caption = 'Prod. Order No.';
            Editable = false;
            TableRelation = "Production Order"."No." WHERE (Status = CONST (Released));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5403; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Document Type" = FILTER (Order | Invoice),
                                Quantity = FILTER (< 0)) "Bin Content"."Bin Code" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                     "Item No." = FIELD ("No."),
                                                                                     "Variant Code" = FIELD ("Variant Code"))
            ELSE
            IF ("Document Type" = FILTER ("Return Order" | "Credit Memo"),
                                                                                              Quantity = FILTER (>= 0)) "Bin Content"."Bin Code" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                                                                                    "Item No." = FIELD ("No."),
                                                                                                                                                    "Variant Code" = FIELD ("Variant Code"))
            ELSE
            Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
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
            TableRelation = IF (Type = CONST (Item),
                                "No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(5415; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5416; "Outstanding Qty. (Base)"; Decimal)
        {
            Caption = 'Outstanding Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5417; "Qty. to Invoice (Base)"; Decimal)
        {
            Caption = 'Qty. to Invoice (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5418; "Qty. to Receive (Base)"; Decimal)
        {
            Caption = 'Qty. to Receive (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5458; "Qty. Rcd. Not Invoiced (Base)"; Decimal)
        {
            Caption = 'Qty. Rcd. Not Invoiced (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5460; "Qty. Received (Base)"; Decimal)
        {
            Caption = 'Qty. Received (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5461; "Qty. Invoiced (Base)"; Decimal)
        {
            Caption = 'Qty. Invoiced (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5495; "Reserved Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Source Type" = CONST (39),
                                                                           "Source Subtype" = FIELD ("Document Type"),
                                                                           "Source ID" = FIELD ("Document No."),
                                                                           "Source Ref. No." = FIELD ("Line No."),
                                                                           "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(5601; "FA Posting Type"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Posting Type';
            OptionCaption = ' ,Acquisition Cost,Maintenance,,Appreciation';
            OptionMembers = " ","Acquisition Cost",Maintenance,,Appreciation;
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";
        }
        field(5603; "Salvage Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Salvage Value';
        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'Depr. until FA Posting Date';
        }
        field(5606; "Depr. Acquisition Cost"; Boolean)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'Depr. Acquisition Cost';
        }
        field(5609; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            TableRelation = Maintenance;
        }
        field(5610; "Insurance No."; Code[20])
        {
            Caption = 'Insurance No.';
            TableRelation = Insurance;
        }
        field(5611; "Budgeted FA No."; Code[20])
        {
            Caption = 'Budgeted FA No.';
            TableRelation = "Fixed Asset";
        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {
            Caption = 'Duplicate in Depreciation Book';
            TableRelation = "Depreciation Book";
        }
        field(5613; "Use Duplication List"; Boolean)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'Use Duplication List';
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            Editable = false;
            TableRelation = "Responsibility Center";
        }
        field(5705; "Cross-Reference No."; Code[20])
        {
            AccessByPermission = TableData "Item Cross Reference" = R;
            Caption = 'Cross-Reference No.';
        }
        field(5706; "Unit of Measure (Cross Ref.)"; Code[10])
        {
            Caption = 'Unit of Measure (Cross Ref.)';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5707; "Cross-Reference Type"; Option)
        {
            Caption = 'Cross-Reference Type';
            OptionCaption = ' ,Customer,Vendor,Bar Code';
            OptionMembers = " ",Customer,Vendor,"Bar Code";
        }
        field(5708; "Cross-Reference Type No."; Code[30])
        {
            Caption = 'Cross-Reference Type No.';
        }
        field(5709; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(5710; Nonstock; Boolean)
        {
            AccessByPermission = TableData "Nonstock Item" = R;
            Caption = 'Catalog';
        }
        field(5711; "Purchasing Code"; Code[10])
        {
            Caption = 'Purchasing Code';
            Editable = false;
            TableRelation = Purchasing;
        }
        field(5712; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            ObsoleteReason = 'Product Groups became first level children of Item Categories.';
            ObsoleteState = Removed;
            TableRelation = "Product Group".Code WHERE ("Item Category Code" = FIELD ("Item Category Code"));
            ValidateTableRelation = false;
        }
        field(5713; "Special Order"; Boolean)
        {
            Caption = 'Special Order';
        }
        field(5714; "Special Order Sales No."; Code[20])
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Special Order Sales No.';
            TableRelation = IF ("Special Order" = CONST (true)) "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(5715; "Special Order Sales Line No."; Integer)
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Special Order Sales Line No.';
            TableRelation = IF ("Special Order" = CONST (true)) "Sales Line"."Line No." WHERE ("Document Type" = CONST (Order),
                                                                                            "Document No." = FIELD ("Special Order Sales No."));
        }
        field(5750; "Whse. Outstanding Qty. (Base)"; Decimal)
        {
            AccessByPermission = TableData Location = R;
            BlankZero = true;
            CalcFormula = Sum ("Warehouse Receipt Line"."Qty. Outstanding (Base)" WHERE ("Source Type" = CONST (39),
                                                                                        "Source Subtype" = FIELD ("Document Type"),
                                                                                        "Source No." = FIELD ("Document No."),
                                                                                        "Source Line No." = FIELD ("Line No.")));
            Caption = 'Whse. Outstanding Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752; "Completely Received"; Boolean)
        {
            Caption = 'Completely Received';
            Editable = false;
        }
        field(5790; "Requested Receipt Date"; Date)
        {
            Caption = 'Requested Receipt Date';
        }
        field(5791; "Promised Receipt Date"; Date)
        {
            AccessByPermission = TableData "Order Promising Line" = R;
            Caption = 'Promised Receipt Date';
        }
        field(5792; "Lead Time Calculation"; DateFormula)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lead Time Calculation';
        }
        field(5793; "Inbound Whse. Handling Time"; DateFormula)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Inbound Whse. Handling Time';
        }
        field(5794; "Planned Receipt Date"; Date)
        {
            AccessByPermission = TableData "Order Promising Line" = R;
            Caption = 'Planned Receipt Date';
        }
        field(5795; "Order Date"; Date)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Order Date';
        }
        field(5800; "Allow Item Charge Assignment"; Boolean)
        {
            AccessByPermission = TableData "Item Charge" = R;
            Caption = 'Allow Item Charge Assignment';
            InitValue = true;
        }
        field(5801; "Qty. to Assign"; Decimal)
        {
            CalcFormula = Sum ("Item Charge Assignment (Purch)"."Qty. to Assign" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                       "Document No." = FIELD ("Document No."),
                                                                                       "Document Line No." = FIELD ("Line No.")));
            Caption = 'Qty. to Assign';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5802; "Qty. Assigned"; Decimal)
        {
            CalcFormula = Sum ("Item Charge Assignment (Purch)"."Qty. Assigned" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                      "Document No." = FIELD ("Document No."),
                                                                                      "Document Line No." = FIELD ("Line No.")));
            Caption = 'Qty. Assigned';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5803; "Return Qty. to Ship"; Decimal)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Qty. to Ship';
            DecimalPlaces = 0 : 5;
        }
        field(5804; "Return Qty. to Ship (Base)"; Decimal)
        {
            Caption = 'Return Qty. to Ship (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5805; "Return Qty. Shipped Not Invd."; Decimal)
        {
            Caption = 'Return Qty. Shipped Not Invd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5806; "Ret. Qty. Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. Qty. Shpd Not Invd.(Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5807; "Return Shpd. Not Invd."; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Shpd. Not Invd.';
            Editable = false;
        }
        field(5808; "Return Shpd. Not Invd. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Return Shpd. Not Invd. (LCY)';
            Editable = false;
        }
        field(5809; "Return Qty. Shipped"; Decimal)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Return Qty. Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(5810; "Return Qty. Shipped (Base)"; Decimal)
        {
            Caption = 'Return Qty. Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(6600; "Return Shipment No."; Code[20])
        {
            Caption = 'Return Shipment No.';
            Editable = false;
        }
        field(6601; "Return Shipment Line No."; Integer)
        {
            Caption = 'Return Shipment Line No.';
            Editable = false;
        }
        field(6608; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";
        }
        field(6609; Subtype; Option)
        {
            Caption = 'Subtype';
            OptionCaption = ' ,Item - Inventory,Item - Service,Comment';
            OptionMembers = " ","Item - Inventory","Item - Service",Comment;
        }
        field(6610; "Copied From Posted Doc."; Boolean)
        {
            Caption = 'Copied From Posted Doc.';
        }
        field(7010; "Attached Doc Count"; Integer)
        {
            BlankNumbers = DontBlank;
            CalcFormula = Count ("Document Attachment" WHERE ("Table ID" = CONST (39),
                                                             "No." = FIELD ("Document No."),
                                                             "Document Type" = FIELD ("Document Type"),
                                                             "Line No." = FIELD ("Line No.")));
            Caption = 'Attached Doc Count';
            FieldClass = FlowField;
            InitValue = 0;
        }
        field(10500; "Reverse Charge Item"; Boolean)
        {
            Caption = 'Reverse Charge Item';
            Editable = false;
        }
        field(99000750; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
        field(99000751; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            Editable = false;
            TableRelation = "Prod. Order Routing Line"."Operation No." WHERE (Status = CONST (Released),
                                                                              "Prod. Order No." = FIELD ("Prod. Order No."),
                                                                              "Routing No." = FIELD ("Routing No."));
        }
        field(99000752; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            Editable = false;
            TableRelation = "Work Center";
        }
        field(99000753; Finished; Boolean)
        {
            Caption = 'Finished';
        }
        field(99000754; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            Editable = false;
            TableRelation = "Prod. Order Line"."Line No." WHERE (Status = FILTER (Released ..),
                                                                 "Prod. Order No." = FIELD ("Prod. Order No."));
        }
        field(99000755; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 0 : 5;
        }
        field(99000756; "MPS Order"; Boolean)
        {
            Caption = 'MPS Order';
        }
        field(99000757; "Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            OptionCaption = 'Unlimited,None';
            OptionMembers = Unlimited,"None";
        }
        field(99000758; "Safety Lead Time"; DateFormula)
        {
            Caption = 'Safety Lead Time';
        }
        field(99000759; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document No.", "Line No.", "Document Type")
        {
            Enabled = false;
        }
        key(Key3; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Expected Receipt Date")
        {
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key4; "Document Type", "Pay-to Vendor No.", "Currency Code", "Document No.")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Outstanding Amount", "Amt. Rcd. Not Invoiced", "Outstanding Amount (LCY)", "Amt. Rcd. Not Invoiced (LCY)";
        }
        key(Key5; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Location Code", "Expected Receipt Date")
        {
            Enabled = false;
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key6; "Document Type", "Pay-to Vendor No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Currency Code", "Document No.")
        {
            Enabled = false;
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Outstanding Amount", "Amt. Rcd. Not Invoiced", "Outstanding Amount (LCY)", "Amt. Rcd. Not Invoiced (LCY)";
        }
        key(Key7; "Document Type", "Blanket Order No.", "Blanket Order Line No.")
        {
        }
        key(Key8; "Document Type", Type, "Prod. Order No.", "Prod. Order Line No.", "Routing No.", "Operation No.")
        {
        }
        key(Key9; "Document Type", "Document No.", "Location Code")
        {
            MaintainSQLIndex = false;
            SumIndexFields = Amount, "Amount Including VAT";
        }
        key(Key10; "Document Type", "Receipt No.", "Receipt Line No.")
        {
        }
        key(Key11; Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Expected Receipt Date")
        {
            MaintainSQLIndex = false;
        }
        key(Key12; "Document Type", "Buy-from Vendor No.")
        {
        }
        key(Key13; "Document Type", "Job No.", "Job Task No.", "Document No.")
        {
            SumIndexFields = "Outstanding Amt. Ex. VAT (LCY)", "A. Rcd. Not Inv. Ex. VAT (LCY)";
        }
        key(Key14; "Document Type", "Document No.", Type, "No.")
        {
            Enabled = false;
        }
        key(Key15; "Document Type", Type, "No.")
        {
            Enabled = false;
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key16; "Recalculate Invoice Disc.")
        {
        }
        key(Key17; "Outstanding Quantity")
        {
        }
        key(Key18; "Location Code", "Quantity Invoiced")
        {
        }
    }

    fieldgroups
    {
    }
}

