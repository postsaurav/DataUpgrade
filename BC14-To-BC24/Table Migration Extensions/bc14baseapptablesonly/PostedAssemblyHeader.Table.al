table 910 "Posted Assembly Header"
{
    Caption = 'Posted Assembly Header';

    fields
    {
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
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
        field(9; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
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
            CalcFormula = Exist ("Assembly Comment Line" WHERE ("Document Type" = CONST ("Posted Assembly"),
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
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Bin Code';
        }
        field(39; "Item Rcpt. Entry No."; Integer)
        {
            Caption = 'Item Rcpt. Entry No.';
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
        field(54; "Assemble to Order"; Boolean)
        {
            CalcFormula = Exist ("Posted Assemble-to-Order Link" WHERE ("Assembly Document Type" = CONST (Assembly),
                                                                       "Assembly Document No." = FIELD ("No.")));
            Caption = 'Assemble to Order';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(67; "Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount';
            Editable = false;
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
        field(100; Reversed; Boolean)
        {
            Caption = 'Reversed';
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
        field(109; "Order No. Series"; Code[20])
        {
            Caption = 'Order No. Series';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(9010; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(9020; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Order No.")
        {
        }
        key(Key3; "Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

