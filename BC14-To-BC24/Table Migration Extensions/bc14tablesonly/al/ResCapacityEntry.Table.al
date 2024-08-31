table 160 "Res. Capacity Entry"
{
    Caption = 'Res. Capacity Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }
        field(3; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            TableRelation = "Resource Group";
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; Capacity; Decimal)
        {
            Caption = 'Capacity';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Resource No.", Date)
        {
            SumIndexFields = Capacity;
        }
        key(Key3; "Resource Group No.", Date)
        {
            SumIndexFields = Capacity;
        }
    }

    fieldgroups
    {
    }
}

