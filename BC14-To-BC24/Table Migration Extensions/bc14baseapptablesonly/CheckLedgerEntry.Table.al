table 272 "Check Ledger Entry"
{
    Caption = 'Check Ledger Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(3; "Bank Account Ledger Entry No."; Integer)
        {
            Caption = 'Bank Account Ledger Entry No.';
            TableRelation = "Bank Account Ledger Entry";
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(9; "Check Date"; Date)
        {
            Caption = 'Check Date';
        }
        field(10; "Check No."; Code[20])
        {
            Caption = 'Check No.';
        }
        field(11; "Check Type"; Option)
        {
            Caption = 'Check Type';
            OptionCaption = 'Total Check,Partial Check';
            OptionMembers = "Total Check","Partial Check";
        }
        field(12; "Bank Payment Type"; Option)
        {
            Caption = 'Bank Payment Type';
            OptionCaption = ' ,Computer Check,Manual Check,Electronic Payment';
            OptionMembers = " ","Computer Check","Manual Check","Electronic Payment";
        }
        field(13; "Entry Status"; Option)
        {
            Caption = 'Entry Status';
            OptionCaption = ',Printed,Voided,Posted,Financially Voided,Test Print,Exported,Transmitted';
            OptionMembers = ,Printed,Voided,Posted,"Financially Voided","Test Print",Exported,Transmitted;
        }
        field(14; "Original Entry Status"; Option)
        {
            Caption = 'Original Entry Status';
            OptionCaption = ' ,Printed,Voided,Posted,Financially Voided';
            OptionMembers = " ",Printed,Voided,Posted,"Financially Voided";
        }
        field(15; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(16; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Bal. Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST ("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST ("Fixed Asset")) "Fixed Asset";
        }
        field(17; Open; Boolean)
        {
            Caption = 'Open';
        }
        field(18; "Statement Status"; Option)
        {
            Caption = 'Statement Status';
            OptionCaption = 'Open,Bank Acc. Entry Applied,Check Entry Applied,Closed';
            OptionMembers = Open,"Bank Acc. Entry Applied","Check Entry Applied",Closed;
        }
        field(19; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            TableRelation = "Bank Acc. Reconciliation Line"."Statement No." WHERE ("Bank Account No." = FIELD ("Bank Account No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(20; "Statement Line No."; Integer)
        {
            Caption = 'Statement Line No.';
            TableRelation = "Bank Acc. Reconciliation Line"."Statement Line No." WHERE ("Bank Account No." = FIELD ("Bank Account No."),
                                                                                        "Statement No." = FIELD ("Statement No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(21; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(22; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(23; "Data Exch. Entry No."; Integer)
        {
            Caption = 'Data Exch. Entry No.';
            Editable = false;
            TableRelation = "Data Exch.";
        }
        field(24; "Data Exch. Voided Entry No."; Integer)
        {
            Caption = 'Data Exch. Voided Entry No.';
            Editable = false;
            TableRelation = "Data Exch.";
        }
        field(25; "Positive Pay Exported"; Boolean)
        {
            Caption = 'Positive Pay Exported';
        }
        field(26; "Record ID to Print"; RecordID)
        {
            Caption = 'Record ID to Print';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Bank Account No.", "Check Date")
        {
        }
        key(Key3; "Bank Account No.", "Entry Status", "Check No.", "Statement Status")
        {
        }
        key(Key4; "Bank Account Ledger Entry No.")
        {
        }
        key(Key5; "Bank Account No.", Open)
        {
        }
        key(Key6; "Document No.", "Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

