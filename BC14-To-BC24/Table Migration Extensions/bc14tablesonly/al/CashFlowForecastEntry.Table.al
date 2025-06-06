table 847 "Cash Flow Forecast Entry"
{
    Caption = 'Cash Flow Forecast Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Cash Flow Forecast No."; Code[20])
        {
            Caption = 'Cash Flow Forecast No.';
            TableRelation = "Cash Flow Forecast";
        }
        field(11; "Cash Flow Date"; Date)
        {
            Caption = 'Cash Flow Date';
        }
        field(12; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(13; "Cash Flow Account No."; Code[20])
        {
            Caption = 'Cash Flow Account No.';
            TableRelation = "Cash Flow Account";
        }
        field(14; "Source Type"; Option)
        {
            Caption = 'Source Type';
            Editable = false;
            OptionCaption = ' ,Receivables,Payables,Liquid Funds,Cash Flow Manual Expense,Cash Flow Manual Revenue,Sales Order,Purchase Order,Fixed Assets Budget,Fixed Assets Disposal,Service Orders,G/L Budget,,,Job,Tax,Cortana Intelligence';
            OptionMembers = " ",Receivables,Payables,"Liquid Funds","Cash Flow Manual Expense","Cash Flow Manual Revenue","Sales Order","Purchase Order","Fixed Assets Budget","Fixed Assets Disposal","Service Orders","G/L Budget",,,Job,Tax,"Cortana Intelligence";
        }
        field(15; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(16; Overdue; Boolean)
        {
            Caption = 'Overdue';
            Editable = false;
        }
        field(17; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(21; "Payment Discount"; Decimal)
        {
            Caption = 'Payment Discount';
        }
        field(22; "Associated Entry No."; Integer)
        {
            Caption = 'Associated Entry No.';
        }
        field(23; "Associated Document No."; Code[20])
        {
            Caption = 'Associated Document No.';
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(26; "Recurring Method"; Option)
        {
            BlankZero = true;
            Caption = 'Recurring Method';
            OptionCaption = ',Fixed,Variable';
            OptionMembers = ,"Fixed",Variable;
        }
        field(29; "Amount (LCY)"; Decimal)
        {
            Caption = 'Amount (LCY)';
        }
        field(30; Positive; Boolean)
        {
            Caption = 'Positive';
            Editable = false;
        }
        field(33; "Source No."; Code[20])
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
            IF ("Source Type" = CONST ("Sales Order")) "Sales Header"."No." WHERE ("Document Type" = CONST (Order))
            ELSE
            IF ("Source Type" = CONST ("Purchase Order")) "Purchase Header"."No." WHERE ("Document Type" = CONST (Order))
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
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Cash Flow Account No.", "Cash Flow Date", "Cash Flow Forecast No.")
        {
            SumIndexFields = "Amount (LCY)";
        }
        key(Key3; "Cash Flow Forecast No.", "Cash Flow Account No.", "Source Type", "Cash Flow Date", Positive)
        {
            SumIndexFields = "Amount (LCY)", "Payment Discount";
        }
        key(Key4; "Cash Flow Account No.", "Cash Flow Forecast No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Cash Flow Date")
        {
            SumIndexFields = "Amount (LCY)", "Payment Discount";
        }
        key(Key5; "Cash Flow Forecast No.", "Cash Flow Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "Cash Flow Account No.", "Cash Flow Date", "Source Type")
        {
        }
    }
}

