table 232 "Gen. Journal Batch"
{
    Caption = 'Gen. Journal Batch';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(5; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(6; "Bal. Account No."; Code[20])
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
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(9; "Copy VAT Setup to Jnl. Lines"; Boolean)
        {
            Caption = 'Copy VAT Setup to Jnl. Lines';
            InitValue = true;
        }
        field(10; "Allow VAT Difference"; Boolean)
        {
            Caption = 'Allow VAT Difference';
        }
        field(11; "Allow Payment Export"; Boolean)
        {
            Caption = 'Allow Payment Export';
        }
        field(12; "Bank Statement Import Format"; Code[20])
        {
            Caption = 'Bank Statement Import Format';
            TableRelation = "Bank Export/Import Setup".Code WHERE (Direction = CONST (Import));
        }
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Gen. Journal Template".Type WHERE (Name = FIELD ("Journal Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'General,Sales,Purchases,Cash Receipts,Payments,Assets,Intercompany,Jobs';
            OptionMembers = General,Sales,Purchases,"Cash Receipts",Payments,Assets,Intercompany,Jobs;
        }
        field(22; Recurring; Boolean)
        {
            CalcFormula = Lookup ("Gen. Journal Template".Recurring WHERE (Name = FIELD ("Journal Template Name")));
            Caption = 'Recurring';
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Suggest Balancing Amount"; Boolean)
        {
            Caption = 'Suggest Balancing Amount';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
        }
        field(8002; BalAccountId; Guid)
        {
            Caption = 'BalAccountId';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

