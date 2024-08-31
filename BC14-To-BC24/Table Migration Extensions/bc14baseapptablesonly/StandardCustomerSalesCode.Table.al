table 172 "Standard Customer Sales Code"
{
    Caption = 'Standard Customer Sales Code';

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Standard Sales Code";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Valid From Date"; Date)
        {
            Caption = 'Valid From Date';
        }
        field(5; "Valid To date"; Date)
        {
            Caption = 'Valid To date';
        }
        field(6; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(7; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(8; "Direct Debit Mandate ID"; Code[35])
        {
            Caption = 'Direct Debit Mandate ID';
            TableRelation = "SEPA Direct Debit Mandate" WHERE ("Customer No." = FIELD ("Customer No."),
                                                               Blocked = CONST (false),
                                                               Closed = CONST (false));
        }
        field(9; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(15; "Insert Rec. Lines On Quotes"; Option)
        {
            Caption = 'Insert Rec. Lines On Quotes';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(16; "Insert Rec. Lines On Orders"; Option)
        {
            Caption = 'Insert Rec. Lines On Orders';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(17; "Insert Rec. Lines On Invoices"; Option)
        {
            Caption = 'Insert Rec. Lines On Invoices';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(18; "Insert Rec. Lines On Cr. Memos"; Option)
        {
            Caption = 'Insert Rec. Lines On Cr. Memos';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

