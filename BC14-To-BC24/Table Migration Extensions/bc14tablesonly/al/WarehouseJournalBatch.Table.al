table 7310 "Warehouse Journal Batch"
{
    Caption = 'Warehouse Journal Batch';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Warehouse Journal Template";
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
        field(6; "Registering No. Series"; Code[20])
        {
            Caption = 'Registering No. Series';
            TableRelation = "No. Series";
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location;
        }
        field(21; "Template Type"; Option)
        {
            CalcFormula = Lookup ("Warehouse Journal Template".Type WHERE (Name = FIELD ("Journal Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Item,Physical Inventory,Reclassification';
            OptionMembers = Item,"Physical Inventory",Reclassification;
        }
        field(7700; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Warehouse Employee" WHERE ("Location Code" = FIELD ("Location Code"));
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name, "Location Code")
        {
            Clustered = true;
        }
        key(Key2; "Location Code", "Assigned User ID")
        {
        }
    }

    fieldgroups
    {
    }
}

