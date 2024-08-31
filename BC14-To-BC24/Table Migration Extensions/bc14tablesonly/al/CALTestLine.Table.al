table 130401 "CAL Test Line"
{
    Caption = 'CAL Test Line';
    ReplicateData = false;

    fields
    {
        field(1; "Test Suite"; Code[10])
        {
            Caption = 'Test Suite';
            TableRelation = "CAL Test Suite".Name;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; "Line Type"; Option)
        {
            Caption = 'Line Type';
            Editable = false;
            InitValue = "Codeunit";
            OptionCaption = 'Group,Codeunit,Function';
            OptionMembers = Group,"Codeunit","Function";
        }
        field(4; "Test Codeunit"; Integer)
        {
            Caption = 'Test Codeunit';
            Editable = false;
            TableRelation = IF ("Line Type" = CONST (Codeunit)) AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit),
                                                                                                  "Object Subtype" = CONST ('Test'));
        }
        field(5; Name; Text[128])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(6; "Function"; Text[128])
        {
            Caption = 'Function';
            Editable = false;
        }
        field(7; Run; Boolean)
        {
            Caption = 'Run';
        }
        field(8; Result; Option)
        {
            Caption = 'Result';
            Editable = false;
            OptionCaption = ' ,Failure,Success,Skipped';
            OptionMembers = " ",Failure,Success,Skipped;
        }
        field(9; "First Error"; Text[250])
        {
            Caption = 'First Error';
            Editable = false;
        }
        field(10; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            Editable = false;
        }
        field(11; "Finish Time"; DateTime)
        {
            Caption = 'Finish Time';
            Editable = false;
        }
        field(12; Level; Integer)
        {
            Caption = 'Level';
            Editable = false;
        }
        field(13; "Hit Objects"; Integer)
        {
            CalcFormula = Count ("CAL Test Coverage Map" WHERE ("Test Codeunit ID" = FIELD ("Test Codeunit")));
            Caption = 'Hit Objects';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Test Suite", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Test Suite", Result, "Line Type", Run)
        {
        }
    }

    fieldgroups
    {
    }
}

