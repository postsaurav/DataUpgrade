table 901 "Assembly Line"
{
    Caption = 'Assembly Line';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,,,Blanket Order';
            OptionMembers = Quote,"Order",,,"Blanket Order";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Assembly Header"."No." WHERE ("Document Type" = FIELD ("Document Type"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(10; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Item,Resource';
            OptionMembers = " ",Item,Resource;
        }
        field(11; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Item)) Item WHERE (Type = FILTER (Inventory | "Non-Inventory"))
            ELSE
            IF (Type = CONST (Resource)) Resource;
        }
        field(12; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."),
                                                                             Code = FIELD ("Variant Code"));
        }
        field(13; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(14; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(18; "Lead-Time Offset"; DateFormula)
        {
            Caption = 'Lead-Time Offset';
        }
        field(19; "Resource Usage Type"; Option)
        {
            Caption = 'Resource Usage Type';
            OptionCaption = ' ,Direct,Fixed';
            OptionMembers = " ",Direct,"Fixed";
        }
        field(20; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(23; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(25; Position; Code[10])
        {
            Caption = 'Position';
        }
        field(26; "Position 2"; Code[10])
        {
            Caption = 'Position 2';
        }
        field(27; "Position 3"; Code[10])
        {
            Caption = 'Position 3';
        }
        field(38; "Appl.-to Item Entry"; Integer)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Appl.-to Item Entry';
        }
        field(39; "Appl.-from Item Entry"; Integer)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Appl.-from Item Entry';
            MinValue = 0;
        }
        field(40; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(41; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(42; "Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(43; "Remaining Quantity (Base)"; Decimal)
        {
            Caption = 'Remaining Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(44; "Consumed Quantity"; Decimal)
        {
            Caption = 'Consumed Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(45; "Consumed Quantity (Base)"; Decimal)
        {
            Caption = 'Consumed Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(46; "Quantity to Consume"; Decimal)
        {
            Caption = 'Quantity to Consume';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(47; "Quantity to Consume (Base)"; Decimal)
        {
            Caption = 'Quantity to Consume (Base)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(48; "Reserved Quantity"; Decimal)
        {
            CalcFormula = - Sum ("Reservation Entry".Quantity WHERE ("Source ID" = FIELD ("Document No."),
                                                                   "Source Ref. No." = FIELD ("Line No."),
                                                                   "Source Type" = CONST (901),
                                                                   "Source Subtype" = FIELD ("Document Type"),
                                                                   "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Reserved Qty. (Base)"; Decimal)
        {
            CalcFormula = - Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Source ID" = FIELD ("Document No."),
                                                                            "Source Ref. No." = FIELD ("Line No."),
                                                                            "Source Type" = CONST (901),
                                                                            "Source Subtype" = FIELD ("Document Type"),
                                                                            "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Avail. Warning"; Boolean)
        {
            Caption = 'Avail. Warning';
            Editable = false;
        }
        field(51; "Substitution Available"; Boolean)
        {
            CalcFormula = Exist ("Item Substitution" WHERE (Type = CONST (Item),
                                                           "Substitute Type" = CONST (Item),
                                                           "No." = FIELD ("No."),
                                                           "Variant Code" = FIELD ("Variant Code")));
            Caption = 'Substitution Available';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(53; Reserve; Option)
        {
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(60; "Quantity per"; Decimal)
        {
            Caption = 'Quantity per';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(61; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(62; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(63; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(65; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            MinValue = 0;
        }
        field(67; "Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount';
            Editable = false;
        }
        field(72; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(80; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item)) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            IF (Type = CONST (Resource)) "Resource Unit of Measure".Code WHERE ("Resource No." = FIELD ("No."));
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(7301; "Pick Qty."; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding" WHERE ("Activity Type" = FILTER (<> "Put-away"),
                                                                                  "Source Type" = CONST (901),
                                                                                  "Source Subtype" = FIELD ("Document Type"),
                                                                                  "Source No." = FIELD ("Document No."),
                                                                                  "Source Line No." = FIELD ("Line No."),
                                                                                  "Source Subline No." = CONST (0),
                                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER (" " | Place),
                                                                                  "Original Breakbulk" = CONST (false),
                                                                                  "Breakbulk No." = CONST (0)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(7302; "Pick Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE ("Activity Type" = FILTER (<> "Put-away"),
                                                                                         "Source Type" = CONST (901),
                                                                                         "Source Subtype" = FIELD ("Document Type"),
                                                                                         "Source No." = FIELD ("Document No."),
                                                                                         "Source Line No." = FIELD ("Line No."),
                                                                                         "Source Subline No." = CONST (0),
                                                                                         "Unit of Measure Code" = FIELD ("Unit of Measure Code"),
                                                                                         "Action Type" = FILTER (" " | Place),
                                                                                         "Original Breakbulk" = CONST (false),
                                                                                         "Breakbulk No." = CONST (0)));
            Caption = 'Pick Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(7303; "Qty. Picked"; Decimal)
        {
            Caption = 'Qty. Picked';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(7304; "Qty. Picked (Base)"; Decimal)
        {
            Caption = 'Qty. Picked (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Document No.", Type, "Location Code")
        {
            SumIndexFields = "Cost Amount", Quantity;
        }
        key(Key3; "Document Type", Type, "No.", "Variant Code", "Location Code", "Due Date")
        {
            SumIndexFields = "Remaining Quantity (Base)", "Qty. Picked (Base)", "Consumed Quantity (Base)";
        }
        key(Key4; Type, "No.")
        {
        }
    }

    fieldgroups
    {
    }
}

