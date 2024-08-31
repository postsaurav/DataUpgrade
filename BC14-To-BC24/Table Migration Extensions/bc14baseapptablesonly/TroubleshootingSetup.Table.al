table 5945 "Troubleshooting Setup"
{
    Caption = 'Troubleshooting Setup';
    DataCaptionFields = "No.";

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Service Item Group,Item,Service Item';
            OptionMembers = "Service Item Group",Item,"Service Item";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST ("Service Item Group")) "Service Item Group"
            ELSE
            IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST ("Service Item")) "Service Item";
        }
        field(3; "Troubleshooting No."; Code[20])
        {
            Caption = 'Troubleshooting No.';
            NotBlank = true;
            TableRelation = "Troubleshooting Header";
        }
        field(4; "Troubleshooting Description"; Text[100])
        {
            CalcFormula = Lookup ("Troubleshooting Header".Description WHERE ("No." = FIELD ("Troubleshooting No.")));
            Caption = 'Troubleshooting Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; Type, "No.", "Troubleshooting No.")
        {
            Clustered = true;
        }
        key(Key2; "Troubleshooting No.", Type, "No.")
        {
        }
    }

    fieldgroups
    {
    }
}

