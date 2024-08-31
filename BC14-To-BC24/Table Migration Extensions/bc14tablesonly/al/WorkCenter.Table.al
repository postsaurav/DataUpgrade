table 99000754 "Work Center"
{
    Caption = 'Work Center';
    DataCaptionFields = "No.", Name;
    Permissions = TableData "Prod. Order Capacity Need" = rm;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(5; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(6; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(7; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(8; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12; "Alternate Work Center"; Code[20])
        {
            Caption = 'Alternate Work Center';
            TableRelation = "Work Center";
        }
        field(14; "Work Center Group Code"; Code[10])
        {
            Caption = 'Work Center Group Code';
            TableRelation = "Work Center Group";
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(18; "Subcontractor No."; Code[20])
        {
            Caption = 'Subcontractor No.';
            TableRelation = Vendor;
        }
        field(19; "Direct Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
            MinValue = 0;
        }
        field(20; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(21; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            DecimalPlaces = 2 : 5;
            MinValue = 0;
        }
        field(22; "Queue Time"; Decimal)
        {
            Caption = 'Queue Time';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(23; "Queue Time Unit of Meas. Code"; Code[10])
        {
            Caption = 'Queue Time Unit of Meas. Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(26; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(27; Comment; Boolean)
        {
            CalcFormula = Exist ("Manufacturing Comment Line" WHERE ("Table Name" = CONST ("Work Center"),
                                                                    "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Capacity Unit of Measure";
        }
        field(31; Capacity; Decimal)
        {
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
            InitValue = 1;
            MinValue = 0;
        }
        field(32; Efficiency; Decimal)
        {
            Caption = 'Efficiency';
            DecimalPlaces = 0 : 5;
            InitValue = 100;
            MinValue = 0;
        }
        field(33; "Maximum Efficiency"; Decimal)
        {
            Caption = 'Maximum Efficiency';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(34; "Minimum Efficiency"; Decimal)
        {
            Caption = 'Minimum Efficiency';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(35; "Calendar Rounding Precision"; Decimal)
        {
            Caption = 'Calendar Rounding Precision';
            DecimalPlaces = 0 : 5;
            InitValue = 0.00001;
            MinValue = 0.00001;
            NotBlank = true;
        }
        field(36; "Simulation Type"; Option)
        {
            Caption = 'Simulation Type';
            OptionCaption = 'Moves,Moves When Necessary,Critical';
            OptionMembers = Moves,"Moves When Necessary",Critical;
        }
        field(37; "Shop Calendar Code"; Code[10])
        {
            Caption = 'Shop Calendar Code';
            TableRelation = "Shop Calendar";
        }
        field(38; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(39; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(40; "Work Shift Filter"; Code[10])
        {
            Caption = 'Work Shift Filter';
            FieldClass = FlowFilter;
            TableRelation = "Work Shift";
        }
        field(41; "Capacity (Total)"; Decimal)
        {
            CalcFormula = Sum ("Calendar Entry"."Capacity (Total)" WHERE ("Capacity Type" = CONST ("Work Center"),
                                                                         "No." = FIELD ("No."),
                                                                         "Work Shift Code" = FIELD ("Work Shift Filter"),
                                                                         Date = FIELD ("Date Filter")));
            Caption = 'Capacity (Total)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Capacity (Effective)"; Decimal)
        {
            CalcFormula = Sum ("Calendar Entry"."Capacity (Effective)" WHERE ("Capacity Type" = CONST ("Work Center"),
                                                                             "No." = FIELD ("No."),
                                                                             "Work Shift Code" = FIELD ("Work Shift Filter"),
                                                                             Date = FIELD ("Date Filter")));
            Caption = 'Capacity (Effective)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Prod. Order Need (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Prod. Order Capacity Need"."Allocated Time" WHERE ("Work Center No." = FIELD ("No."),
                                                                                  Status = FIELD ("Prod. Order Status Filter"),
                                                                                  Date = FIELD ("Date Filter"),
                                                                                  "Requested Only" = CONST (false)));
            Caption = 'Prod. Order Need (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Prod. Order Need Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Prod. Order Routing Line"."Expected Operation Cost Amt." WHERE ("Work Center No." = FIELD ("No."),
                                                                                               Status = FIELD ("Prod. Order Status Filter")));
            Caption = 'Prod. Order Need Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; "Prod. Order Status Filter"; Option)
        {
            Caption = 'Prod. Order Status Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(50; "Unit Cost Calculation"; Option)
        {
            Caption = 'Unit Cost Calculation';
            OptionCaption = 'Time,Units';
            OptionMembers = Time,Units;
        }
        field(51; "Specific Unit Cost"; Boolean)
        {
            Caption = 'Specific Unit Cost';
        }
        field(52; "Consolidated Calendar"; Boolean)
        {
            Caption = 'Consolidated Calendar';
        }
        field(53; "Flushing Method"; Option)
        {
            Caption = 'Flushing Method';
            InitValue = Manual;
            OptionCaption = 'Manual,Forward,Backward';
            OptionMembers = Manual,Forward,Backward;
        }
        field(80; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(81; "Overhead Rate"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Overhead Rate';
        }
        field(82; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(83; County; Text[30])
        {
            Caption = 'County';
        }
        field(84; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(7300; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location.Code WHERE ("Use As In-Transit" = CONST (false),
                                                 "Bin Mandatory" = CONST (true));
        }
        field(7301; "Open Shop Floor Bin Code"; Code[20])
        {
            Caption = 'Open Shop Floor Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(7302; "To-Production Bin Code"; Code[20])
        {
            Caption = 'To-Production Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(7303; "From-Production Bin Code"; Code[20])
        {
            Caption = 'From-Production Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Work Center Group Code")
        {
        }
        key(Key4; "Subcontractor No.")
        {
        }
        key(Key5; Name)
        {
        }
    }

    fieldgroups
    {
    }
}

