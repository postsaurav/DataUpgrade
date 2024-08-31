table 5409 "Prod. Order Routing Line"
{
    Caption = 'Prod. Order Routing Line';
    Permissions = TableData "Prod. Order Capacity Need" = rimd;

    fields
    {
        field(1; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
        field(3; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
            Editable = false;
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
            OptionCaption = 'Work Center,Machine Center';
            OptionMembers = "Work Center","Machine Center";
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
            Editable = false;
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
        field(55; "Sequence No. (Actual)"; Integer)
        {
            Caption = 'Sequence No. (Actual)';
            Editable = false;
        }
        field(56; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
            DecimalPlaces = 2 : 5;
        }
        field(57; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
        }
        field(58; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 0 : 5;
        }
        field(70; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(71; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(72; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(73; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(74; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(75; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            Editable = false;
            NotBlank = true;
            TableRelation = "Production Order"."No." WHERE (Status = FIELD (Status));
        }
        field(76; "Unit Cost Calculation"; Option)
        {
            Caption = 'Unit Cost Calculation';
            OptionCaption = 'Time,Units';
            OptionMembers = Time,Units;
        }
        field(77; "Input Quantity"; Decimal)
        {
            Caption = 'Input Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(78; "Critical Path"; Boolean)
        {
            Caption = 'Critical Path';
            Editable = false;
        }
        field(79; "Routing Status"; Option)
        {
            Caption = 'Routing Status';
            OptionCaption = ' ,Planned,In Progress,Finished';
            OptionMembers = " ",Planned,"In Progress",Finished;
        }
        field(81; "Flushing Method"; Option)
        {
            Caption = 'Flushing Method';
            InitValue = Manual;
            OptionCaption = 'Manual,Forward,Backward';
            OptionMembers = Manual,Forward,Backward;
        }
        field(90; "Expected Operation Cost Amt."; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Operation Cost Amt.';
            Editable = false;
        }
        field(91; "Expected Capacity Need"; Decimal)
        {
            Caption = 'Expected Capacity Need';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = Normal;
        }
        field(96; "Expected Capacity Ovhd. Cost"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Capacity Ovhd. Cost';
            Editable = false;
        }
        field(98; "Starting Date-Time"; DateTime)
        {
            Caption = 'Starting Date-Time';
        }
        field(99; "Ending Date-Time"; DateTime)
        {
            Caption = 'Ending Date-Time';
        }
        field(100; "Schedule Manually"; Boolean)
        {
            Caption = 'Schedule Manually';
        }
        field(101; "Location Code"; Code[10])
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Location Code';
            Editable = false;
        }
        field(7301; "Open Shop Floor Bin Code"; Code[20])
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Open Shop Floor Bin Code';
            Editable = false;
        }
        field(7302; "To-Production Bin Code"; Code[20])
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'To-Production Bin Code';
            Editable = false;
        }
        field(7303; "From-Production Bin Code"; Code[20])
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'From-Production Bin Code';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.")
        {
            Clustered = true;
        }
        key(Key2; "Prod. Order No.", "Routing Reference No.", Status, "Routing No.", "Operation No.")
        {
        }
        key(Key3; Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Sequence No. (Forward)")
        {
        }
        key(Key4; Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Sequence No. (Backward)")
        {
        }
        key(Key5; Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Sequence No. (Actual)")
        {
            SumIndexFields = "Expected Operation Cost Amt.";
        }
        key(Key6; "Work Center No.")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Expected Operation Cost Amt.";
        }
        key(Key7; Type, "No.", "Starting Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Expected Operation Cost Amt.";
        }
        key(Key8; Status, "Work Center No.")
        {
            SumIndexFields = "Expected Operation Cost Amt.";
        }
        key(Key9; "Prod. Order No.", Status, "Flushing Method")
        {
        }
        key(Key10; "Starting Date", "Starting Time", "Routing Status")
        {
        }
        key(Key11; "Ending Date", "Ending Time", "Routing Status")
        {
        }
        key(Key12; Type, "No.", Status)
        {
            SumIndexFields = "Expected Operation Cost Amt.";
        }
    }

    fieldgroups
    {
    }
}

