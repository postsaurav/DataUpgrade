table 5917 "Fault Reason Code"
{
    Caption = 'Fault Reason Code';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Exclude Warranty Discount"; Boolean)
        {
            Caption = 'Exclude Warranty Discount';
        }
        field(4; "Exclude Contract Discount"; Boolean)
        {
            Caption = 'Exclude Contract Discount';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, "Exclude Warranty Discount", "Exclude Contract Discount")
        {
        }
    }
}

