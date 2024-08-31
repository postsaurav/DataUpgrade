table 900 "Assembly Header"
{
    Caption = 'Assembly Header';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,,,Blanket Order';
            OptionMembers = Quote,"Order",,,"Blanket Order";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
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
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
        }
        field(7; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(12; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."),
                                                       Code = FIELD ("Variant Code"));
        }
        field(15; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(16; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(19; Comment; Boolean)
        {
            CalcFormula = Exist ("Assembly Comment Line" WHERE ("Document Type" = FIELD ("Document Type"),
                                                               "Document No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
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
        field(23; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(25; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(27; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(33; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF (Quantity = FILTER (< 0)) "Bin Content"."Bin Code" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                     "Item No." = FIELD ("Item No."),
                                                                                     "Variant Code" = FIELD ("Variant Code"))
            ELSE
            Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(40; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(41; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
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
        field(44; "Assembled Quantity"; Decimal)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Assembled Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(45; "Assembled Quantity (Base)"; Decimal)
        {
            Caption = 'Assembled Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(46; "Quantity to Assemble"; Decimal)
        {
            Caption = 'Quantity to Assemble';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(47; "Quantity to Assemble (Base)"; Decimal)
        {
            Caption = 'Quantity to Assemble (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(48; "Reserved Quantity"; Decimal)
        {
            CalcFormula = Sum ("Reservation Entry".Quantity WHERE ("Source ID" = FIELD ("No."),
                                                                  "Source Type" = CONST (900),
                                                                  "Source Subtype" = FIELD ("Document Type"),
                                                                  "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Reserved Qty. (Base)"; Decimal)
        {
            CalcFormula = Sum ("Reservation Entry"."Quantity (Base)" WHERE ("Source ID" = FIELD ("No."),
                                                                           "Source Type" = CONST (900),
                                                                           "Source Subtype" = FIELD ("Document Type"),
                                                                           "Reservation Status" = CONST (Reservation)));
            Caption = 'Reserved Qty. (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            OptionCaption = 'Unlimited,None';
            OptionMembers = Unlimited,"None";
        }
        field(51; "MPS Order"; Boolean)
        {
            Caption = 'MPS Order';
        }
        field(54; "Assemble to Order"; Boolean)
        {
            CalcFormula = Exist ("Assemble-to-Order Link" WHERE ("Assembly Document Type" = FIELD ("Document Type"),
                                                                "Assembly Document No." = FIELD ("No.")));
            Caption = 'Assemble to Order';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            Editable = false;
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
        field(68; "Rolled-up Assembly Cost"; Decimal)
        {
            CalcFormula = Sum ("Assembly Line"."Cost Amount" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                   "Document No." = FIELD ("No."),
                                                                   Type = FILTER (Item | Resource)));
            Caption = 'Rolled-up Assembly Cost';
            FieldClass = FlowField;
        }
        field(75; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
        }
        field(76; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 0 : 5;
        }
        field(80; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(81; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(120; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(9000; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Item No.", "Variant Code", "Location Code", "Due Date")
        {
            SumIndexFields = "Remaining Quantity (Base)";
        }
    }

    fieldgroups
    {
    }
}

