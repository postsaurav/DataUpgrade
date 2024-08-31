table 5520 "Unplanned Demand"
{
    Caption = 'Unplanned Demand';
    Permissions = TableData "Sales Header" = r,
                  TableData Job = r,
                  TableData "Assembly Header" = r,
                  TableData "Production Order" = r,
                  TableData "Service Header" = r;

    fields
    {
        field(1; "Demand Type"; Option)
        {
            Caption = 'Demand Type';
            Editable = false;
            OptionCaption = ' ,Production,Sales,Service,Job,Assembly';
            OptionMembers = " ",Production,Sales,Service,Job,Assembly;
        }
        field(2; "Demand SubType"; Option)
        {
            Caption = 'Demand SubType';
            Editable = false;
            OptionCaption = '0,1,2,3,4,5,6,7,8,9';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9";
        }
        field(4; "Demand Order No."; Code[20])
        {
            Caption = 'Demand Order No.';
            Editable = false;
        }
        field(5; "Demand Line No."; Integer)
        {
            Caption = 'Demand Line No.';
        }
        field(6; "Demand Ref. No."; Integer)
        {
            Caption = 'Demand Ref. No.';
        }
        field(7; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            Editable = false;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(9; "Demand Date"; Date)
        {
            Caption = 'Demand Date';
            Editable = false;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(13; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(14; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
        }
        field(15; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(16; "Quantity (Base)"; Decimal)
        {
            Caption = 'Quantity (Base)';
        }
        field(17; Level; Integer)
        {
            Caption = 'Level';
        }
        field(18; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                            "Item Filter" = FIELD ("Item No."),
                                            "Variant Filter" = FIELD ("Variant Code"));
        }
        field(19; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(20; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(21; Reserve; Boolean)
        {
            Caption = 'Reserve';
        }
        field(22; "Needed Qty. (Base)"; Decimal)
        {
            Caption = 'Needed Qty. (Base)';
        }
        field(23; "Special Order"; Boolean)
        {
            Caption = 'Special Order';
        }
        field(24; "Purchasing Code"; Code[10])
        {
            Caption = 'Purchasing Code';
        }
    }

    keys
    {
        key(Key1; "Demand Type", "Demand SubType", "Demand Order No.", "Demand Line No.", "Demand Ref. No.")
        {
            Clustered = true;
        }
        key(Key2; "Demand Date", Level)
        {
        }
        key(Key3; "Item No.", "Variant Code", "Location Code", "Demand Date")
        {
            SumIndexFields = "Quantity (Base)", "Needed Qty. (Base)";
        }
    }

    fieldgroups
    {
    }
}

