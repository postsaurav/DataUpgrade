table 5411 "Prod. Order Routing Tool"
{
    Caption = 'Prod. Order Routing Tool';

    fields
    {
        field(1; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            NotBlank = true;
            TableRelation = "Routing Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(21; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            TableRelation = "Prod. Order Routing Line"."Operation No." WHERE (Status = FIELD (Status),
                                                                              "Prod. Order No." = FIELD ("Prod. Order No."),
                                                                              "Routing No." = FIELD ("Routing No."));
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
        field(24; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
            TableRelation = "Prod. Order Routing Line"."Routing Reference No." WHERE ("Routing No." = FIELD ("Routing No."),
                                                                                      "Operation No." = FIELD ("Operation No."),
                                                                                      "Prod. Order No." = FIELD ("Prod. Order No."),
                                                                                      Status = FIELD (Status));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(Key1; Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

