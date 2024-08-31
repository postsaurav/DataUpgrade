table 7116 "Analysis Column Template"
{
    Caption = 'Analysis Column Template';
    DataCaptionFields = Name, Description;
    ReplicateData = false;

    fields
    {
        field(1; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[80])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Analysis Area", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

