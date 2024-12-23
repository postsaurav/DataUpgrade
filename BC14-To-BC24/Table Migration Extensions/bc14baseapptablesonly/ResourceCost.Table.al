table 202 "Resource Cost"
{
    Caption = 'Resource Cost';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Resource,Group(Resource),All';
            OptionMembers = Resource,"Group(Resource)",All;
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST ("Group(Resource)")) "Resource Group";
        }
        field(3; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(4; "Cost Type"; Option)
        {
            Caption = 'Cost Type';
            OptionCaption = 'Fixed,% Extra,LCY Extra';
            OptionMembers = "Fixed","% Extra","LCY Extra";
        }
        field(5; "Direct Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
        }
        field(6; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
    }

    keys
    {
        key(Key1; Type, "Code", "Work Type Code")
        {
            Clustered = true;
        }
        key(Key2; "Cost Type", "Code", "Work Type Code")
        {
        }
    }

    fieldgroups
    {
    }
}

