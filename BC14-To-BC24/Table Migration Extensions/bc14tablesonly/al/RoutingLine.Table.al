table 99000764 "Routing Line"
{
    Caption = 'Routing Line';

    fields
    {
        field(1; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            NotBlank = true;
            TableRelation = "Routing Header";
        }
        field(2; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
            TableRelation = "Routing Version"."Version Code" WHERE ("Routing No." = FIELD ("Routing No."));
        }
        field(4; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            NotBlank = true;
        }
        field(5; "Next Operation No."; Code[30])
        {
            Caption = 'Next Operation No.';
        }
        field(6; "Previous Operation No."; Code[30])
        {
            Caption = 'Previous Operation No.';
        }
        field(7; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Work Center,Machine Center, ';
            OptionMembers = "Work Center","Machine Center"," ";
        }
        field(8; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST ("Work Center")) "Work Center"
            ELSE
            IF (Type = CONST ("Machine Center")) "Machine Center";
        }
        field(9; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            Editable = false;
            TableRelation = "Work Center";
        }
        field(10; "Work Center Group Code"; Code[10])
        {
            Caption = 'Work Center Group Code';
            Editable = false;
            TableRelation = "Work Center Group";
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Setup Time"; Decimal)
        {
            Caption = 'Setup Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(13; "Run Time"; Decimal)
        {
            Caption = 'Run Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(14; "Wait Time"; Decimal)
        {
            Caption = 'Wait Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(15; "Move Time"; Decimal)
        {
            Caption = 'Move Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(16; "Fixed Scrap Quantity"; Decimal)
        {
            Caption = 'Fixed Scrap Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(17; "Lot Size"; Decimal)
        {
            Caption = 'Lot Size';
            DecimalPlaces = 0 : 5;
        }
        field(18; "Scrap Factor %"; Decimal)
        {
            Caption = 'Scrap Factor %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(19; "Setup Time Unit of Meas. Code"; Code[10])
        {
            Caption = 'Setup Time Unit of Meas. Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(20; "Run Time Unit of Meas. Code"; Code[10])
        {
            Caption = 'Run Time Unit of Meas. Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(21; "Wait Time Unit of Meas. Code"; Code[10])
        {
            Caption = 'Wait Time Unit of Meas. Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(22; "Move Time Unit of Meas. Code"; Code[10])
        {
            Caption = 'Move Time Unit of Meas. Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(27; "Minimum Process Time"; Decimal)
        {
            Caption = 'Minimum Process Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(28; "Maximum Process Time"; Decimal)
        {
            Caption = 'Maximum Process Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(30; "Concurrent Capacities"; Decimal)
        {
            Caption = 'Concurrent Capacities';
            DecimalPlaces = 0 : 5;
            InitValue = 1;
            MinValue = 0;
        }
        field(31; "Send-Ahead Quantity"; Decimal)
        {
            Caption = 'Send-Ahead Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(34; "Routing Link Code"; Code[10])
        {
            Caption = 'Routing Link Code';
            TableRelation = "Routing Link";
        }
        field(35; "Standard Task Code"; Code[10])
        {
            Caption = 'Standard Task Code';
            TableRelation = "Standard Task";
        }
        field(40; "Unit Cost per"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost per';
            MinValue = 0;
        }
        field(41; Recalculate; Boolean)
        {
            Caption = 'Recalculate';
            Editable = false;
        }
        field(45; Comment; Boolean)
        {
            CalcFormula = Exist ("Routing Comment Line" WHERE ("Routing No." = FIELD ("Routing No."),
                                                              "Version Code" = FIELD ("Version Code"),
                                                              "Operation No." = FIELD ("Operation No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Sequence No. (Forward)"; Integer)
        {
            Caption = 'Sequence No. (Forward)';
            Editable = false;
        }
        field(51; "Sequence No. (Backward)"; Integer)
        {
            Caption = 'Sequence No. (Backward)';
            Editable = false;
        }
        field(52; "Fixed Scrap Qty. (Accum.)"; Decimal)
        {
            Caption = 'Fixed Scrap Qty. (Accum.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(53; "Scrap Factor % (Accumulated)"; Decimal)
        {
            Caption = 'Scrap Factor % (Accumulated)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Routing No.", "Version Code", "Operation No.")
        {
            Clustered = true;
        }
        key(Key2; "Routing No.", "Version Code", "Sequence No. (Forward)")
        {
        }
        key(Key3; "Routing No.", "Version Code", "Sequence No. (Backward)")
        {
        }
        key(Key4; "Work Center No.")
        {
        }
        key(Key5; Type, "No.")
        {
        }
        key(Key6; "Routing Link Code")
        {
        }
    }

    fieldgroups
    {
    }
}

