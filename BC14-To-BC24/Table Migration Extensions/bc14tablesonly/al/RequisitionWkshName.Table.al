table 245 "Requisition Wksh. Name"
{
    Caption = 'Requisition Wksh. Name';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            NotBlank = true;
            TableRelation = "Req. Wksh. Template";
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
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Req. Wksh. Template".Type WHERE (Name = FIELD ("Worksheet Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Req.,For. Labor,Planning';
            OptionMembers = "Req.","For. Labor",Planning;
        }
        field(22; Recurring; Boolean)
        {
            CalcFormula = Lookup ("Req. Wksh. Template".Recurring WHERE (Name = FIELD ("Worksheet Template Name")));
            Caption = 'Recurring';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

