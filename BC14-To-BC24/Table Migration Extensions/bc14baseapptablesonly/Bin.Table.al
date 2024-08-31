table 7354 Bin
{
    Caption = 'Bin';
    DataCaptionFields = "Location Code", "Zone Code", "Code";

    fields
    {
        field(1; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            Editable = false;
            NotBlank = true;
            TableRelation = Location;
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            Editable = false;
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(5; "Adjustment Bin"; Boolean)
        {
            CalcFormula = Exist (Location WHERE (Code = FIELD ("Location Code"),
                                                "Adjustment Bin Code" = FIELD (Code)));
            Caption = 'Adjustment Bin';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Bin Type Code"; Code[10])
        {
            Caption = 'Bin Type Code';
            TableRelation = "Bin Type";
        }
        field(11; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            TableRelation = "Warehouse Class";
        }
        field(12; "Block Movement"; Option)
        {
            Caption = 'Block Movement';
            OptionCaption = ' ,Inbound,Outbound,All';
            OptionMembers = " ",Inbound,Outbound,All;
        }
        field(20; "Special Equipment Code"; Code[10])
        {
            Caption = 'Special Equipment Code';
            TableRelation = "Special Equipment";
        }
        field(21; "Bin Ranking"; Integer)
        {
            Caption = 'Bin Ranking';
        }
        field(22; "Maximum Cubage"; Decimal)
        {
            BlankZero = true;
            Caption = 'Maximum Cubage';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(23; "Maximum Weight"; Decimal)
        {
            BlankZero = true;
            Caption = 'Maximum Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(30; Empty; Boolean)
        {
            Caption = 'Empty';
            Editable = false;
            InitValue = true;
        }
        field(32; "Item Filter"; Code[20])
        {
            Caption = 'Item Filter';
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(33; "Variant Filter"; Code[10])
        {
            Caption = 'Variant Filter';
            FieldClass = FlowFilter;
            TableRelation = "Stockkeeping Unit"."Variant Code" WHERE ("Location Code" = FIELD ("Location Code"),
                                                                      "Item No." = FIELD ("Item Filter"));
        }
        field(34; Default; Boolean)
        {
            CalcFormula = Exist ("Bin Content" WHERE ("Location Code" = FIELD ("Location Code"),
                                                     "Bin Code" = FIELD (Code),
                                                     "Item No." = FIELD ("Item Filter"),
                                                     "Variant Code" = FIELD ("Variant Filter"),
                                                     Default = CONST (true)));
            Caption = 'Default';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Cross-Dock Bin"; Boolean)
        {
            Caption = 'Cross-Dock Bin';
        }
        field(41; Dedicated; Boolean)
        {
            Caption = 'Dedicated';
        }
    }

    keys
    {
        key(Key1; "Location Code", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Bin Type Code")
        {
        }
        key(Key3; "Location Code", "Warehouse Class Code", "Bin Ranking")
        {
        }
        key(Key4; "Location Code", "Zone Code", "Code")
        {
        }
        key(Key5; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

