table 1521 "Workflow Response"
{
    Caption = 'Workflow Response';
    ReplicateData = false;

    fields
    {
        field(1; "Function Name"; Code[128])
        {
            Caption = 'Function Name';
            NotBlank = true;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; Description; Text[250])
        {
            Caption = 'Then';
        }
        field(4; "Response Option Group"; Code[20])
        {
            Caption = 'Response Option Group';
            InitValue = 'GROUP 0';
        }
        field(5; Independent; Boolean)
        {
            Caption = 'Independent';
        }
    }

    keys
    {
        key(Key1; "Function Name")
        {
            Clustered = true;
        }
        key(Key2; Independent, Description)
        {
        }
    }

    fieldgroups
    {
    }
}

