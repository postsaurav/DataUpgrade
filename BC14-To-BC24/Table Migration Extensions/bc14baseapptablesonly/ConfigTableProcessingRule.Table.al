table 8631 "Config. Table Processing Rule"
{
    Caption = 'Config. Table Processing Rule';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(3; "Rule No."; Integer)
        {
            Caption = 'Rule No.';
        }
        field(4; "Action"; Option)
        {
            Caption = 'Action';
            OptionCaption = ',Custom,Post,Invoice,Ship,Receive';
            OptionMembers = ,Custom,Post,Invoice,Ship,Receive;
        }
        field(5; "Custom Processing Codeunit ID"; Integer)
        {
            Caption = 'Custom Processing Codeunit ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Rule No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

