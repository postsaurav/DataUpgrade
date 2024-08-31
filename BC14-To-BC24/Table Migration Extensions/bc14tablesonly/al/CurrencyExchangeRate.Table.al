table 330 "Currency Exchange Rate"
{
    Caption = 'Currency Exchange Rate';
    DataCaptionFields = "Currency Code";

    fields
    {
        field(1; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            NotBlank = true;
            TableRelation = Currency;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            NotBlank = true;
        }
        field(3; "Exchange Rate Amount"; Decimal)
        {
            Caption = 'Exchange Rate Amount';
            DecimalPlaces = 1 : 6;
            MinValue = 0;
        }
        field(4; "Adjustment Exch. Rate Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Adjustment Exch. Rate Amount';
            DecimalPlaces = 1 : 6;
            MinValue = 0;
        }
        field(5; "Relational Currency Code"; Code[10])
        {
            Caption = 'Relational Currency Code';
            TableRelation = Currency;
        }
        field(6; "Relational Exch. Rate Amount"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Relational Exch. Rate Amount';
            DecimalPlaces = 1 : 6;
            MinValue = 0;
        }
        field(7; "Fix Exchange Rate Amount"; Option)
        {
            Caption = 'Fix Exchange Rate Amount';
            OptionCaption = 'Currency,Relational Currency,Both';
            OptionMembers = Currency,"Relational Currency",Both;
        }
        field(8; "Relational Adjmt Exch Rate Amt"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Relational Adjmt Exch Rate Amt';
            DecimalPlaces = 1 : 6;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Currency Code", "Starting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

