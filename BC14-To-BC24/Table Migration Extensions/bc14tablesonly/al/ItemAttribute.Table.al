table 7500 "Item Attribute"
{
    Caption = 'Item Attribute';
    DataCaptionFields = Name;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            NotBlank = true;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; Type; Option)
        {
            Caption = 'Type';
            InitValue = Text;
            OptionCaption = 'Option,Text,Integer,Decimal,Date';
            OptionMembers = Option,Text,"Integer",Decimal,Date;
        }
        field(8; "Unit of Measure"; Text[30])
        {
            Caption = 'Unit of Measure';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; Name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name)
        {
        }
        fieldgroup(Brick; ID, Name)
        {
        }
    }
}

