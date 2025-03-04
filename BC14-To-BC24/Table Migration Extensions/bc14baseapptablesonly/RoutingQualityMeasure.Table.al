table 99000805 "Routing Quality Measure"
{
    Caption = 'Routing Quality Measure';

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
        field(9; "Qlty Measure Code"; Code[10])
        {
            Caption = 'Qlty Measure Code';
            TableRelation = "Quality Measure";
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Min. Value"; Decimal)
        {
            Caption = 'Min. Value';
            DecimalPlaces = 0 : 5;
        }
        field(12; "Max. Value"; Decimal)
        {
            Caption = 'Max. Value';
            DecimalPlaces = 0 : 5;
        }
        field(13; "Mean Tolerance"; Decimal)
        {
            Caption = 'Mean Tolerance';
            DecimalPlaces = 0 : 5;
        }
        field(20; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
            TableRelation = "Routing Version"."Version Code" WHERE ("Routing No." = FIELD ("Routing No."));
        }
        field(21; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            NotBlank = true;
            TableRelation = "Routing Line"."Operation No." WHERE ("Routing No." = FIELD ("Routing No."),
                                                                  "Version Code" = FIELD ("Version Code"));
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

