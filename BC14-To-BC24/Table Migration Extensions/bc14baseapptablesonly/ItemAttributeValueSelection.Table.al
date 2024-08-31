table 7504 "Item Attribute Value Selection"
{
    Caption = 'Item Attribute Value Selection';

    fields
    {
        field(1; "Attribute Name"; Text[250])
        {
            Caption = 'Attribute Name';
            NotBlank = true;
        }
        field(2; Value; Text[250])
        {
            Caption = 'Value';
        }
        field(3; "Attribute ID"; Integer)
        {
            Caption = 'Attribute ID';
        }
        field(4; "Unit of Measure"; Text[30])
        {
            Caption = 'Unit of Measure';
            Editable = false;
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; "Attribute Type"; Option)
        {
            Caption = 'Attribute Type';
            OptionCaption = 'Option,Text,Integer,Decimal,Date';
            OptionMembers = Option,Text,"Integer",Decimal,Date;
        }
        field(8; "Inherited-From Table ID"; Integer)
        {
            Caption = 'Inherited-From Table ID';
        }
        field(9; "Inherited-From Key Value"; Code[20])
        {
            Caption = 'Inherited-From Key Value';
        }
        field(10; "Inheritance Level"; Integer)
        {
            Caption = 'Inheritance Level';
        }
    }

    keys
    {
        key(Key1; "Attribute Name")
        {
            Clustered = true;
        }
        key(Key2; "Inheritance Level", "Attribute Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Attribute ID")
        {
        }
        fieldgroup(Brick; "Attribute Name", Value, "Unit of Measure")
        {
        }
    }
}

