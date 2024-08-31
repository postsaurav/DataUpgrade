table 5201 "Alternative Address"
{
    Caption = 'Alternative Address';
    DataCaptionFields = "Employee No.", Name, "Code";

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = Employee;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; County; Text[30])
        {
            Caption = 'County';
        }
        field(10; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(11; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(12; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(13; Comment; Boolean)
        {
            CalcFormula = Exist ("Human Resource Comment Line" WHERE ("Table Name" = CONST ("Alternative Address"),
                                                                     "No." = FIELD ("Employee No."),
                                                                     "Alternative Address Code" = FIELD (Code)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

