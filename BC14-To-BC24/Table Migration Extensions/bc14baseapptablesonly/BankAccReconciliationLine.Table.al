table 274 "Bank Acc. Reconciliation Line"
{
    Caption = 'Bank Acc. Reconciliation Line';
    Permissions = TableData "Data Exch. Field" = rimd;

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(2; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            TableRelation = "Bank Acc. Reconciliation"."Statement No." WHERE ("Bank Account No." = FIELD ("Bank Account No."));
        }
        field(3; "Statement Line No."; Integer)
        {
            Caption = 'Statement Line No.';
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(5; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Statement Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Statement Amount';
        }
        field(8; Difference; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Difference';
        }
        field(9; "Applied Amount"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Applied Amount';
            Editable = false;
        }
        field(10; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Bank Account Ledger Entry,Check Ledger Entry,Difference';
            OptionMembers = "Bank Account Ledger Entry","Check Ledger Entry",Difference;
        }
        field(11; "Applied Entries"; Integer)
        {
            Caption = 'Applied Entries';
            Editable = false;
        }
        field(12; "Value Date"; Date)
        {
            Caption = 'Value Date';
        }
        field(13; "Ready for Application"; Boolean)
        {
            Caption = 'Ready for Application';
        }
        field(14; "Check No."; Code[20])
        {
            Caption = 'Check No.';
        }
        field(15; "Related-Party Name"; Text[250])
        {
            Caption = 'Related-Party Name';
        }
        field(16; "Additional Transaction Info"; Text[100])
        {
            Caption = 'Additional Transaction Info';
        }
        field(17; "Data Exch. Entry No."; Integer)
        {
            Caption = 'Data Exch. Entry No.';
            Editable = false;
            TableRelation = "Data Exch.";
        }
        field(18; "Data Exch. Line No."; Integer)
        {
            Caption = 'Data Exch. Line No.';
            Editable = false;
        }
        field(20; "Statement Type"; Option)
        {
            Caption = 'Statement Type';
            OptionCaption = 'Bank Reconciliation,Payment Application';
            OptionMembers = "Bank Reconciliation","Payment Application";
        }
        field(21; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(22; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST ("G/L Account")) "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                                                          Blocked = CONST (false))
            ELSE
            IF ("Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST ("IC Partner")) "IC Partner";
        }
        field(23; "Transaction Text"; Text[140])
        {
            Caption = 'Transaction Text';
        }
        field(24; "Related-Party Bank Acc. No."; Text[100])
        {
            Caption = 'Related-Party Bank Acc. No.';
        }
        field(25; "Related-Party Address"; Text[100])
        {
            Caption = 'Related-Party Address';
        }
        field(26; "Related-Party City"; Text[50])
        {
            Caption = 'Related-Party City';
        }
        field(27; "Payment Reference No."; Code[50])
        {
            Caption = 'Payment Reference No.';
        }
        field(31; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(32; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(50; "Match Confidence"; Option)
        {
            CalcFormula = Max ("Applied Payment Entry"."Match Confidence" WHERE ("Statement Type" = FIELD ("Statement Type"),
                                                                                "Bank Account No." = FIELD ("Bank Account No."),
                                                                                "Statement No." = FIELD ("Statement No."),
                                                                                "Statement Line No." = FIELD ("Statement Line No.")));
            Caption = 'Match Confidence';
            Editable = false;
            FieldClass = FlowField;
            InitValue = "None";
            OptionCaption = 'None,Low,Medium,High,High - Text-to-Account Mapping,Manual,Accepted';
            OptionMembers = "None",Low,Medium,High,"High - Text-to-Account Mapping",Manual,Accepted;
        }
        field(51; "Match Quality"; Integer)
        {
            CalcFormula = Max ("Applied Payment Entry".Quality WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                     "Statement No." = FIELD ("Statement No."),
                                                                     "Statement Line No." = FIELD ("Statement Line No."),
                                                                     "Statement Type" = FIELD ("Statement Type")));
            Caption = 'Match Quality';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Sorting Order"; Integer)
        {
            Caption = 'Sorting Order';
        }
        field(61; "Parent Line No."; Integer)
        {
            Caption = 'Parent Line No.';
            Editable = false;
        }
        field(70; "Transaction ID"; Text[50])
        {
            Caption = 'Transaction ID';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(10500; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
        }
    }

    keys
    {
        key(Key1; "Statement Type", "Bank Account No.", "Statement No.", "Statement Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Account Type", "Statement Amount")
        {
        }
        key(Key3; Type, "Applied Amount")
        {
        }
    }

    fieldgroups
    {
    }
}

