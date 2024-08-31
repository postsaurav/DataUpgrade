table 9053 "Sales Cue"
{
    Caption = 'Sales Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Sales Quotes - Open"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Quote),
                                                      Status = FILTER (Open),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Sales Quotes - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Sales Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                                      Status = FILTER (Open),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Sales Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Ready to Ship"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                                      Status = FILTER (Released),
                                                      "Completely Shipped" = CONST (false),
                                                      "Shipment Date" = FIELD ("Date Filter2"),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Ready to Ship';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Delayed; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                                      Status = FILTER (Released),
                                                      "Completely Shipped" = CONST (false),
                                                      "Shipment Date" = FIELD ("Date Filter"),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter"),
                                                      "Late Order Shipping" = FILTER (true)));
            Caption = 'Delayed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Sales Return Orders - Open"; Integer)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER ("Return Order"),
                                                      Status = FILTER (Open),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Sales Return Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Sales Credit Memos - Open"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER ("Credit Memo"),
                                                      Status = FILTER (Open),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Sales Credit Memos - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Partially Shipped"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                                      Status = FILTER (Released),
                                                      Shipped = FILTER (true),
                                                      "Completely Shipped" = FILTER (false),
                                                      "Shipment Date" = FIELD ("Date Filter2"),
                                                      "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Partially Shipped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Average Days Delayed"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Average Days Delayed';
            DecimalPlaces = 1 : 1;
            Editable = false;
        }
        field(10; "Sales Inv. - Pending Doc.Exch."; Integer)
        {
            CalcFormula = Count ("Sales Invoice Header" WHERE ("Document Exchange Status" = FILTER ("Sent to Document Exchange Service" | "Delivery Failed")));
            Caption = 'Sales Invoices - Pending Document Exchange';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Sales CrM. - Pending Doc.Exch."; Integer)
        {
            CalcFormula = Count ("Sales Cr.Memo Header" WHERE ("Document Exchange Status" = FILTER ("Sent to Document Exchange Service" | "Delivery Failed")));
            Caption = 'Sales Credit Memos - Pending Document Exchange';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Date Filter2"; Date)
        {
            Caption = 'Date Filter 2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(22; "Responsibility Center Filter"; Code[10])
        {
            Caption = 'Responsibility Center Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(23; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

