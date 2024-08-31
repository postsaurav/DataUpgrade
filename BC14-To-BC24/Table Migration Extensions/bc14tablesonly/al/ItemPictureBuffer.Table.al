table 31 "Item Picture Buffer"
{
    Caption = 'Item Picture Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "File Name"; Text[260])
        {
            Caption = 'File Name';
        }
        field(2; Picture; Media)
        {
            Caption = 'Picture';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; "Item Description"; Text[100])
        {
            CalcFormula = Lookup (Item.Description WHERE ("No." = FIELD ("Item No.")));
            Caption = 'Item Description';
            FieldClass = FlowField;
        }
        field(5; "Import Status"; Option)
        {
            Caption = 'Import Status';
            Editable = false;
            OptionCaption = 'Skip,Pending,Completed';
            OptionMembers = Skip,Pending,Completed;
        }
        field(6; "Picture Already Exists"; Boolean)
        {
            Caption = 'Picture Already Exists';
        }
        field(7; "File Size (KB)"; BigInteger)
        {
            Caption = 'File Size (KB)';
        }
        field(8; "File Extension"; Text[30])
        {
            Caption = 'File Extension';
        }
        field(9; "Modified Date"; Date)
        {
            Caption = 'Modified Date';
        }
        field(10; "Modified Time"; Time)
        {
            Caption = 'Modified Time';
        }
    }

    keys
    {
        key(Key1; "File Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "File Name", "Item No.", "Item Description", Picture)
        {
        }
    }
}

