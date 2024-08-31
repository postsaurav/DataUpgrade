table 9001 "User Group Member"
{
    Caption = 'User Group Member';
    DataPerCompany = false;
    ReplicateData = false;

    fields
    {
        field(1; "User Group Code"; Code[20])
        {
            Caption = 'User Group Code';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = "User Group";
        }
        field(2; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            DataClassification = EndUserPseudonymousIdentifiers;
            NotBlank = true;
            TableRelation = User;
        }
        field(3; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company;
        }
        field(4; "User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'User Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "User Full Name"; Text[80])
        {
            CalcFormula = Lookup (User."Full Name" WHERE ("User Security ID" = FIELD ("User Security ID")));
            Caption = 'User Full Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "User Group Name"; Text[50])
        {
            CalcFormula = Lookup ("User Group".Name WHERE (Code = FIELD ("User Group Code")));
            Caption = 'User Group Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "User Group Code", "User Security ID", "Company Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

