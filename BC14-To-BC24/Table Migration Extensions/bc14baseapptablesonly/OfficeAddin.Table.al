table 1610 "Office Add-in"
{
    Caption = 'Office Add-in';
    DataPerCompany = false;

    fields
    {
        field(1; "Application ID"; Guid)
        {
            Caption = 'Application ID';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(5; Version; Text[20])
        {
            Caption = 'Version';
        }
        field(6; "Manifest Codeunit"; Integer)
        {
            Caption = 'Manifest Codeunit';
        }
        field(10; "Deployment Date"; Date)
        {
            Caption = 'Deployment Date';
        }
        field(12; "Default Manifest"; BLOB)
        {
            Caption = 'Default Manifest';
        }
        field(13; Manifest; BLOB)
        {
            Caption = 'Manifest';
        }
        field(14; Breaking; Boolean)
        {
            Caption = 'Breaking';
        }
    }

    keys
    {
        key(Key1; "Application ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

