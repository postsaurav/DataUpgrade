table 7152 "Item Analysis View"
{
    Caption = 'Item Analysis View';
    DataCaptionFields = "Analysis Area", "Code", Name;
    Permissions = TableData "Item Analysis View Entry" = rimd,
                  TableData "Item Analysis View Budg. Entry" = rimd;

    fields
    {
        field(1; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; "Last Entry No."; Integer)
        {
            Caption = 'Last Entry No.';
            Editable = false;
        }
        field(5; "Last Budget Entry No."; Integer)
        {
            Caption = 'Last Budget Entry No.';
            Editable = false;
        }
        field(6; "Last Date Updated"; Date)
        {
            Caption = 'Last Date Updated';
            Editable = false;
        }
        field(7; "Update on Posting"; Boolean)
        {
            Caption = 'Update on Posting';
            Editable = false;
        }
        field(8; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(9; "Item Filter"; Code[250])
        {
            Caption = 'Item Filter';
            TableRelation = Item;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Location Filter"; Code[250])
        {
            Caption = 'Location Filter';
            TableRelation = Location;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(11; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(12; "Date Compression"; Option)
        {
            Caption = 'Date Compression';
            InitValue = Day;
            OptionCaption = 'None,Day,Week,Month,Quarter,Year,Period';
            OptionMembers = "None",Day,Week,Month,Quarter,Year,Period;
        }
        field(13; "Dimension 1 Code"; Code[20])
        {
            Caption = 'Dimension 1 Code';
            TableRelation = Dimension;
        }
        field(14; "Dimension 2 Code"; Code[20])
        {
            Caption = 'Dimension 2 Code';
            TableRelation = Dimension;
        }
        field(15; "Dimension 3 Code"; Code[20])
        {
            Caption = 'Dimension 3 Code';
            TableRelation = Dimension;
        }
        field(17; "Include Budgets"; Boolean)
        {
            AccessByPermission = TableData "Item Budget Name" = R;
            Caption = 'Include Budgets';
        }
        field(18; "Refresh When Unblocked"; Boolean)
        {
            Caption = 'Refresh When Unblocked';
        }
    }

    keys
    {
        key(Key1; "Analysis Area", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

