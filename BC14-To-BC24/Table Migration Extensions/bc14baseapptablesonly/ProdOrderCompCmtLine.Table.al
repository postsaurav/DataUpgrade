table 5416 "Prod. Order Comp. Cmt Line"
{
    Caption = 'Prod. Order Comp. Cmt Line';

    fields
    {
        field(2; "Prod. Order BOM Line No."; Integer)
        {
            Caption = 'Prod. Order BOM Line No.';
            NotBlank = true;
            TableRelation = "Prod. Order Component"."Line No." WHERE (Status = FIELD (Status),
                                                                      "Prod. Order No." = FIELD ("Prod. Order No."),
                                                                      "Prod. Order Line No." = FIELD ("Prod. Order Line No."));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(12; Comment; Text[80])
        {
            Caption = 'Comment';
        }
        field(13; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(22; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Simulated,Planned,Firm Planned,Released,Finished';
            OptionMembers = Simulated,Planned,"Firm Planned",Released,Finished;
        }
        field(23; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            NotBlank = true;
            TableRelation = "Production Order"."No." WHERE (Status = FIELD (Status));
        }
        field(24; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            NotBlank = true;
            TableRelation = "Prod. Order Line"."Line No." WHERE (Status = FIELD (Status),
                                                                 "Prod. Order No." = FIELD ("Prod. Order No."));
        }
    }

    keys
    {
        key(Key1; Status, "Prod. Order No.", "Prod. Order Line No.", "Prod. Order BOM Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

