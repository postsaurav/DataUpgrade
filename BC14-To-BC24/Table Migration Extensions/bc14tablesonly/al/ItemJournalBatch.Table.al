table 233 "Item Journal Batch"
{
    Caption = 'Item Journal Batch';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Item Journal Template";
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
        field(4; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(6; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Item Journal Template".Type WHERE (Name = FIELD ("Journal Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Item,Transfer,Phys. Inventory,Revaluation,Consumption,Output,Capacity,Prod. Order';
            OptionMembers = Item,Transfer,"Phys. Inventory",Revaluation,Consumption,Output,Capacity,"Prod. Order";
        }
        field(22; Recurring; Boolean)
        {
            CalcFormula = Lookup ("Item Journal Template".Recurring WHERE (Name = FIELD ("Journal Template Name")));
            Caption = 'Recurring';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

