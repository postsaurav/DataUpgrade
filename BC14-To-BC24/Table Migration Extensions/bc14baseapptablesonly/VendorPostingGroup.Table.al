table 93 "Vendor Posting Group"
{
    Caption = 'Vendor Posting Group';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Payables Account"; Code[20])
        {
            Caption = 'Payables Account';
            TableRelation = "G/L Account";
        }
        field(7; "Service Charge Acc."; Code[20])
        {
            Caption = 'Service Charge Acc.';
            TableRelation = "G/L Account";
        }
        field(8; "Payment Disc. Debit Acc."; Code[20])
        {
            Caption = 'Payment Disc. Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(9; "Invoice Rounding Account"; Code[20])
        {
            Caption = 'Invoice Rounding Account';
            TableRelation = "G/L Account";
        }
        field(10; "Debit Curr. Appln. Rndg. Acc."; Code[20])
        {
            Caption = 'Debit Curr. Appln. Rndg. Acc.';
            TableRelation = "G/L Account";
        }
        field(11; "Credit Curr. Appln. Rndg. Acc."; Code[20])
        {
            Caption = 'Credit Curr. Appln. Rndg. Acc.';
            TableRelation = "G/L Account";
        }
        field(12; "Debit Rounding Account"; Code[20])
        {
            Caption = 'Debit Rounding Account';
            TableRelation = "G/L Account";
        }
        field(13; "Credit Rounding Account"; Code[20])
        {
            Caption = 'Credit Rounding Account';
            TableRelation = "G/L Account";
        }
        field(16; "Payment Disc. Credit Acc."; Code[20])
        {
            Caption = 'Payment Disc. Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(17; "Payment Tolerance Debit Acc."; Code[20])
        {
            Caption = 'Payment Tolerance Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(18; "Payment Tolerance Credit Acc."; Code[20])
        {
            Caption = 'Payment Tolerance Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(21; "View All Accounts on Lookup"; Boolean)
        {
            Caption = 'View All Accounts on Lookup';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Code")
        {
        }
    }
}

