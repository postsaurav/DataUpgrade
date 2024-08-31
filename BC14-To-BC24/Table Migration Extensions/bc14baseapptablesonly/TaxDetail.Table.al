table 322 "Tax Detail"
{
    Caption = 'Tax Detail';

    fields
    {
        field(1; "Tax Jurisdiction Code"; Code[10])
        {
            Caption = 'Tax Jurisdiction Code';
            NotBlank = true;
            TableRelation = "Tax Jurisdiction";
        }
        field(2; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(3; "Tax Type"; Option)
        {
            Caption = 'Tax Type';
            NotBlank = false;
            OptionCaption = 'Sales Tax,Excise Tax';
            OptionMembers = "Sales Tax","Excise Tax";
        }
        field(4; "Maximum Amount/Qty."; Decimal)
        {
            Caption = 'Maximum Amount/Qty.';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
        }
        field(5; "Tax Below Maximum"; Decimal)
        {
            Caption = 'Tax Below Maximum';
            DecimalPlaces = 1 : 3;
            MinValue = 0;
        }
        field(6; "Tax Above Maximum"; Decimal)
        {
            Caption = 'Tax Above Maximum';
            DecimalPlaces = 1 : 3;
            MinValue = 0;
        }
        field(7; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(8; "Calculate Tax on Tax"; Boolean)
        {
            Caption = 'Calculate Tax on Tax';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Tax Jurisdiction Code", "Tax Group Code", "Tax Type", "Effective Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

