table 1520 "Workflow Event"
{
    Caption = 'Workflow Event';
    Permissions = TableData "Workflow Step Argument" = rm;
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
            Caption = 'When';
        }
        field(4; "Request Page ID"; Integer)
        {
            Caption = 'Request Page ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(5; "Dynamic Req. Page Entity Name"; Code[20])
        {
            Caption = 'Dynamic Req. Page Entity Name';
            TableRelation = "Dynamic Request Page Entity".Name WHERE ("Table ID" = FIELD ("Table ID"));
        }
        field(6; "Used for Record Change"; Boolean)
        {
            Caption = 'Used for Record Change';
        }
        field(7; Independent; Boolean)
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

