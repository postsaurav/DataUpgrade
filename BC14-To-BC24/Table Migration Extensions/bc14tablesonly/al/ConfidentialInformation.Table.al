table 5216 "Confidential Information"
{
    Caption = 'Confidential Information';
    DataCaptionFields = "Employee No.";

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = Employee;
        }
        field(2; "Confidential Code"; Code[10])
        {
            Caption = 'Confidential Code';
            NotBlank = true;
            TableRelation = Confidential;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            NotBlank = true;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Comment; Boolean)
        {
            CalcFormula = Exist ("HR Confidential Comment Line" WHERE ("Table Name" = CONST ("Confidential Information"),
                                                                      "No." = FIELD ("Employee No."),
                                                                      "Table Line No." = FIELD ("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Confidential Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

