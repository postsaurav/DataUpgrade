table 9610 "XML Schema Element"
{
    Caption = 'XML Schema Element';

    fields
    {
        field(1; "XML Schema Code"; Code[20])
        {
            Caption = 'XML Schema Code';
            TableRelation = "XML Schema";
        }
        field(2; ID; Integer)
        {
            Caption = 'ID';
        }
        field(3; "Parent ID"; Integer)
        {
            Caption = 'Parent ID';
        }
        field(4; "Node Name"; Text[250])
        {
            Caption = 'Node Name';
        }
        field(5; "Node Type"; Option)
        {
            Caption = 'Node Type';
            OptionCaption = 'Element,Attribute,Definition Node';
            OptionMembers = Element,Attribute,"Definition Node";
        }
        field(6; "Data Type"; Text[250])
        {
            Caption = 'Data Type';
        }
        field(7; MinOccurs; Integer)
        {
            Caption = 'MinOccurs';
        }
        field(8; MaxOccurs; Integer)
        {
            Caption = 'MaxOccurs';
        }
        field(9; Choice; Boolean)
        {
            Caption = 'Choice';
        }
        field(20; "Sort Key"; Text[200])
        {
            Caption = 'Sort Key';
        }
        field(21; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
        field(22; Visible; Boolean)
        {
            Caption = 'Visible';
            InitValue = true;
        }
        field(23; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(24; "Simple Data Type"; Text[50])
        {
            Caption = 'Simple Data Type';
            Editable = false;
        }
        field(25; "Defintion XML Schema Code"; Code[20])
        {
            Caption = 'Defintion XML Schema Code';
        }
        field(26; "Definition XML Schema ID"; Integer)
        {
            Caption = 'Definition XML Schema ID';
        }
    }

    keys
    {
        key(Key1; "XML Schema Code", ID)
        {
            Clustered = true;
        }
        key(Key2; "Parent ID", "XML Schema Code")
        {
        }
        key(Key3; "XML Schema Code", "Sort Key")
        {
        }
        key(Key4; "Node Name", "XML Schema Code")
        {
        }
        key(Key5; "Data Type", "XML Schema Code")
        {
        }
    }

    fieldgroups
    {
    }
}

