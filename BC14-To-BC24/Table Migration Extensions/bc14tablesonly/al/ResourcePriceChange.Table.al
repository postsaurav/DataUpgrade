table 335 "Resource Price Change"
{
    Caption = 'Resource Price Change';

    fields
    {
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Resource,Group(Resource),All';
            OptionMembers = Resource,"Group(Resource)",All;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST ("Group(Resource)")) "Resource Group";
        }
        field(4; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(5; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(6; "Current Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Current Unit Price';
        }
        field(7; "New Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Unit Price';
        }
    }

    keys
    {
        key(Key1; Type, "Code", "Work Type Code", "Currency Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

