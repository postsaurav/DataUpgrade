table 9701 "Cue Setup"
{
    Caption = 'Cue Setup';

    fields
    {
        field(1; "User Name"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table),
                                                                 "Object Name" = FILTER ('*Cue'));
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Cue ID';
            TableRelation = Field."No.";
        }
        field(4; "Field Name"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table ID"),
                                                              "No." = FIELD ("Field No.")));
            Caption = 'Cue Name';
            FieldClass = FlowField;
        }
        field(5; "Low Range Style"; Option)
        {
            Caption = 'Low Range Style', Comment = 'The Style to use if the cue''s value is below Threshold 1';
            OptionCaption = 'None,,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate';
            OptionMembers = "None",,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate;
        }
        field(6; "Threshold 1"; Decimal)
        {
            Caption = 'Threshold 1';
        }
        field(7; "Middle Range Style"; Option)
        {
            Caption = 'Middle Range Style', Comment = 'The Style to use if the cue''s value is between Threshold 1 and Threshold 2';
            OptionCaption = 'None,,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate';
            OptionMembers = "None",,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate;
        }
        field(8; "Threshold 2"; Decimal)
        {
            Caption = 'Threshold 2';
        }
        field(9; "High Range Style"; Option)
        {
            Caption = 'High Range Style', Comment = 'The Style to use if the cue''s value is above Threshold 2';
            OptionCaption = 'None,,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate';
            OptionMembers = "None",,,,,,,Favorable,Unfavorable,Ambiguous,Subordinate;
        }
        field(10; "Table Name"; Text[249])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object ID" = FIELD ("Table ID"),
                                                                           "Object Type" = CONST (Table)));
            Caption = 'Table Name';
            FieldClass = FlowField;
        }
        field(11; Personalized; Boolean)
        {
            Caption = 'Personalized';
        }
    }

    keys
    {
        key(Key1; "User Name", "Table ID", "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Table Name", "Field Name", "Threshold 1", Personalized, "Threshold 2")
        {
        }
    }
}

