table 140 "License Agreement"
{
    Caption = 'License Agreement';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Message for Accepting User"; Text[250])
        {
            Caption = 'Message for Accepting User';
        }
        field(3; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(4; "Effective Date Changed By"; Text[65])
        {
            Caption = 'Effective Date Changed By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(5; "Effective Date Changed On"; DateTime)
        {
            Caption = 'Effective Date Changed On';
            Editable = false;
        }
        field(6; Accepted; Boolean)
        {
            Caption = 'Accepted';
        }
        field(7; "Accepted By"; Text[65])
        {
            Caption = 'Accepted By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(8; "Accepted On"; DateTime)
        {
            Caption = 'Accepted On';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

