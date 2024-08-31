table 1208 "Direct Debit Collection Entry"
{
    Caption = 'Direct Debit Collection Entry';
    DataCaptionFields = "Customer No.", "Transaction ID";

    fields
    {
        field(1; "Direct Debit Collection No."; Integer)
        {
            Caption = 'Direct Debit Collection No.';
            TableRelation = "Direct Debit Collection";
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(4; "Applies-to Entry No."; Integer)
        {
            Caption = 'Applies-to Entry No.';
            TableRelation = "Cust. Ledger Entry" WHERE ("Customer No." = FIELD ("Customer No."),
                                                        "Document Type" = FILTER (Invoice | "Finance Charge Memo" | Reminder),
                                                        Open = CONST (true));
        }
        field(5; "Transfer Date"; Date)
        {
            Caption = 'Transfer Date';
        }
        field(6; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(7; "Transfer Amount"; Decimal)
        {
            Caption = 'Transfer Amount';
        }
        field(8; "Transaction ID"; Text[35])
        {
            Caption = 'Transaction ID';
            Editable = false;
        }
        field(9; "Sequence Type"; Option)
        {
            Caption = 'Sequence Type';
            Editable = false;
            OptionCaption = 'One Off,First,Recurring,Last';
            OptionMembers = "One Off",First,Recurring,Last;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'New,File Created,Rejected,Posted';
            OptionMembers = New,"File Created",Rejected,Posted;
        }
        field(11; "Mandate ID"; Code[35])
        {
            Caption = 'Mandate ID';
            TableRelation = "SEPA Direct Debit Mandate".ID WHERE ("Customer No." = FIELD ("Customer No."));
        }
        field(12; "Mandate Type of Payment"; Option)
        {
            CalcFormula = Lookup ("SEPA Direct Debit Mandate"."Type of Payment" WHERE (ID = FIELD ("Mandate ID")));
            Caption = 'Mandate Type of Payment';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'One Off,Recurrent';
            OptionMembers = "One Off",Recurrent;
        }
        field(13; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup (Customer.Name WHERE ("No." = FIELD ("Customer No.")));
            Caption = 'Customer Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Applies-to Entry Document No."; Code[20])
        {
            CalcFormula = Lookup ("Cust. Ledger Entry"."Document No." WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Document No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Applies-to Entry Description"; Text[100])
        {
            CalcFormula = Lookup ("Cust. Ledger Entry".Description WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Applies-to Entry Posting Date"; Date)
        {
            CalcFormula = Lookup ("Cust. Ledger Entry"."Posting Date" WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Posting Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Applies-to Entry Currency Code"; Code[10])
        {
            CalcFormula = Lookup ("Cust. Ledger Entry"."Currency Code" WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Currency Code';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Currency;
        }
        field(18; "Applies-to Entry Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Cust. Ledger Entry No." = FIELD ("Applies-to Entry No."),
                                                                         "Entry Type" = FILTER ("Initial Entry" | "Unrealized Loss" | "Unrealized Gain" | "Realized Loss" | "Realized Gain" | "Payment Discount" | "Payment Discount (VAT Excl.)" | "Payment Discount (VAT Adjustment)" | "Payment Tolerance" | "Payment Discount Tolerance" | "Payment Tolerance (VAT Excl.)" | "Payment Tolerance (VAT Adjustment)" | "Payment Discount Tolerance (VAT Excl.)" | "Payment Discount Tolerance (VAT Adjustment)")));
            Caption = 'Applies-to Entry Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Applies-to Entry Rem. Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry".Amount WHERE ("Cust. Ledger Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Rem. Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Applies-to Entry Open"; Boolean)
        {
            CalcFormula = Lookup ("Cust. Ledger Entry".Open WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Applies-to Entry Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Direct Debit Collection Status"; Option)
        {
            CalcFormula = Lookup ("Direct Debit Collection".Status WHERE ("No." = FIELD ("Direct Debit Collection No.")));
            Caption = 'Direct Debit Collection Status';
            FieldClass = FlowField;
            OptionCaption = 'New,Canceled,File Created,Posted,Closed';
            OptionMembers = New,Canceled,"File Created",Posted,Closed;
        }
        field(22; "Payment Reference"; Code[50])
        {
            CalcFormula = Lookup ("Cust. Ledger Entry"."Payment Reference" WHERE ("Entry No." = FIELD ("Applies-to Entry No.")));
            Caption = 'Payment Reference';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Direct Debit Collection No.", "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Applies-to Entry No.", Status)
        {
        }
    }

    fieldgroups
    {
    }
}

