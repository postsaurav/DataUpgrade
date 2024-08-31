table 846 "Cash Flow Worksheet Line"
{
    Caption = 'Cash Flow Worksheet Line';

    fields
    {
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Cash Flow Forecast No."; Code[20])
        {
            Caption = 'Cash Flow Forecast No.';
            TableRelation = "Cash Flow Forecast";
        }
        field(4; "Cash Flow Date"; Date)
        {
            Caption = 'Cash Flow Date';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; "Cash Flow Account No."; Code[20])
        {
            Caption = 'Cash Flow Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(7; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Receivables,Payables,Liquid Funds,Cash Flow Manual Expense,Cash Flow Manual Revenue,Sales Orders,Purchase Orders,Fixed Assets Budget,Fixed Assets Disposal,Service Orders,G/L Budget,,,Job,Tax,Cortana Intelligence';
            OptionMembers = " ",Receivables,Payables,"Liquid Funds","Cash Flow Manual Expense","Cash Flow Manual Revenue","Sales Orders","Purchase Orders","Fixed Assets Budget","Fixed Assets Disposal","Service Orders","G/L Budget",,,Job,Tax,"Cortana Intelligence";
        }
        field(8; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(9; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(10; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(11; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(12; "Pmt. Disc. Tolerance Date"; Date)
        {
            Caption = 'Pmt. Disc. Tolerance Date';
        }
        field(13; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(14; "Payment Discount"; Decimal)
        {
            Caption = 'Payment Discount';
        }
        field(15; "Associated Entry No."; Integer)
        {
            Caption = 'Associated Entry No.';
        }
        field(16; Overdue; Boolean)
        {
            Caption = 'Overdue';
            Editable = false;
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(30; "Amount (LCY)"; Decimal)
        {
            Caption = 'Amount (LCY)';
        }
        field(34; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST ("Liquid Funds")) "G/L Account"
            ELSE
            IF ("Source Type" = CONST (Receivables)) "Cust. Ledger Entry"."Document No."
            ELSE
            IF ("Source Type" = CONST (Payables)) "Vendor Ledger Entry"."Document No."
            ELSE
            IF ("Source Type" = CONST ("Fixed Assets Budget")) "Fixed Asset"
            ELSE
            IF ("Source Type" = CONST ("Fixed Assets Disposal")) "Fixed Asset"
            ELSE
            IF ("Source Type" = CONST ("Sales Orders")) "Sales Header"."No." WHERE ("Document Type" = CONST (Order))
            ELSE
            IF ("Source Type" = CONST ("Purchase Orders")) "Purchase Header"."No." WHERE ("Document Type" = CONST (Order))
            ELSE
            IF ("Source Type" = CONST ("Service Orders")) "Service Header"."No." WHERE ("Document Type" = CONST (Order))
            ELSE
            IF ("Source Type" = CONST ("Cash Flow Manual Expense")) "Cash Flow Manual Expense"
            ELSE
            IF ("Source Type" = CONST ("Cash Flow Manual Revenue")) "Cash Flow Manual Revenue"
            ELSE
            IF ("Source Type" = CONST ("G/L Budget")) "G/L Account"
            ELSE
            IF ("Source Type" = CONST (Job)) Job."No.";
            ValidateTableRelation = false;
        }
        field(35; "G/L Budget Name"; Code[10])
        {
            Caption = 'G/L Budget Name';
            TableRelation = "G/L Budget Name";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Cash Flow Forecast No.", "Document No.")
        {
            SumIndexFields = "Amount (LCY)";
        }
    }

    fieldgroups
    {
    }
}

