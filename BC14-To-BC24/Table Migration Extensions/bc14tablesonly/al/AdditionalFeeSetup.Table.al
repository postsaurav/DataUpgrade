table 1050 "Additional Fee Setup"
{
    Caption = 'Additional Fee Setup';

    fields
    {
        field(1; "Charge Per Line"; Boolean)
        {
            Caption = 'Charge Per Line';
        }
        field(2; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
            NotBlank = true;
            TableRelation = "Reminder Terms".Code;
        }
        field(3; "Reminder Level No."; Integer)
        {
            Caption = 'Reminder Level No.';
            NotBlank = true;
            TableRelation = "Reminder Level"."No.";
        }
        field(4; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
        }
        field(5; "Threshold Remaining Amount"; Decimal)
        {
            Caption = 'Threshold Remaining Amount';
            MinValue = 0;
        }
        field(6; "Additional Fee Amount"; Decimal)
        {
            Caption = 'Additional Fee Amount';
            MinValue = 0;
        }
        field(7; "Additional Fee %"; Decimal)
        {
            Caption = 'Additional Fee %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Min. Additional Fee Amount"; Decimal)
        {
            Caption = 'Min. Additional Fee Amount';
            MinValue = 0;
        }
        field(9; "Max. Additional Fee Amount"; Decimal)
        {
            Caption = 'Max. Additional Fee Amount';
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Reminder Terms Code", "Reminder Level No.", "Charge Per Line", "Currency Code", "Threshold Remaining Amount")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

