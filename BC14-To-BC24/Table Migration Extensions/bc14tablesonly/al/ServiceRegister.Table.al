table 5934 "Service Register"
{
    Caption = 'Service Register';

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "Service Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            TableRelation = "Service Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "From Warranty Entry No."; Integer)
        {
            Caption = 'From Warranty Entry No.';
            TableRelation = "Warranty Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5; "To Warranty Entry No."; Integer)
        {
            Caption = 'To Warranty Entry No.';
            TableRelation = "Warranty Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(7; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(9; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

