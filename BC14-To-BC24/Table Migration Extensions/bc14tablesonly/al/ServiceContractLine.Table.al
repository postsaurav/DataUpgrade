table 5964 "Service Contract Line"
{
    Caption = 'Service Contract Line';

    fields
    {
        field(1; "Contract Type"; Option)
        {
            Caption = 'Contract Type';
            OptionCaption = 'Quote,Contract';
            OptionMembers = Quote,Contract;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            TableRelation = "Service Contract Header"."Contract No." WHERE ("Contract Type" = FIELD ("Contract Type"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Contract Status"; Option)
        {
            Caption = 'Contract Status';
            OptionCaption = ' ,Signed,Cancelled';
            OptionMembers = " ",Signed,Cancelled;
        }
        field(5; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
            TableRelation = "Service Item";
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(8; "Service Item Group Code"; Code[10])
        {
            Caption = 'Service Item Group Code';
            TableRelation = "Service Item Group";
        }
        field(9; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(10; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            Editable = false;
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Customer No."));
        }
        field(11; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item WHERE (Type = CONST (Inventory));
        }
        field(12; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF ("Item No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."))
            ELSE
            "Unit of Measure";
        }
        field(13; "Response Time (Hours)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Response Time (Hours)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(14; "Last Planned Service Date"; Date)
        {
            Caption = 'Last Planned Service Date';
            Editable = false;
        }
        field(15; "Next Planned Service Date"; Date)
        {
            Caption = 'Next Planned Service Date';
        }
        field(16; "Last Service Date"; Date)
        {
            Caption = 'Last Service Date';
        }
        field(17; "Last Preventive Maint. Date"; Date)
        {
            Caption = 'Last Preventive Maint. Date';
            Editable = false;
        }
        field(18; "Invoiced to Date"; Date)
        {
            Caption = 'Invoiced to Date';
            Editable = false;
        }
        field(19; "Credit Memo Date"; Date)
        {
            Caption = 'Credit Memo Date';
        }
        field(20; "Contract Expiration Date"; Date)
        {
            Caption = 'Contract Expiration Date';
        }
        field(21; "Service Period"; DateFormula)
        {
            Caption = 'Service Period';
        }
        field(22; "Line Value"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Line Value';
        }
        field(23; "Line Discount %"; Decimal)
        {
            BlankZero = true;
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(24; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Line Amount';
        }
        field(28; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(29; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            Editable = false;
        }
        field(30; "New Line"; Boolean)
        {
            Caption = 'New Line';
            Editable = false;
            InitValue = true;
        }
        field(31; Credited; Boolean)
        {
            Caption = 'Credited';
        }
        field(32; "Line Cost"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Line Cost';
        }
        field(33; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Line Discount Amount';
        }
        field(34; Profit; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Profit';
        }
    }

    keys
    {
        key(Key1; "Contract Type", "Contract No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Contract No.", "Line No.", "Contract Type")
        {
        }
        key(Key3; "Service Item No.", "Contract Status")
        {
        }
        key(Key4; "Contract Type", "Contract No.", Credited, "New Line")
        {
            MaintainSIFTIndex = false;
            MaintainSQLIndex = false;
            SumIndexFields = "Line Amount", Profit;
        }
        key(Key5; "Customer No.", "Ship-to Code")
        {
        }
    }

    fieldgroups
    {
    }
}

