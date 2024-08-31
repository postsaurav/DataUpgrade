table 7327 "Whse. Worksheet Name"
{
    Caption = 'Whse. Worksheet Name';
    DataCaptionFields = Name, Description, "Location Code";

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            TableRelation = "Whse. Worksheet Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Whse. Worksheet Template".Type WHERE (Name = FIELD ("Worksheet Template Name")));
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

