table 167 Job
{
    Caption = 'Job';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(12; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Editable = false;
        }
        field(13; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(14; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(19; Status; Option)
        {
            Caption = 'Status';
            InitValue = Open;
            OptionCaption = 'Planning,Quote,Open,Completed';
            OptionMembers = Planning,Quote,Open,Completed;
        }
        field(20; "Person Responsible"; Code[20])
        {
            Caption = 'Person Responsible';
            TableRelation = Resource WHERE (Type = CONST (Person));
        }
        field(21; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(22; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(23; "Job Posting Group"; Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";
        }
        field(24; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Posting,All';
            OptionMembers = " ",Posting,All;
        }
        field(29; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(30; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Job),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(32; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(41; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(49; "Scheduled Res. Qty."; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE ("Job No." = FIELD ("No."),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "No." = FIELD ("Resource Filter"),
                                                                           "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Scheduled Res. Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Resource Filter"; Code[20])
        {
            Caption = 'Resource Filter';
            FieldClass = FlowFilter;
            TableRelation = Resource;
        }
        field(51; "Posting Date Filter"; Date)
        {
            Caption = 'Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(55; "Resource Gr. Filter"; Code[20])
        {
            Caption = 'Resource Gr. Filter';
            FieldClass = FlowFilter;
            TableRelation = "Resource Group";
        }
        field(56; "Scheduled Res. Gr. Qty."; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE ("Job No." = FIELD ("No."),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "Resource Group No." = FIELD ("Resource Gr. Filter"),
                                                                           "Planning Date" = FIELD ("Planning Date Filter")));
            Caption = 'Scheduled Res. Gr. Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(58; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
        }
        field(59; "Bill-to Address"; Text[100])
        {
            Caption = 'Bill-to Address';
        }
        field(60; "Bill-to Address 2"; Text[50])
        {
            Caption = 'Bill-to Address 2';
        }
        field(61; "Bill-to City"; Text[30])
        {
            Caption = 'Bill-to City';
            TableRelation = IF ("Bill-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Bill-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Bill-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(63; "Bill-to County"; Text[30])
        {
            Caption = 'Bill-to County';
        }
        field(64; "Bill-to Post Code"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            TableRelation = IF ("Bill-to Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Bill-to Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Bill-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(66; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(67; "Bill-to Country/Region Code"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            Editable = true;
            TableRelation = "Country/Region";
        }
        field(68; "Bill-to Name 2"; Text[50])
        {
            Caption = 'Bill-to Name 2';
        }
        field(117; Reserve; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
        }
        field(1000; "WIP Method"; Code[20])
        {
            Caption = 'WIP Method';
            TableRelation = "Job WIP Method".Code WHERE (Valid = CONST (true));
        }
        field(1001; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(1002; "Bill-to Contact No."; Code[20])
        {
            AccessByPermission = TableData Contact = R;
            Caption = 'Bill-to Contact No.';
        }
        field(1003; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
        }
        field(1004; "Planning Date Filter"; Date)
        {
            Caption = 'Planning Date Filter';
            FieldClass = FlowFilter;
        }
        field(1005; "Total WIP Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                         "Job Complete" = CONST (false),
                                                                         Type = FILTER ("Accrued Costs" | "Applied Costs" | "Recognized Costs")));
            Caption = 'Total WIP Cost Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1006; "Total WIP Cost G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                             Reversed = CONST (false),
                                                                             "Job Complete" = CONST (false),
                                                                             Type = FILTER ("Accrued Costs" | "Applied Costs" | "Recognized Costs")));
            Caption = 'Total WIP Cost G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1007; "WIP Entries Exist"; Boolean)
        {
            CalcFormula = Exist ("Job WIP Entry" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'WIP Entries Exist';
            FieldClass = FlowField;
        }
        field(1008; "WIP Posting Date"; Date)
        {
            Caption = 'WIP Posting Date';
            Editable = false;
        }
        field(1009; "WIP G/L Posting Date"; Date)
        {
            CalcFormula = Min ("Job WIP G/L Entry"."WIP Posting Date" WHERE (Reversed = CONST (false),
                                                                            "Job No." = FIELD ("No.")));
            Caption = 'WIP G/L Posting Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1011; "Invoice Currency Code"; Code[10])
        {
            Caption = 'Invoice Currency Code';
            TableRelation = Currency;
        }
        field(1012; "Exch. Calculation (Cost)"; Option)
        {
            Caption = 'Exch. Calculation (Cost)';
            OptionCaption = 'Fixed FCY,Fixed LCY';
            OptionMembers = "Fixed FCY","Fixed LCY";
        }
        field(1013; "Exch. Calculation (Price)"; Option)
        {
            Caption = 'Exch. Calculation (Price)';
            OptionCaption = 'Fixed FCY,Fixed LCY';
            OptionMembers = "Fixed FCY","Fixed LCY";
        }
        field(1014; "Allow Schedule/Contract Lines"; Boolean)
        {
            Caption = 'Allow Budget/Billable Lines';
        }
        field(1015; Complete; Boolean)
        {
            Caption = 'Complete';
        }
        field(1017; "Recog. Sales Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                         Type = FILTER ("Recognized Sales")));
            Caption = 'Recog. Sales Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1018; "Recog. Sales G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                             Reversed = CONST (false),
                                                                             Type = FILTER ("Recognized Sales")));
            Caption = 'Recog. Sales G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1019; "Recog. Costs Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job WIP Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                        Type = FILTER ("Recognized Costs")));
            Caption = 'Recog. Costs Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1020; "Recog. Costs G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                            Reversed = CONST (false),
                                                                            Type = FILTER ("Recognized Costs")));
            Caption = 'Recog. Costs G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1021; "Total WIP Sales Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job WIP Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                        "Job Complete" = CONST (false),
                                                                        Type = FILTER ("Accrued Sales" | "Applied Sales" | "Recognized Sales")));
            Caption = 'Total WIP Sales Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1022; "Total WIP Sales G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                            Reversed = CONST (false),
                                                                            "Job Complete" = CONST (false),
                                                                            Type = FILTER ("Accrued Sales" | "Applied Sales" | "Recognized Sales")));
            Caption = 'Total WIP Sales G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1023; "WIP Completion Calculated"; Boolean)
        {
            CalcFormula = Exist ("Job WIP Entry" WHERE ("Job No." = FIELD ("No."),
                                                       "Job Complete" = CONST (true)));
            Caption = 'WIP Completion Calculated';
            FieldClass = FlowField;
        }
        field(1024; "Next Invoice Date"; Date)
        {
            CalcFormula = Min ("Job Planning Line"."Planning Date" WHERE ("Job No." = FIELD ("No."),
                                                                         "Contract Line" = CONST (true),
                                                                         "Qty. to Invoice" = FILTER (<> 0)));
            Caption = 'Next Invoice Date';
            FieldClass = FlowField;
        }
        field(1025; "Apply Usage Link"; Boolean)
        {
            Caption = 'Apply Usage Link';
        }
        field(1026; "WIP Warnings"; Boolean)
        {
            CalcFormula = Exist ("Job WIP Warning" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'WIP Warnings';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1027; "WIP Posting Method"; Option)
        {
            Caption = 'WIP Posting Method';
            OptionCaption = 'Per Job,Per Job Ledger Entry';
            OptionMembers = "Per Job","Per Job Ledger Entry";
        }
        field(1028; "Applied Costs G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                             Reverse = CONST (false),
                                                                             "Job Complete" = CONST (false),
                                                                             Type = FILTER ("Applied Costs")));
            Caption = 'Applied Costs G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1029; "Applied Sales G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Job WIP G/L Entry"."WIP Entry Amount" WHERE ("Job No." = FIELD ("No."),
                                                                             Reverse = CONST (false),
                                                                             "Job Complete" = CONST (false),
                                                                             Type = FILTER ("Applied Sales")));
            Caption = 'Applied Sales G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1030; "Calc. Recog. Sales Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job Task"."Recognized Sales Amount" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'Calc. Recog. Sales Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1031; "Calc. Recog. Costs Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job Task"."Recognized Costs Amount" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'Calc. Recog. Costs Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1032; "Calc. Recog. Sales G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job Task"."Recognized Sales G/L Amount" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'Calc. Recog. Sales G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1033; "Calc. Recog. Costs G/L Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Job Task"."Recognized Costs G/L Amount" WHERE ("Job No." = FIELD ("No.")));
            Caption = 'Calc. Recog. Costs G/L Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1034; "WIP Completion Posted"; Boolean)
        {
            CalcFormula = Exist ("Job WIP G/L Entry" WHERE ("Job No." = FIELD ("No."),
                                                           "Job Complete" = CONST (true)));
            Caption = 'WIP Completion Posted';
            FieldClass = FlowField;
        }
        field(1035; "Over Budget"; Boolean)
        {
            Caption = 'Over Budget';
        }
        field(1036; "Project Manager"; Code[50])
        {
            Caption = 'Project Manager';
            TableRelation = "User Setup";
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Description")
        {
        }
        key(Key3; "Bill-to Customer No.")
        {
        }
        key(Key4; Description)
        {
        }
        key(Key5; Status)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Bill-to Customer No.", "Starting Date", Status)
        {
        }
        fieldgroup(Brick; "No.", Description, "Bill-to Customer No.", "Starting Date", Status, Image)
        {
        }
    }
}

