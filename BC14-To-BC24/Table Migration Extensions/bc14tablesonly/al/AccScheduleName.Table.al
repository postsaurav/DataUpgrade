table 84 "Acc. Schedule Name"
{
    Caption = 'Acc. Schedule Name';
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
        field(3; "Default Column Layout"; Code[10])
        {
            Caption = 'Default Column Layout';
            TableRelation = "Column Layout Name";
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
    }
}

