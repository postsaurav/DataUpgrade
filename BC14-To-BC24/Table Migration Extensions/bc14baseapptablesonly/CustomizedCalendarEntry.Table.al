table 7603 "Customized Calendar Entry"
{
    Caption = 'Customized Calendar Entry';

    fields
    {
        field(1; "Source Type"; Option)
        {
            Caption = 'Source Type';
            Editable = false;
            OptionCaption = 'Company,Customer,Vendor,Location,Shipping Agent,Service';
            OptionMembers = Company,Customer,Vendor,Location,"Shipping Agent",Service;
        }
        field(2; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            Editable = false;
        }
        field(3; "Additional Source Code"; Code[20])
        {
            Caption = 'Additional Source Code';
        }
        field(4; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            Editable = false;
            TableRelation = "Base Calendar";
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
            Editable = false;
        }
        field(6; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(7; Nonworking; Boolean)
        {
            Caption = 'Nonworking';
            Editable = true;
        }
    }

    keys
    {
        key(Key1; "Source Type", "Source Code", "Additional Source Code", "Base Calendar Code", Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

