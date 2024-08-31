table 7338 "Bin Creation Worksheet Line"
{
    Caption = 'Bin Creation Worksheet Line';

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            TableRelation = "Bin Creation Wksh. Template".Name WHERE (Type = FIELD (Type));
            ValidateTableRelation = false;
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            TableRelation = "Bin Creation Wksh. Name".Name WHERE ("Worksheet Template Name" = FIELD ("Worksheet Template Name"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Bin,Bin Content';
            OptionMembers = Bin,"Bin Content";
        }
        field(5; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location WHERE ("Bin Mandatory" = CONST (true));
        }
        field(6; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(7; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            NotBlank = true;
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
            ValidateTableRelation = false;
        }
        field(8; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
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
        field(15; "Min. Qty."; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(16; "Max. Qty."; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 1;
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
        field(37; "Fixed"; Boolean)
        {
            Caption = 'Fixed';
            InitValue = true;
        }
        field(38; Default; Boolean)
        {
            Caption = 'Default';
        }
        field(40; "Cross-Dock Bin"; Boolean)
        {
            Caption = 'Cross-Dock Bin';
        }
        field(67; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
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
            NotBlank = true;
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(5408; Dedicated; Boolean)
        {
            Caption = 'Dedicated';
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", Name, "Location Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Location Code", "Zone Code", "Bin Code", "Item No.", "Variant Code")
        {
        }
    }

    fieldgroups
    {
    }
}

