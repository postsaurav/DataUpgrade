table 156 Resource
{
    Caption = 'Resource';
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Person,Machine';
            OptionMembers = Person,Machine;
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
        field(9; "Social Security No."; Text[30])
        {
            Caption = 'Social Security No.';
        }
        field(10; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
        }
        field(11; Education; Text[30])
        {
            Caption = 'Education';
        }
        field(12; "Contract Class"; Text[30])
        {
            Caption = 'Contract Class';
        }
        field(13; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
        }
        field(14; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            TableRelation = "Resource Group";
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
        field(18; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
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
            DecimalPlaces = 2 : 2;
        }
        field(21; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            MinValue = 0;
        }
        field(22; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DecimalPlaces = 0 : 5;
        }
        field(23; "Price/Profit Calculation"; Option)
        {
            Caption = 'Price/Profit Calculation';
            OptionCaption = 'Profit=Price-Cost,Price=Cost+Profit,No Relationship';
            OptionMembers = "Profit=Price-Cost","Price=Cost+Profit","No Relationship";
        }
        field(24; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;
        }
        field(25; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(26; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(27; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Resource),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
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
        field(40; "Unit of Measure Filter"; Code[10])
        {
            Caption = 'Unit of Measure Filter';
            FieldClass = FlowFilter;
            TableRelation = "Unit of Measure";
        }
        field(41; Capacity; Decimal)
        {
            CalcFormula = Sum ("Res. Capacity Entry".Capacity WHERE ("Resource No." = FIELD ("No."),
                                                                    Date = FIELD ("Date Filter")));
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(42; "Qty. on Order (Job)"; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE (Status = CONST (Order),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "No." = FIELD ("No."),
                                                                           "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Order (Job)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Qty. Quoted (Job)"; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE (Status = CONST (Quote),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "No." = FIELD ("No."),
                                                                           "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. Quoted (Job)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Usage (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Res. Ledger Entry"."Quantity (Base)" WHERE ("Entry Type" = CONST (Usage),
                                                                           Chargeable = FIELD ("Chargeable Filter"),
                                                                           "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                           "Resource No." = FIELD ("No."),
                                                                           "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Usage (Cost)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Sum ("Res. Ledger Entry"."Total Cost" WHERE ("Entry Type" = CONST (Usage),
                                                                      Chargeable = FIELD ("Chargeable Filter"),
                                                                      "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                      "Resource No." = FIELD ("No."),
                                                                      "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Usage (Price)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Sum ("Res. Ledger Entry"."Total Price" WHERE ("Entry Type" = CONST (Usage),
                                                                       Chargeable = FIELD ("Chargeable Filter"),
                                                                       "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                       "Resource No." = FIELD ("No."),
                                                                       "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; "Sales (Qty.)"; Decimal)
        {
            CalcFormula = - Sum ("Res. Ledger Entry"."Quantity (Base)" WHERE ("Entry Type" = CONST (Sale),
                                                                            "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                            "Resource No." = FIELD ("No."),
                                                                            "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Sales (Cost)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = - Sum ("Res. Ledger Entry"."Total Cost" WHERE ("Entry Type" = CONST (Sale),
                                                                       "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                       "Resource No." = FIELD ("No."),
                                                                       "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Sales (Price)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = - Sum ("Res. Ledger Entry"."Total Price" WHERE ("Entry Type" = CONST (Sale),
                                                                        "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                        "Resource No." = FIELD ("No."),
                                                                        "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Chargeable Filter"; Boolean)
        {
            Caption = 'Chargeable Filter';
            FieldClass = FlowFilter;
        }
        field(51; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(52; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(53; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(54; County; Text[30])
        {
            Caption = 'County';
        }
        field(55; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
        }
        field(56; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(57; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(58; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(59; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(60; "IC Partner Purch. G/L Acc. No."; Code[20])
        {
            Caption = 'IC Partner Purch. G/L Acc. No.';
            TableRelation = "IC G/L Account";
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';
        }
        field(900; "Qty. on Assembly Order"; Decimal)
        {
            CalcFormula = Sum ("Assembly Line"."Remaining Quantity (Base)" WHERE ("Document Type" = CONST (Order),
                                                                                 Type = CONST (Resource),
                                                                                 "No." = FIELD ("No."),
                                                                                 "Due Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Assembly Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(950; "Use Time Sheet"; Boolean)
        {
            Caption = 'Use Time Sheet';
        }
        field(951; "Time Sheet Owner User ID"; Code[50])
        {
            Caption = 'Time Sheet Owner User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(952; "Time Sheet Approver User ID"; Code[50])
        {
            Caption = 'Time Sheet Approver User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(1700; "Default Deferral Template Code"; Code[10])
        {
            Caption = 'Default Deferral Template Code';
            TableRelation = "Deferral Template"."Deferral Code";
        }
        field(5900; "Qty. on Service Order"; Decimal)
        {
            CalcFormula = Sum ("Service Order Allocation"."Allocated Hours" WHERE (Posted = CONST (false),
                                                                                  "Resource No." = FIELD ("No."),
                                                                                  "Allocation Date" = FIELD ("Date Filter"),
                                                                                  Status = CONST (Active)));
            Caption = 'Qty. on Service Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5901; "Service Zone Filter"; Code[10])
        {
            Caption = 'Service Zone Filter';
            TableRelation = "Service Zone";
        }
        field(5902; "In Customer Zone"; Boolean)
        {
            CalcFormula = Exist ("Resource Service Zone" WHERE ("Resource No." = FIELD ("No."),
                                                               "Service Zone Code" = FIELD ("Service Zone Filter")));
            Caption = 'In Customer Zone';
            Editable = false;
            FieldClass = FlowField;
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
        key(Key3; "Gen. Prod. Posting Group")
        {
        }
        key(Key4; Name)
        {
        }
        key(Key5; Type)
        {
        }
        key(Key6; "Base Unit of Measure")
        {
        }
        key(Key7; "Resource Group No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, Type, "Base Unit of Measure")
        {
        }
        fieldgroup(Brick; "No.", Name, Type, "Base Unit of Measure", Image)
        {
        }
    }
}

