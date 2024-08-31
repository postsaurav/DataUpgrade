table 5075 "Logged Segment"
{
    Caption = 'Logged Segment';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "No. of Interactions"; Integer)
        {
            CalcFormula = Count ("Interaction Log Entry" WHERE ("Logged Segment Entry No." = FIELD ("Entry No."),
                                                               Canceled = FIELD (Canceled)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "No. of Campaign Entries"; Integer)
        {
            CalcFormula = Count ("Campaign Entry" WHERE ("Register No." = FIELD ("Entry No."),
                                                        Canceled = FIELD (Canceled)));
            Caption = 'No. of Campaign Entries';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(8; Canceled; Boolean)
        {
            Caption = 'Canceled';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Segment No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "Segment No.", "Creation Date")
        {
        }
    }
}

