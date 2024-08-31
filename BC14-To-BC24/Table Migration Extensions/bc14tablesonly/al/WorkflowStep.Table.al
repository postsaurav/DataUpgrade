table 1502 "Workflow Step"
{
    Caption = 'Workflow Step';
    Permissions = TableData "Workflow Step Instance" = rimd,
                  TableData "Workflow Step Argument" = ri,
                  TableData "Workflow Rule" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Workflow Code"; Code[20])
        {
            Caption = 'Workflow Code';
            NotBlank = true;
            TableRelation = Workflow;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; "Entry Point"; Boolean)
        {
            Caption = 'Entry Point';
        }
        field(11; "Previous Workflow Step ID"; Integer)
        {
            Caption = 'Previous Workflow Step ID';
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"));
        }
        field(12; "Next Workflow Step ID"; Integer)
        {
            Caption = 'Next Workflow Step ID';
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"));
        }
        field(13; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Event,Response,Sub-Workflow';
            OptionMembers = "Event",Response,"Sub-Workflow";
        }
        field(14; "Function Name"; Code[128])
        {
            Caption = 'Function Name';
            TableRelation = IF (Type = CONST (Event)) "Workflow Event"
            ELSE
            IF (Type = CONST (Response)) "Workflow Response"
            ELSE
            IF (Type = CONST ("Sub-Workflow")) Workflow;
        }
        field(15; Argument; Guid)
        {
            Caption = 'Argument';
            TableRelation = "Workflow Step Argument" WHERE (Type = FIELD (Type));
        }
        field(16; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
            InitValue = 1;
        }
    }

    keys
    {
        key(Key1; "Workflow Code", ID)
        {
            Clustered = true;
        }
        key(Key2; "Sequence No.")
        {
        }
        key(Key3; "Function Name", Type)
        {
        }
        key(Key4; "Entry Point", "Previous Workflow Step ID")
        {
        }
    }

    fieldgroups
    {
    }
}

