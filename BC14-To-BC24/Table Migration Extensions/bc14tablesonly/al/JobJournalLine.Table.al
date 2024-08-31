table 210 "Job Journal Line"
{
    Caption = 'Job Journal Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Job Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Resource,Item,G/L Account';
            OptionMembers = Resource,Item,"G/L Account";
        }
        field(8; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST (Item)) Item WHERE (Blocked = CONST (false))
            ELSE
            IF (Type = CONST ("G/L Account")) "G/L Account";
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(12; "Direct Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost (LCY)';
            MinValue = 0;
        }
        field(13; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';
            Editable = false;
            MinValue = 0;
        }
        field(14; "Total Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Cost (LCY)';
            Editable = false;
        }
        field(15; "Unit Price (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price (LCY)';
            Editable = false;
        }
        field(16; "Total Price (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price (LCY)';
            Editable = false;
        }
        field(17; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            Editable = false;
            TableRelation = "Resource Group";
        }
        field(18; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            IF (Type = CONST (Resource)) "Resource Unit of Measure".Code WHERE ("Resource No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(21; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(22; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
            InitValue = true;
        }
        field(30; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = IF (Type = CONST (Item)) "Inventory Posting Group";
        }
        field(31; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(32; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(33; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(34; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(37; "Applies-to Entry"; Integer)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Applies-to Entry';
        }
        field(40; "Shpt. Method Code"; Code[10])
        {
            Caption = 'Shpt. Method Code';
            TableRelation = "Shipment Method";
        }
        field(61; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            Editable = false;
            OptionCaption = 'Usage,Sale';
            OptionMembers = Usage,Sale;
        }
        field(62; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
        }
        field(73; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Job Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(74; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(75; "Recurring Method"; Option)
        {
            BlankZero = true;
            Caption = 'Recurring Method';
            OptionCaption = ',Fixed,Variable';
            OptionMembers = ,"Fixed",Variable;
        }
        field(76; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(77; "Recurring Frequency"; DateFormula)
        {
            Caption = 'Recurring Frequency';
        }
        field(79; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(80; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(81; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(82; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(83; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(86; "Entry/Exit Point"; Code[10])
        {
            Caption = 'Entry/Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(87; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(88; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(89; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(90; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(91; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(92; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(93; "Source Currency Code"; Code[10])
        {
            Caption = 'Source Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(94; "Source Currency Total Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Currency Total Cost';
            Editable = false;
        }
        field(95; "Source Currency Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Currency Total Price';
            Editable = false;
        }
        field(96; "Source Currency Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Currency Line Amount';
            Editable = false;
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
        field(1000; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(1001; "Total Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Cost';
            Editable = false;
        }
        field(1002; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;
        }
        field(1003; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = ' ,Budget,Billable,Both Budget and Billable';
            OptionMembers = " ",Budget,Billable,"Both Budget and Billable";
        }
        field(1004; "Applies-from Entry"; Integer)
        {
            Caption = 'Applies-from Entry';
            MinValue = 0;
        }
        field(1005; "Job Posting Only"; Boolean)
        {
            Caption = 'Job Posting Only';
        }
        field(1006; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(1007; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
        }
        field(1008; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(1009; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
        }
        field(1010; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(1011; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(1012; "Line Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount (LCY)';
            Editable = false;
        }
        field(1013; "Line Discount Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount (LCY)';
            Editable = false;
        }
        field(1014; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price';
            Editable = false;
        }
        field(1015; "Cost Factor"; Decimal)
        {
            Caption = 'Cost Factor';
            Editable = false;
        }
        field(1016; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(1017; "Ledger Entry Type"; Option)
        {
            Caption = 'Ledger Entry Type';
            OptionCaption = ' ,Resource,Item,G/L Account';
            OptionMembers = " ",Resource,Item,"G/L Account";
        }
        field(1018; "Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Ledger Entry No.';
            TableRelation = IF ("Ledger Entry Type" = CONST (Resource)) "Res. Ledger Entry"
            ELSE
            IF ("Ledger Entry Type" = CONST (Item)) "Item Ledger Entry"
            ELSE
            IF ("Ledger Entry Type" = CONST ("G/L Account")) "G/L Entry";
        }
        field(1019; "Job Planning Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Planning Line No.';
        }
        field(1030; "Remaining Qty."; Decimal)
        {
            Caption = 'Remaining Qty.';
            DecimalPlaces = 0 : 5;
        }
        field(1031; "Remaining Qty. (Base)"; Decimal)
        {
            Caption = 'Remaining Qty. (Base)';
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(5403; "Bin Code"; Code[20])
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Bin Code';
        }
        field(5404; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5410; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(5468; "Reserved Qty. (Base)"; Decimal)
        {
            AccessByPermission = TableData Item = R;
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Source ID" = FIELD ("Journal Template Name"),
                                                                           "Source Ref. No." = FIELD ("Line No."),
                                                                           "Source Type" = CONST (1011),
                                                                           "Source Subtype" = FIELD ("Entry Type"),
                                                                           "Source Batch Name" = FIELD ("Journal Batch Name"),
                                                                           "Source Prod. Order Line" = CONST (0),
                                                                           "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5900; "Service Order No."; Code[20])
        {
            Caption = 'Service Order No.';
        }
        field(5901; "Posted Service Shipment No."; Code[20])
        {
            Caption = 'Posted Service Shipment No.';
        }
        field(6501; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(10500; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ObsoleteReason = 'Merge to W1';
            ObsoleteState = Pending;
            TableRelation = "Shipment Method";
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Journal Template Name", "Journal Batch Name", Type, "No.", "Unit of Measure Code", "Work Type Code")
        {
            MaintainSQLIndex = false;
        }
    }

    fieldgroups
    {
    }
}

