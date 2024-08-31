table 130405 "CAL Test Result"
{
    Caption = 'CAL Test Result';
    ReplicateData = false;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(2; "Test Run No."; Integer)
        {
            Caption = 'Test Run No.';
        }
        field(3; "Codeunit ID"; Integer)
        {
            Caption = 'Codeunit ID';
        }
        field(4; "Codeunit Name"; Text[30])
        {
            Caption = 'Codeunit Name';
        }
        field(5; "Function Name"; Text[128])
        {
            Caption = 'Function Name';
        }
        field(6; Platform; Option)
        {
            Caption = 'Platform';
            OptionCaption = 'Classic,ServiceTier';
            OptionMembers = Classic,ServiceTier;
        }
        field(7; Result; Option)
        {
            Caption = 'Result';
            InitValue = Incomplete;
            OptionCaption = 'Passed,Failed,Inconclusive,Incomplete';
            OptionMembers = Passed,Failed,Inconclusive,Incomplete;
        }
        field(8; Restore; Boolean)
        {
            Caption = 'Restore';
        }
        field(9; "Execution Time"; Duration)
        {
            Caption = 'Execution Time';
        }
        field(10; "Error Code"; Text[250])
        {
            Caption = 'Error Code';
        }
        field(11; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }
        field(12; File; Text[250])
        {
            Caption = 'File';
        }
        field(14; "Call Stack"; BLOB)
        {
            Caption = 'Call Stack';
            Compressed = false;
        }
        field(15; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(16; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            Editable = false;
        }
        field(17; "Finish Time"; DateTime)
        {
            Caption = 'Finish Time';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Test Run No.", "Codeunit ID", "Function Name", Platform)
        {
        }
    }

    fieldgroups
    {
    }
}

