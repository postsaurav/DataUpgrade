table 10561 "Payment Period Setup"
{
    Caption = 'Payment Period Setup';

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; "Days From"; Integer)
        {
            Caption = 'Days From';
            MinValue = 0;
        }
        field(3; "Days To"; Integer)
        {
            Caption = 'Days To';
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

