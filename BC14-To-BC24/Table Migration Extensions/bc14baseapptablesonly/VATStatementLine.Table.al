table 256 "VAT Statement Line"
{
    Caption = 'VAT Statement Line';

    fields
    {
        field(1; "Statement Template Name"; Code[10])
        {
            Caption = 'Statement Template Name';
            TableRelation = "VAT Statement Template";
        }
        field(2; "Statement Name"; Code[10])
        {
            Caption = 'Statement Name';
            TableRelation = "VAT Statement Name".Name WHERE ("Statement Template Name" = FIELD ("Statement Template Name"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Row No."; Code[10])
        {
            Caption = 'Row No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Account Totaling,VAT Entry Totaling,Row Totaling,Description';
            OptionMembers = "Account Totaling","VAT Entry Totaling","Row Totaling",Description;
        }
        field(7; "Account Totaling"; Text[30])
        {
            Caption = 'Account Totaling';
            TableRelation = "G/L Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;
        }
        field(9; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(10; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(11; "Row Totaling"; Text[50])
        {
            Caption = 'Row Totaling';
        }
        field(12; "Amount Type"; Option)
        {
            Caption = 'Amount Type';
            OptionCaption = ' ,Amount,Base,Unrealized Amount,Unrealized Base';
            OptionMembers = " ",Amount,Base,"Unrealized Amount","Unrealized Base";
        }
        field(13; "Calculate with"; Option)
        {
            Caption = 'Calculate with';
            OptionCaption = 'Sign,Opposite Sign';
            OptionMembers = Sign,"Opposite Sign";
        }
        field(14; Print; Boolean)
        {
            Caption = 'Print';
            InitValue = true;
        }
        field(15; "Print with"; Option)
        {
            Caption = 'Print with';
            OptionCaption = 'Sign,Opposite Sign';
            OptionMembers = Sign,"Opposite Sign";
        }
        field(16; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(17; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(18; "Tax Jurisdiction Code"; Code[10])
        {
            Caption = 'Tax Jurisdiction Code';
            TableRelation = "Tax Jurisdiction";
        }
        field(19; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(20; "Box No."; Text[30])
        {
            Caption = 'Box No.';
        }
    }

    keys
    {
        key(Key1; "Statement Template Name", "Statement Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

