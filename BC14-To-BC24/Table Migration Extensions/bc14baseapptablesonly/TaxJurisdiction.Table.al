table 320 "Tax Jurisdiction"
{
    Caption = 'Tax Jurisdiction';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Tax Account (Sales)"; Code[20])
        {
            Caption = 'Tax Account (Sales)';
            TableRelation = "G/L Account";
        }
        field(4; "Tax Account (Purchases)"; Code[20])
        {
            Caption = 'Tax Account (Purchases)';
            TableRelation = "G/L Account";
        }
        field(5; "Report-to Jurisdiction"; Code[10])
        {
            Caption = 'Report-to Jurisdiction';
            TableRelation = "Tax Jurisdiction";
        }
        field(6; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(7; "Tax Group Filter"; Code[20])
        {
            Caption = 'Tax Group Filter';
            FieldClass = FlowFilter;
            TableRelation = "Tax Group";
        }
        field(8; "Unreal. Tax Acc. (Sales)"; Code[20])
        {
            Caption = 'Unreal. Tax Acc. (Sales)';
            TableRelation = "G/L Account";
        }
        field(9; "Unreal. Tax Acc. (Purchases)"; Code[20])
        {
            Caption = 'Unreal. Tax Acc. (Purchases)';
            TableRelation = "G/L Account";
        }
        field(10; "Reverse Charge (Purchases)"; Code[20])
        {
            Caption = 'Reverse Charge (Purchases)';
            TableRelation = "G/L Account";
        }
        field(11; "Unreal. Rev. Charge (Purch.)"; Code[20])
        {
            Caption = 'Unreal. Rev. Charge (Purch.)';
            TableRelation = "G/L Account";
        }
        field(12; "Unrealized VAT Type"; Option)
        {
            Caption = 'Unrealized VAT Type';
            OptionCaption = ' ,Percentage,First,Last,First (Fully Paid),Last (Fully Paid)';
            OptionMembers = " ",Percentage,First,Last,"First (Fully Paid)","Last (Fully Paid)";
        }
        field(13; "Calculate Tax on Tax"; Boolean)
        {
            Caption = 'Calculate Tax on Tax';
        }
        field(14; "Adjust for Payment Discount"; Boolean)
        {
            Caption = 'Adjust for Payment Discount';
        }
        field(15; Name; Text[30])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Report-to Jurisdiction")
        {
        }
    }

    fieldgroups
    {
    }
}

