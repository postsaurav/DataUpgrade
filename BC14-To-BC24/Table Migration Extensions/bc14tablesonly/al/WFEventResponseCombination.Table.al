table 1509 "WF Event/Response Combination"
{
    Caption = 'WF Event/Response Combination';
    ReplicateData = false;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Event,Response';
            OptionMembers = "Event",Response;
        }
        field(2; "Function Name"; Code[128])
        {
            Caption = 'Function Name';
            TableRelation = IF (Type = CONST (Event)) "Workflow Event"
            ELSE
            IF (Type = CONST (Response)) "Workflow Response";
        }
        field(3; "Predecessor Type"; Option)
        {
            Caption = 'Predecessor Type';
            OptionCaption = 'Event,Response';
            OptionMembers = "Event",Response;
        }
        field(4; "Predecessor Function Name"; Code[128])
        {
            Caption = 'Predecessor Function Name';
            TableRelation = IF ("Predecessor Type" = CONST (Event)) "Workflow Event"
            ELSE
            IF ("Predecessor Type" = CONST (Response)) "Workflow Response";
        }
    }

    keys
    {
        key(Key1; Type, "Function Name", "Predecessor Type", "Predecessor Function Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

