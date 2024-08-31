table 5095 "Duplicate Search String Setup"
{
    Caption = 'Duplicate Search String Setup';

    fields
    {
        field(1; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(2; "Part of Field"; Option)
        {
            Caption = 'Part of Field';
            OptionCaption = 'First,Last';
            OptionMembers = First,Last;
        }
        field(3; Length; Integer)
        {
            Caption = 'Length';
            InitValue = 5;
            MaxValue = 10;
            MinValue = 2;
        }
        field(4; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
        }
    }

    keys
    {
        key(Key1; "Field No.", "Part of Field")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

