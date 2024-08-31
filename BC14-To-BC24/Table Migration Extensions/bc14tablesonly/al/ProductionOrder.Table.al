table 5405 "Production Order"
{
    Caption = 'Production Order';
    DataCaptionFields = "No.", Description;
    Permissions = TableData "Prod. Order Capacity Need" = r;

    fields
    {
        field(1; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Production Order"."No." WHERE (Status = FIELD (Status));
            ValidateTableRelation = false;
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
        field(9; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = 'Item,Family,Sales Header';
            OptionMembers = Item,Family,"Sales Header";
        }
        field(10; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (Item)) Item WHERE (Type = CONST (Inventory))
            ELSE
            IF ("Source Type" = CONST (Family)) Family
            ELSE
            IF (Status = CONST (Simulated),
                                     "Source Type" = CONST ("Sales Header")) "Sales Header"."No." WHERE ("Document Type" = CONST (Quote))
            ELSE
            IF (Status = FILTER (Planned ..),
                                              "Source Type" = CONST ("Sales Header")) "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(11; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
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
        field(17; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(19; Comment; Boolean)
        {
            CalcFormula = Exist ("Prod. Order Comment Line" WHERE (Status = FIELD (Status),
                                                                  "Prod. Order No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(21; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(22; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(23; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(25; "Finished Date"; Date)
        {
            Caption = 'Finished Date';
            Editable = false;
        }
        field(28; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(30; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(31; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(32; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(33; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Source Type" = CONST (Item)) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                           "Item Filter" = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = FILTER (<> Item)) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(34; "Replan Ref. No."; Code[20])
        {
            Caption = 'Replan Ref. No.';
            Editable = false;
        }
        field(35; "Replan Ref. Status"; Option)
        {
            Caption = 'Replan Ref. Status';
            Editable = false;
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(38; "Low-Level Code"; Integer)
        {
            Caption = 'Low-Level Code';
            Editable = false;
        }
        field(40; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(41; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DecimalPlaces = 2 : 5;
        }
        field(42; "Cost Amount"; Decimal)
        {
            Caption = 'Cost Amount';
            DecimalPlaces = 2 : 2;
        }
        field(47; "Work Center Filter"; Code[20])
        {
            Caption = 'Work Center Filter';
            FieldClass = FlowFilter;
            TableRelation = "Work Center";
        }
        field(48; "Capacity Type Filter"; Option)
        {
            Caption = 'Capacity Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Work Center,Machine Center';
            OptionMembers = "Work Center","Machine Center";
        }
        field(49; "Capacity No. Filter"; Code[20])
        {
            Caption = 'Capacity No. Filter';
            FieldClass = FlowFilter;
            TableRelation = IF ("Capacity Type Filter" = CONST ("Work Center")) "Machine Center"
            ELSE
            IF ("Capacity Type Filter" = CONST ("Machine Center")) "Work Center";
        }
        field(50; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(51; "Expected Operation Cost Amt."; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Prod. Order Routing Line"."Expected Operation Cost Amt." WHERE (Status = FIELD (Status),
                                                                                               "Prod. Order No." = FIELD ("No.")));
            Caption = 'Expected Operation Cost Amt.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Expected Component Cost Amt."; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Prod. Order Component"."Cost Amount" WHERE (Status = FIELD (Status),
                                                                           "Prod. Order No." = FIELD ("No."),
                                                                           "Due Date" = FIELD ("Date Filter")));
            Caption = 'Expected Component Cost Amt.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "Actual Time Used"; Decimal)
        {
            CalcFormula = Sum ("Capacity Ledger Entry".Quantity WHERE ("Order Type" = CONST (Production),
                                                                      "Order No." = FIELD ("No."),
                                                                      Type = FIELD ("Capacity Type Filter"),
                                                                      "No." = FIELD ("Capacity No. Filter"),
                                                                      "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Actual Time Used';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Allocated Capacity Need"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Needed Time" WHERE (Status = FIELD (Status),
                                                                               "Prod. Order No." = FIELD ("No."),
                                                                               Type = FIELD ("Capacity Type Filter"),
                                                                               "No." = FIELD ("Capacity No. Filter"),
                                                                               "Work Center No." = FIELD ("Work Center Filter"),
                                                                               Date = FIELD ("Date Filter"),
                                                                               "Requested Only" = CONST (false)));
            Caption = 'Allocated Capacity Need';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Expected Capacity Need"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Needed Time" WHERE (Status = FIELD (Status),
                                                                               "Prod. Order No." = FIELD ("No."),
                                                                               Type = FIELD ("Capacity Type Filter"),
                                                                               "No." = FIELD ("Capacity No. Filter"),
                                                                               "Work Center No." = FIELD ("Work Center Filter"),
                                                                               Date = FIELD ("Date Filter"),
                                                                               "Requested Only" = CONST (false)));
            Caption = 'Expected Capacity Need';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(82; "Planned Order No."; Code[20])
        {
            Caption = 'Planned Order No.';
        }
        field(83; "Firm Planned Order No."; Code[20])
        {
            Caption = 'Firm Planned Order No.';
        }
        field(85; "Simulated Order No."; Code[20])
        {
            Caption = 'Simulated Order No.';
        }
        field(92; "Expected Material Ovhd. Cost"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Component"."Overhead Amount" WHERE (Status = FIELD (Status),
                                                                               "Prod. Order No." = FIELD ("No.")));
            Caption = 'Expected Material Ovhd. Cost';
            DecimalPlaces = 2 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Expected Capacity Ovhd. Cost"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Prod. Order Routing Line"."Expected Capacity Ovhd. Cost" WHERE (Status = FIELD (Status),
                                                                                               "Prod. Order No." = FIELD ("No.")));
            Caption = 'Expected Capacity Ovhd. Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Starting Date-Time"; DateTime)
        {
            Caption = 'Starting Date-Time';
        }
        field(99; "Ending Date-Time"; DateTime)
        {
            Caption = 'Ending Date-Time';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(7300; "Completely Picked"; Boolean)
        {
            CalcFormula = Min ("Prod. Order Component"."Completely Picked" WHERE (Status = FIELD (Status),
                                                                                 "Prod. Order No." = FIELD ("No."),
                                                                                 "Supplied-by Line No." = FILTER (0)));
            Caption = 'Completely Picked';
            FieldClass = FlowField;
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
        key(Key1; Status, "No.")
        {
            Clustered = true;
        }
        key(Key2; "No.", Status)
        {
        }
        key(Key3; "Search Description")
        {
        }
        key(Key4; "Low-Level Code", "Replan Ref. No.", "Replan Ref. Status")
        {
        }
        key(Key5; "Source Type", "Source No.")
        {
            Enabled = false;
        }
        key(Key6; Description)
        {
        }
        key(Key7; "Source No.")
        {
        }
        key(Key8; "Starting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Source No.", "Source Type")
        {
        }
    }
}

