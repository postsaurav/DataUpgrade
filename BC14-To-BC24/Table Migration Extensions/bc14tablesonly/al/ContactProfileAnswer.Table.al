table 5089 "Contact Profile Answer"
{
    Caption = 'Contact Profile Answer';

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            NotBlank = true;
            TableRelation = Contact;
        }
        field(2; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            NotBlank = true;
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(3; "Profile Questionnaire Code"; Code[20])
        {
            Caption = 'Profile Questionnaire Code';
            NotBlank = true;
            TableRelation = "Profile Questionnaire Header";
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            TableRelation = "Profile Questionnaire Line"."Line No." WHERE ("Profile Questionnaire Code" = FIELD ("Profile Questionnaire Code"),
                                                                           Type = CONST (Answer));
        }
        field(5; Answer; Text[250])
        {
            CalcFormula = Lookup ("Profile Questionnaire Line".Description WHERE ("Profile Questionnaire Code" = FIELD ("Profile Questionnaire Code"),
                                                                                 "Line No." = FIELD ("Line No.")));
            Caption = 'Answer';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact."Company Name" WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Profile Questionnaire Priority"; Option)
        {
            Caption = 'Profile Questionnaire Priority';
            Editable = false;
            OptionCaption = 'Very Low,Low,Normal,High,Very High';
            OptionMembers = "Very Low",Low,Normal,High,"Very High";
        }
        field(9; "Answer Priority"; Option)
        {
            Caption = 'Answer Priority';
            OptionCaption = 'Very Low (Hidden),Low,Normal,High,Very High';
            OptionMembers = "Very Low (Hidden)",Low,Normal,High,"Very High";
        }
        field(10; "Last Date Updated"; Date)
        {
            Caption = 'Last Date Updated';
        }
        field(11; "Questions Answered (%)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Questions Answered (%)';
            DecimalPlaces = 0 : 0;
        }
        field(5088; "Profile Questionnaire Value"; Text[250])
        {
            Caption = 'Profile Questionnaire Value';
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Profile Questionnaire Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Contact No.", "Answer Priority", "Profile Questionnaire Priority")
        {
        }
        key(Key3; "Profile Questionnaire Code", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

