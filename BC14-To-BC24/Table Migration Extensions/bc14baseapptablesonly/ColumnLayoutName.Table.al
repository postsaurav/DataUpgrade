table 333 "Column Layout Name"
{
    Caption = 'Column Layout Name';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(4; "Analysis View Name"; Code[10])
        {
            Caption = 'Analysis View Name';
            TableRelation = "Analysis View";
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name, Description, "Analysis View Name")
        {
        }
    }
}

