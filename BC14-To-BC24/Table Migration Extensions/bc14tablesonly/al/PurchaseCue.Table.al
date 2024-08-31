table 9055 "Purchase Cue"
{
    Caption = 'Purchase Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "To Send or Confirm"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Order),
                                                         Status = FILTER (Open),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'To Send or Confirm';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Upcoming Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Order),
                                                         Status = FILTER (Released),
                                                         "Expected Receipt Date" = FIELD ("Date Filter"),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Upcoming Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Outstanding Purchase Orders"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Order),
                                                         Status = FILTER (Released),
                                                         "Completely Received" = FILTER (false),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Outstanding Purchase Orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Purchase Return Orders - All"; Integer)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER ("Return Order"),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Purchase Return Orders - All';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Not Invoiced"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Order),
                                                         "Completely Received" = FILTER (true),
                                                         Invoice = FILTER (false),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Not Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Partially Invoiced"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Order),
                                                         "Completely Received" = FILTER (true),
                                                         Invoice = FILTER (true),
                                                         "Responsibility Center" = FIELD ("Responsibility Center Filter")));
            Caption = 'Partially Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Responsibility Center Filter"; Code[10])
        {
            Caption = 'Responsibility Center Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(22; "User ID Filter"; Code[50])
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

