table 7505 "Item Attribute Value Mapping"
{
    Caption = 'Item Attribute Value Mapping';

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Item Attribute ID"; Integer)
        {
            Caption = 'Item Attribute ID';
            TableRelation = "Item Attribute";
        }
        field(4; "Item Attribute Value ID"; Integer)
        {
            Caption = 'Item Attribute Value ID';
            TableRelation = "Item Attribute Value".ID;
        }
    }

    keys
    {
        key(Key1; "Table ID", "No.", "Item Attribute ID")
        {
            Clustered = true;
        }
        key(Key2; "Item Attribute ID", "Item Attribute Value ID")
        {
        }
    }

    fieldgroups
    {
    }
}

