table 1504 "Workflow Step Instance"
{
    Caption = 'Workflow Step Instance';
    Permissions = TableData "Workflow Step Instance" = rd,
                  TableData "Workflow - Table Relation" = r,
                  TableData "Workflow Table Relation Value" = rimd,
                  TableData "Workflow Rule" = rd,
                  TableData "Workflow Step Instance Archive" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; "Workflow Code"; Code[20])
        {
            Caption = 'Workflow Code';
            TableRelation = "Workflow Step"."Workflow Code";
        }
        field(3; "Workflow Step ID"; Integer)
        {
            Caption = 'Workflow Step ID';
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Workflow Code"));
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; "Entry Point"; Boolean)
        {
            Caption = 'Entry Point';
        }
        field(11; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(12; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
            Editable = false;
        }
        field(13; "Created By User ID"; Code[50])
        {
            Caption = 'Created By User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(14; "Last Modified Date-Time"; DateTime)
        {
            Caption = 'Last Modified Date-Time';
            Editable = false;
        }
        field(15; "Last Modified By User ID"; Code[50])
        {
            Caption = 'Last Modified By User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(17; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Inactive,Active,Completed,Ignored,Processing';
            OptionMembers = Inactive,Active,Completed,Ignored,Processing;
        }
        field(18; "Previous Workflow Step ID"; Integer)
        {
            Caption = 'Previous Workflow Step ID';
        }
        field(19; "Next Workflow Step ID"; Integer)
        {
            Caption = 'Next Workflow Step ID';
        }
        field(21; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Event,Response';
            OptionMembers = "Event",Response;
        }
        field(22; "Function Name"; Code[128])
        {
            Caption = 'Function Name';
            TableRelation = IF (Type = CONST (Event)) "Workflow Event"
            ELSE
            IF (Type = CONST (Response)) "Workflow Response";
        }
        field(23; Argument; Guid)
        {
            Caption = 'Argument';
            TableRelation = "Workflow Step Argument" WHERE (Type = FIELD (Type));
        }
        field(30; "Original Workflow Code"; Code[20])
        {
            Caption = 'Original Workflow Code';
            TableRelation = "Workflow Step"."Workflow Code";
        }
        field(31; "Original Workflow Step ID"; Integer)
        {
            Caption = 'Original Workflow Step ID';
            TableRelation = "Workflow Step".ID WHERE ("Workflow Code" = FIELD ("Original Workflow Code"));
        }
        field(32; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
        }
    }

    keys
    {
        key(Key1; ID, "Workflow Code", "Workflow Step ID")
        {
            Clustered = true;
        }
        key(Key2; "Sequence No.")
        {
        }
        key(Key3; "Workflow Code", ID, "Workflow Step ID")
        {
        }
        key(Key4; "Function Name")
        {
        }
    }

    fieldgroups
    {
    }
}

