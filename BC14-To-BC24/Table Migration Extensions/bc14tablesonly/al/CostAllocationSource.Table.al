table 1106 "Cost Allocation Source"
{
    Caption = 'Cost Allocation Source';

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
        }
        field(2; Level; Integer)
        {
            Caption = 'Level';
            InitValue = 1;
            MaxValue = 99;
            MinValue = 1;
        }
        field(3; "Valid From"; Date)
        {
            Caption = 'Valid From';
        }
        field(4; "Valid To"; Date)
        {
            Caption = 'Valid To';
        }
        field(5; "Cost Type Range"; Code[30])
        {
            Caption = 'Cost Type Range';
            TableRelation = "Cost Type";
            ValidateTableRelation = false;
        }
        field(6; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(7; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(8; Variant; Code[10])
        {
            Caption = 'Variant';
        }
        field(10; "Credit to Cost Type"; Code[20])
        {
            Caption = 'Credit to Cost Type';
            TableRelation = "Cost Type";
        }
        field(20; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(22; "Total Share"; Decimal)
        {
            CalcFormula = Sum ("Cost Allocation Target".Share WHERE (ID = FIELD (ID)));
            Caption = 'Total Share';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(60; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(61; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(100; "Allocation Source Type"; Option)
        {
            Caption = 'Allocation Source Type';
            OptionCaption = 'Both,Actual,Budget';
            OptionMembers = Both,Actual,Budget;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; Level, "Valid From", "Valid To", "Cost Type Range")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; ID, Level, Variant)
        {
        }
    }
}

