table 1625 "Office Contact Associations"
{
    Caption = 'Office Contact Associations';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
        }
        field(2; "Business Relation Code"; Code[10])
        {
            Caption = 'Business Relation Code';
            TableRelation = "Business Relation";
        }
        field(3; "Associated Table"; Option)
        {
            Caption = 'Associated Table';
            OptionCaption = ' ,Customer,Vendor,Bank Account,Company';
            OptionMembers = " ",Customer,Vendor,"Bank Account",Company;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF ("Associated Table" = CONST (Customer)) Customer
            ELSE
            IF ("Associated Table" = CONST (Vendor)) Vendor
            ELSE
            IF ("Associated Table" = CONST ("Bank Account")) "Bank Account";
        }
        field(5; "Business Relation Description"; Text[100])
        {
            Caption = 'Business Relation Description';
            Editable = false;
        }
        field(6; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
        }
        field(7; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Company,Contact Person';
            OptionMembers = Company,"Contact Person";
        }
    }

    keys
    {
        key(Key1; "Contact No.", Type, "Associated Table")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

