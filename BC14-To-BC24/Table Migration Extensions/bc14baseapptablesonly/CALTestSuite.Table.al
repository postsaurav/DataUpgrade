table 130400 "CAL Test Suite"
{
    Caption = 'CAL Test Suite';
    DataCaptionFields = Name, Description;
    ReplicateData = false;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Tests to Execute"; Integer)
        {
            CalcFormula = Count ("CAL Test Line" WHERE ("Test Suite" = FIELD (Name),
                                                       "Line Type" = CONST (Function),
                                                       Run = CONST (true)));
            Caption = 'Tests to Execute';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Tests not Executed"; Integer)
        {
            CalcFormula = Count ("CAL Test Line" WHERE ("Test Suite" = FIELD (Name),
                                                       "Line Type" = CONST (Function),
                                                       Run = CONST (true),
                                                       Result = CONST (" ")));
            Caption = 'Tests not Executed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Failures; Integer)
        {
            CalcFormula = Count ("CAL Test Line" WHERE ("Test Suite" = FIELD (Name),
                                                       "Line Type" = CONST (Function),
                                                       Run = CONST (true),
                                                       Result = CONST (Failure)));
            Caption = 'Failures';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Last Run"; DateTime)
        {
            Caption = 'Last Run';
            Editable = false;
        }
        field(8; Export; Boolean)
        {
            Caption = 'Export';
        }
        field(21; Attachment; BLOB)
        {
            Caption = 'Attachment';
        }
        field(23; "Update Test Coverage Map"; Boolean)
        {
            Caption = 'Update Test Coverage Map';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

