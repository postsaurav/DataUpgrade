table 5111 Rating
{
    Caption = 'Rating';

    fields
    {
        field(1; "Profile Questionnaire Code"; Code[20])
        {
            Caption = 'Profile Questionnaire Code';
            NotBlank = true;
            TableRelation = "Profile Questionnaire Header";
        }
        field(2; "Profile Questionnaire Line No."; Integer)
        {
            Caption = 'Profile Questionnaire Line No.';
            NotBlank = true;
            TableRelation = "Profile Questionnaire Line"."Line No." WHERE ("Profile Questionnaire Code" = FIELD ("Profile Questionnaire Code"),
                                                                           Type = CONST (Question),
                                                                           "Contact Class. Field" = CONST (Rating));
        }
        field(3; "Rating Profile Quest. Code"; Code[20])
        {
            Caption = 'Rating Profile Quest. Code';
            NotBlank = true;
            TableRelation = "Profile Questionnaire Header";
        }
        field(4; "Rating Profile Quest. Line No."; Integer)
        {
            Caption = 'Rating Profile Quest. Line No.';
            NotBlank = true;
            TableRelation = "Profile Questionnaire Line"."Line No." WHERE ("Profile Questionnaire Code" = FIELD ("Rating Profile Quest. Code"),
                                                                           Type = CONST (Answer));
        }
        field(5; Points; Decimal)
        {
            BlankZero = true;
            Caption = 'Points';
            DecimalPlaces = 0 : 0;
        }
        field(6; "Profile Question Description"; Text[100])
        {
            CalcFormula = Lookup ("Profile Questionnaire Line".Description WHERE ("Profile Questionnaire Code" = FIELD ("Profile Questionnaire Code"),
                                                                                 "Line No." = FIELD ("Profile Questionnaire Line No.")));
            Caption = 'Profile Question Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Profile Questionnaire Code", "Profile Questionnaire Line No.", "Rating Profile Quest. Code", "Rating Profile Quest. Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Rating Profile Quest. Code", "Rating Profile Quest. Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

