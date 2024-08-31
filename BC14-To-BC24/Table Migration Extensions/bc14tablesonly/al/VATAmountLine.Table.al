table 290 "VAT Amount Line"
{
    Caption = 'VAT Amount Line';

    fields
    {
        field(1; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(2; "VAT Base"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base';
            Editable = false;
        }
        field(3; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(4; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            Editable = false;
        }
        field(5; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier';
            Editable = false;
        }
        field(6; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
            Editable = false;
        }
        field(7; "Inv. Disc. Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Disc. Base Amount';
            Editable = false;
        }
        field(8; "Invoice Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Invoice Discount Amount';
        }
        field(9; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(10; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            Editable = false;
            TableRelation = "Tax Group";
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(12; Modified; Boolean)
        {
            Caption = 'Modified';
        }
        field(13; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';
        }
        field(14; "Calculated VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Calculated VAT Amount';
            Editable = false;
        }
        field(15; "VAT Difference"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            Editable = false;
        }
        field(16; Positive; Boolean)
        {
            Caption = 'Positive';
        }
        field(17; "Includes Prepayment"; Boolean)
        {
            Caption = 'Includes Prepayment';
        }
        field(18; "VAT Clause Code"; Code[20])
        {
            Caption = 'VAT Clause Code';
            TableRelation = "VAT Clause";
        }
        field(19; "Tax Category"; Code[10])
        {
            Caption = 'Tax Category';
        }
        field(20; "Pmt. Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Pmt. Discount Amount';
            Editable = false;
        }
        field(10500; "Reverse Charge"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Reverse Charge';
        }
    }

    keys
    {
        key(Key1; "VAT Identifier", "VAT Calculation Type", "Tax Group Code", "Use Tax", Positive)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

