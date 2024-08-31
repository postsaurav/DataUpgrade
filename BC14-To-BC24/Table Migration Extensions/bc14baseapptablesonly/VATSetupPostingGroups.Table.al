table 1877 "VAT Setup Posting Groups"
{
    Caption = 'VAT Setup Posting Groups';

    fields
    {
        field(2; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            NotBlank = true;
        }
        field(4; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Sales VAT Account"; Code[20])
        {
            Caption = 'Sales VAT Account';
            TableRelation = "G/L Account";
        }
        field(9; "Purchase VAT Account"; Code[20])
        {
            Caption = 'Purchase VAT Account';
            TableRelation = "G/L Account";
        }
        field(11; "Reverse Chrg. VAT Acc."; Code[20])
        {
            Caption = 'Reverse Chrg. VAT Acc.';
            TableRelation = "G/L Account";
        }
        field(18; "VAT Prod. Posting Grp Desc."; Text[100])
        {
            Caption = 'VAT Prod. Posting Grp Desc.';
        }
        field(19; "VAT Clause Desc"; Text[250])
        {
            Caption = 'VAT Clause Desc';
        }
        field(22; Selected; Boolean)
        {
            Caption = 'Selected';
            FieldClass = Normal;
        }
        field(23; "Application Type"; Option)
        {
            Caption = 'Application Type';
            OptionCaption = ',Items,Services';
            OptionMembers = ,Items,Services;
        }
        field(24; Default; Boolean)
        {
            Caption = 'Default';
        }
    }

    keys
    {
        key(Key1; "VAT Prod. Posting Group", Default)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

