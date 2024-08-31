table 99000775 "Routing Comment Line"
{
    Caption = 'Routing Comment Line';

    fields
    {
        field(1; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            NotBlank = true;
            TableRelation = "Routing Header";
        }
        field(2; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            NotBlank = true;
            TableRelation = "Routing Line"."Operation No." WHERE ("Routing No." = FIELD ("Routing No."),
                                                                  "Version Code" = FIELD ("Version Code"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
            TableRelation = "Routing Version"."Version Code" WHERE ("Routing No." = FIELD ("Routing No."));
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
    }

    keys
    {
        key(Key1; "Routing No.", "Version Code", "Operation No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

