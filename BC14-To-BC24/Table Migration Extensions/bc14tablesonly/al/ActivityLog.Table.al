table 710 "Activity Log"
{
    Caption = 'Activity Log';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(3; "Activity Date"; DateTime)
        {
            Caption = 'Activity Date';
        }
        field(4; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Success,Failed';
            OptionMembers = Success,Failed;
        }
        field(6; Context; Text[30])
        {
            Caption = 'Context';
        }
        field(10; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(20; "Activity Message"; Text[250])
        {
            Caption = 'Activity Message';
        }
        field(21; "Detailed Info"; BLOB)
        {
            Caption = 'Detailed Info';
        }
        field(22; "Table No Filter"; Integer)
        {
            Caption = 'Table No Filter';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Activity Date")
        {
        }
        key(Key3; "Record ID")
        {
        }
    }

    fieldgroups
    {
    }
}

