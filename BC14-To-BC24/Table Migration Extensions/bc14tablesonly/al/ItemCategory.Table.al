table 5722 "Item Category"
{
    Caption = 'Item Category';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Parent Category"; Code[20])
        {
            Caption = 'Parent Category';
            TableRelation = "Item Category";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(10; "Presentation Order"; Integer)
        {
            Caption = 'Presentation Order';
        }
        field(11; "Has Children"; Boolean)
        {
            Caption = 'Has Children';
        }
        field(12; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Parent Category")
        {
        }
    }

    fieldgroups
    {
    }
}

