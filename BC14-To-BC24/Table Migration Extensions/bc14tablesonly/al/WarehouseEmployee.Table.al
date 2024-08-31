table 7301 "Warehouse Employee"
{
    Caption = 'Warehouse Employee';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(4; Default; Boolean)
        {
            Caption = 'Default';
        }
        field(7710; "ADCS User"; Code[50])
        {
            Caption = 'ADCS User';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "ADCS User".Name;
        }
    }

    keys
    {
        key(Key1; "User ID", "Location Code")
        {
            Clustered = true;
        }
        key(Key2; Default)
        {
        }
        key(Key3; "Location Code")
        {
        }
    }

    fieldgroups
    {
    }
}

