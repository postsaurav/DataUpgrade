table 328 "Currency for Fin. Charge Terms"
{
    Caption = 'Currency for Fin. Charge Terms';
    DataCaptionFields = "Fin. Charge Terms Code";

    fields
    {
        field(1; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            Editable = false;
            NotBlank = true;
            TableRelation = "Finance Charge Terms";
        }
        field(2; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            NotBlank = true;
            TableRelation = Currency;
        }
        field(4; "Additional Fee"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional Fee';
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Fin. Charge Terms Code", "Currency Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

