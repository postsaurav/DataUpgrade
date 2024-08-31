table 1206 "Credit Transfer Entry"
{
    Caption = 'Credit Transfer Entry';
    DataCaptionFields = "Account Type", "Account No.", "Transaction ID";

    fields
    {
        field(1; "Credit Transfer Register No."; Integer)
        {
            Caption = 'Credit Transfer Register No.';
            TableRelation = "Credit Transfer Register";
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'Customer,Vendor,Employee';
            OptionMembers = Customer,Vendor,Employee;
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Account Type" = CONST (Vendor)) Vendor;
        }
        field(5; "Applies-to Entry No."; Integer)
        {
            Caption = 'Applies-to Entry No.';
            TableRelation = IF ("Account Type" = CONST (Customer)) "Cust. Ledger Entry"
            ELSE
            IF ("Account Type" = CONST (Vendor)) "Vendor Ledger Entry";
        }
        field(6; "Transfer Date"; Date)
        {
            Caption = 'Transfer Date';
        }
        field(7; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(8; "Transfer Amount"; Decimal)
        {
            Caption = 'Transfer Amount';
        }
        field(9; "Transaction ID"; Text[35])
        {
            Caption = 'Transaction ID';
        }
        field(10; Canceled; Boolean)
        {
            CalcFormula = Exist ("Credit Transfer Register" WHERE ("No." = FIELD ("Credit Transfer Register No."),
                                                                  Status = CONST (Canceled)));
            Caption = 'Canceled';
            FieldClass = FlowField;
        }
        field(11; "Recipient Bank Acc. No."; Code[50])
        {
            Caption = 'Recipient Bank Acc. No.';
        }
        field(12; "Message to Recipient"; Text[140])
        {
            Caption = 'Message to Recipient';
        }
    }

    keys
    {
        key(Key1; "Credit Transfer Register No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

