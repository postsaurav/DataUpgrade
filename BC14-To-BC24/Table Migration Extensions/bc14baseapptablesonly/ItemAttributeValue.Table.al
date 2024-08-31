table 7501 "Item Attribute Value"
{
    Caption = 'Item Attribute Value';
    DataCaptionFields = Value;

    fields
    {
        field(1; "Attribute ID"; Integer)
        {
            Caption = 'Attribute ID';
            NotBlank = true;
            TableRelation = "Item Attribute".ID WHERE (Blocked = CONST (false));
        }
        field(2; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(3; Value; Text[250])
        {
            Caption = 'Value';
        }
        field(4; "Numeric Value"; Decimal)
        {
            BlankZero = true;
            Caption = 'Numeric Value';
        }
        field(5; "Date Value"; Date)
        {
            Caption = 'Date Value';
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(10; "Attribute Name"; Text[250])
        {
            CalcFormula = Lookup ("Item Attribute".Name WHERE (ID = FIELD ("Attribute ID")));
            Caption = 'Attribute Name';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Attribute ID", ID)
        {
            Clustered = true;
        }
        key(Key2; Value)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Value)
        {
        }
        fieldgroup(Brick; "Attribute Name", Value)
        {
        }
    }
}

