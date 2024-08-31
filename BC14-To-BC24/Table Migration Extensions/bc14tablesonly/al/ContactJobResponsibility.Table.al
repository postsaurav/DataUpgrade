table 5067 "Contact Job Responsibility"
{
    Caption = 'Contact Job Responsibility';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            NotBlank = true;
            TableRelation = Contact WHERE (Type = CONST (Person));
        }
        field(2; "Job Responsibility Code"; Code[10])
        {
            Caption = 'Job Responsibility Code';
            NotBlank = true;
            TableRelation = "Job Responsibility";
        }
        field(3; "Job Responsibility Description"; Text[100])
        {
            CalcFormula = Lookup ("Job Responsibility".Description WHERE (Code = FIELD ("Job Responsibility Code")));
            Caption = 'Job Responsibility Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact."Company Name" WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Job Responsibility Code")
        {
            Clustered = true;
        }
        key(Key2; "Job Responsibility Code")
        {
        }
    }

    fieldgroups
    {
    }
}

