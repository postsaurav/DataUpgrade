table 1515 "Dynamic Request Page Entity"
{
    Caption = 'Dynamic Request Page Entity';

    fields
    {
        field(1; Name; Code[20])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = "Table Metadata".ID;
        }
        field(4; "Table Name"; Text[30])
        {
            CalcFormula = Lookup ("Table Metadata".Name WHERE (ID = FIELD ("Table ID")));
            Caption = 'Table Name';
            FieldClass = FlowField;
        }
        field(5; "Table Caption"; Text[80])
        {
            CalcFormula = Lookup ("Table Metadata".Caption WHERE (ID = FIELD ("Table ID")));
            Caption = 'Table Caption';
            FieldClass = FlowField;
        }
        field(6; "Related Table ID"; Integer)
        {
            Caption = 'Related Table ID';
            TableRelation = "Table Metadata".ID;
        }
        field(7; "Related Table Name"; Text[30])
        {
            CalcFormula = Lookup ("Table Metadata".Name WHERE (ID = FIELD ("Related Table ID")));
            Caption = 'Related Table Name';
            FieldClass = FlowField;
        }
        field(8; "Related Table Caption"; Text[80])
        {
            CalcFormula = Lookup ("Table Metadata".Caption WHERE (ID = FIELD ("Related Table ID")));
            Caption = 'Related Table Caption';
            FieldClass = FlowField;
        }
        field(9; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
            MinValue = 1;
        }
    }

    keys
    {
        key(Key1; Name, "Table ID", "Sequence No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

