table 5054 "Contact Business Relation"
{
    Caption = 'Contact Business Relation';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            NotBlank = true;
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(2; "Business Relation Code"; Code[10])
        {
            Caption = 'Business Relation Code';
            NotBlank = true;
            TableRelation = "Business Relation";
        }
        field(3; "Link to Table"; Option)
        {
            Caption = 'Link to Table';
            OptionCaption = ' ,Customer,Vendor,Bank Account';
            OptionMembers = " ",Customer,Vendor,"Bank Account";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF ("Link to Table" = CONST (Customer)) Customer
            ELSE
            IF ("Link to Table" = CONST (Vendor)) Vendor
            ELSE
            IF ("Link to Table" = CONST ("Bank Account")) "Bank Account";
        }
        field(5; "Business Relation Description"; Text[100])
        {
            CalcFormula = Lookup ("Business Relation".Description WHERE (Code = FIELD ("Business Relation Code")));
            Caption = 'Business Relation Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Business Relation Code")
        {
            Clustered = true;
        }
        key(Key2; "Link to Table", "No.")
        {
        }
        key(Key3; "Link to Table", "Contact No.")
        {
        }
        key(Key4; "Business Relation Code")
        {
        }
    }

    fieldgroups
    {
    }
}

