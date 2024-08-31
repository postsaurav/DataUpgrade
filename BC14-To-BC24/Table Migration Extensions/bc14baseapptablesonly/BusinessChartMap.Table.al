table 486 "Business Chart Map"
{
    Caption = 'Business Chart Map';

    fields
    {
        field(1; Index; Integer)
        {
            Caption = 'Index';
        }
        field(2; "Value String"; Text[30])
        {
            Caption = 'Value String';
        }
        field(3; Name; Text[249])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(Key1; Index)
        {
            Clustered = true;
        }
        key(Key2; "Value String")
        {
        }
        key(Key3; Name)
        {
        }
    }

    fieldgroups
    {
    }
}

