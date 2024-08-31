table 1262 "Isolated Certificate"
{
    Caption = 'Isolated Certificate';
    DataPerCompany = false;
    Permissions = TableData "Isolated Certificate" = rimd,
                  TableData "No. Series Tenant" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            Editable = false;
        }
        field(2; Scope; Option)
        {
            Caption = 'Available To';
            InitValue = Company;
            NotBlank = true;
            OptionCaption = ',Company,User,Company and User';
            OptionMembers = ,Company,User,CompanyAndUser;
        }
        field(3; Password; Text[50])
        {
            Caption = 'Password';
            ExtendedDatatype = Masked;
        }
        field(4; "Expiry Date"; DateTime)
        {
            Caption = 'Expiry Date';
            Editable = false;
        }
        field(5; "Has Private Key"; Boolean)
        {
            Caption = 'Has Private Key';
            Editable = false;
        }
        field(6; Name; Text[50])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
        }
        field(8; "Company ID"; Text[30])
        {
            Caption = 'Company ID';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(10; ThumbPrint; Text[50])
        {
            Caption = 'ThumbPrint';
            Editable = false;
        }
        field(13; "Issued By"; Text[250])
        {
            Caption = 'Issued By';
            Editable = false;
        }
        field(14; "Issued To"; Text[250])
        {
            Caption = 'Issued To';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Name)
        {
        }
    }
}

