table 5414 "Prod. Order Comment Line"
{
    Caption = 'Prod. Order Comment Line';

    fields
    {
        field(1; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(2; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            NotBlank = true;
            TableRelation = "Production Order"."No." WHERE (Status = FIELD (Status));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; Status, "Prod. Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

