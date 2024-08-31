table 5056 "Contact Mailing Group"
{
    Caption = 'Contact Mailing Group';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            NotBlank = true;
            TableRelation = Contact;
        }
        field(2; "Mailing Group Code"; Code[10])
        {
            Caption = 'Mailing Group Code';
            NotBlank = true;
            TableRelation = "Mailing Group";
        }
        field(3; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact."Company Name" WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Mailing Group Description"; Text[100])
        {
            CalcFormula = Lookup ("Mailing Group".Description WHERE (Code = FIELD ("Mailing Group Code")));
            Caption = 'Mailing Group Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Mailing Group Code")
        {
            Clustered = true;
        }
        key(Key2; "Mailing Group Code")
        {
        }
    }

    fieldgroups
    {
    }
}

