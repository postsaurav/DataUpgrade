table 339 "Item Application Entry"
{
    Caption = 'Item Application Entry';
    Permissions = TableData "Item Application Entry" = rm,
                  TableData "Item Application Entry History" = ri;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(3; "Inbound Item Entry No."; Integer)
        {
            Caption = 'Inbound Item Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(4; "Outbound Item Entry No."; Integer)
        {
            Caption = 'Outbound Item Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(23; "Transferred-from Entry No."; Integer)
        {
            Caption = 'Transferred-from Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(25; "Creation Date"; DateTime)
        {
            Caption = 'Creation Date';
        }
        field(26; "Created By User"; Code[50])
        {
            Caption = 'Created By User';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(27; "Last Modified Date"; DateTime)
        {
            Caption = 'Last Modified Date';
        }
        field(28; "Last Modified By User"; Code[50])
        {
            Caption = 'Last Modified By User';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5800; "Cost Application"; Boolean)
        {
            Caption = 'Cost Application';
        }
        field(5804; "Output Completely Invd. Date"; Date)
        {
            Caption = 'Output Completely Invd. Date';
        }
        field(5805; "Outbound Entry is Updated"; Boolean)
        {
            Caption = 'Outbound Entry is Updated';
            InitValue = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Inbound Item Entry No.", "Item Ledger Entry No.", "Outbound Item Entry No.", "Cost Application")
        {
        }
        key(Key3; "Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application", "Transferred-from Entry No.")
        {
        }
        key(Key4; "Transferred-from Entry No.", "Cost Application")
        {
        }
        key(Key5; "Inbound Item Entry No.", "Outbound Item Entry No.", "Cost Application")
        {
        }
        key(Key6; "Item Ledger Entry No.", "Output Completely Invd. Date")
        {
        }
    }

    fieldgroups
    {
    }
}

