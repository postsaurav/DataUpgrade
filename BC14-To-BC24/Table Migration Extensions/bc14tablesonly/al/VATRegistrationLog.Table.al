table 249 "VAT Registration Log"
{
    Caption = 'VAT Registration Log';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
            NotBlank = true;
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'Customer,Vendor,Contact,Company Information';
            OptionMembers = Customer,Vendor,Contact,"Company Information";
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Account Type" = CONST (Vendor)) Vendor;
        }
        field(5; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            NotBlank = true;
            TableRelation = "Country/Region".Code;
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Not Verified,Valid,Invalid';
            OptionMembers = "Not Verified",Valid,Invalid;
        }
        field(11; "Verified Name"; Text[150])
        {
            Caption = 'Verified Name';
        }
        field(12; "Verified Address"; Text[150])
        {
            Caption = 'Verified Address';
        }
        field(13; "Verified Date"; DateTime)
        {
            Caption = 'Verified Date';
        }
        field(14; "Request Identifier"; Text[200])
        {
            Caption = 'Request Identifier';
        }
        field(15; "Verified Street"; Text[50])
        {
            Caption = 'Verified Street';
        }
        field(16; "Verified Postcode"; Text[20])
        {
            Caption = 'Verified Postcode';
        }
        field(17; "Verified City"; Text[30])
        {
            Caption = 'Verified City';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Country/Region Code", "VAT Registration No.", Status)
        {
        }
    }
}

