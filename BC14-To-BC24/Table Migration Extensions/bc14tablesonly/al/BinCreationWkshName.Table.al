table 7337 "Bin Creation Wksh. Name"
{
    Caption = 'Bin Creation Wksh. Name';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            NotBlank = true;
            TableRelation = "Bin Creation Wksh. Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location;
        }
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Bin Creation Wksh. Template".Type WHERE (Name = FIELD ("Worksheet Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Put-away,Pick,Movement';
            OptionMembers = "Put-away",Pick,Movement;
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", Name, "Location Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

