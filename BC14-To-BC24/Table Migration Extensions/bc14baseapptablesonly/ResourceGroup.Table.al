table 152 "Resource Group"
{
    Caption = 'Resource Group';
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(22; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(23; Capacity; Decimal)
        {
            CalcFormula = Sum ("Res. Capacity Entry".Capacity WHERE ("Resource Group No." = FIELD ("No."),
                                                                    Date = FIELD ("Date Filter")));
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(24; "Qty. on Order (Job)"; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE (Status = CONST (Order),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "Resource Group No." = FIELD ("No."),
                                                                           "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. on Order (Job)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Qty. Quoted (Job)"; Decimal)
        {
            CalcFormula = Sum ("Job Planning Line"."Quantity (Base)" WHERE (Status = CONST (Quote),
                                                                           "Schedule Line" = CONST (true),
                                                                           Type = CONST (Resource),
                                                                           "Resource Group No." = FIELD ("No."),
                                                                           "Planning Date" = FIELD ("Date Filter")));
            Caption = 'Qty. Quoted (Job)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Unit of Measure Filter"; Code[10])
        {
            Caption = 'Unit of Measure Filter';
            FieldClass = FlowFilter;
            TableRelation = "Unit of Measure";
        }
        field(27; "Usage (Qty.)"; Decimal)
        {
            CalcFormula = Sum ("Res. Ledger Entry".Quantity WHERE ("Entry Type" = CONST (Usage),
                                                                  Chargeable = FIELD ("Chargeable Filter"),
                                                                  "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                  "Resource Group No." = FIELD ("No."),
                                                                  "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Usage (Cost)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Sum ("Res. Ledger Entry"."Total Cost" WHERE ("Entry Type" = CONST (Usage),
                                                                      Chargeable = FIELD ("Chargeable Filter"),
                                                                      "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                      "Resource Group No." = FIELD ("No."),
                                                                      "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Usage (Price)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Res. Ledger Entry"."Total Price" WHERE ("Entry Type" = CONST (Usage),
                                                                       Chargeable = FIELD ("Chargeable Filter"),
                                                                       "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                       "Resource Group No." = FIELD ("No."),
                                                                       "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Usage (Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Sales (Qty.)"; Decimal)
        {
            CalcFormula = - Sum ("Res. Ledger Entry".Quantity WHERE ("Entry Type" = CONST (Sale),
                                                                   "Resource Group No." = FIELD ("No."),
                                                                   "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                   "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Qty.)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Sales (Cost)"; Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = - Sum ("Res. Ledger Entry"."Total Cost" WHERE ("Entry Type" = CONST (Sale),
                                                                       "Resource Group No." = FIELD ("No."),
                                                                       "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                       "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Sales (Price)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum ("Res. Ledger Entry"."Total Price" WHERE ("Entry Type" = CONST (Sale),
                                                                        "Resource Group No." = FIELD ("No."),
                                                                        "Unit of Measure Code" = FIELD ("Unit of Measure Filter"),
                                                                        "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Sales (Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Chargeable Filter"; Boolean)
        {
            Caption = 'Chargeable Filter';
            FieldClass = FlowFilter;
        }
        field(34; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(35; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(36; "No. of Resources Assigned"; Integer)
        {
            CalcFormula = Count (Resource WHERE ("Resource Group No." = FIELD ("No.")));
            Caption = 'No. of Resources Assigned';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5900; "Qty. on Service Order"; Decimal)
        {
            CalcFormula = Sum ("Service Order Allocation"."Allocated Hours" WHERE (Posted = CONST (false),
                                                                                  "Resource Group No." = FIELD ("No."),
                                                                                  "Allocation Date" = FIELD ("Date Filter"),
                                                                                  Status = CONST (Active)));
            Caption = 'Qty. on Service Order';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

