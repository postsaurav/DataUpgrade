table 6700 "Exchange Sync"
{
    Caption = 'Exchange Sync';
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(3; "Exchange Service URI"; Text[250])
        {
            Caption = 'Exchange Service URI';
            DataClassification = SystemMetadata;
        }
        field(4; "Exchange Account Password Key"; Guid)
        {
            Caption = 'Exchange Account Password Key';
            TableRelation = "Service Password".Key;
        }
        field(5; "Last Sync Date Time"; DateTime)
        {
            Caption = 'Last Sync Date Time';
            Editable = false;
        }
        field(7; "Folder ID"; Text[30])
        {
            Caption = 'Folder ID';
        }
        field(9; "Filter"; BLOB)
        {
            Caption = 'Filter';
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

