table 2831 "Native - Payment"
{
    Caption = 'Native - Payment';
    ReplicateData = false;

    fields
    {
        field(1; "Ledger Entry No."; Integer)
        {
            Caption = 'Ledger Entry No.';
        }
        field(2; "Payment No."; Integer)
        {
            Caption = 'Payment No.';
        }
        field(3; "Customer Id"; Guid)
        {
            Caption = 'Customer Id';
            TableRelation = Customer.Id;
        }
        field(4; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(5; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Applies-to Invoice Id"; Guid)
        {
            Caption = 'Applies-to Invoice Id';
        }
        field(8; "Applies-to Invoice No."; Code[20])
        {
            Caption = 'Applies-to Invoice No.';
        }
        field(9; "Payment Method Id"; Guid)
        {
            Caption = 'Payment Method Id';
        }
        field(10; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
        }
    }

    keys
    {
        key(Key1; "Applies-to Invoice Id", "Payment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

