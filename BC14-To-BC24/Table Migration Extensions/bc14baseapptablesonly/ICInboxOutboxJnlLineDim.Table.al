table 423 "IC Inbox/Outbox Jnl. Line Dim."
{
    Caption = 'IC Inbox/Outbox Jnl. Line Dim.';

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(2; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(3; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            TableRelation = "IC Dimension";
        }
        field(6; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            TableRelation = "IC Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(7; "Transaction Source"; Option)
        {
            Caption = 'Transaction Source';
            OptionCaption = 'Rejected,Created';
            OptionMembers = Rejected,Created;
        }
    }

    keys
    {
        key(Key1; "Table ID", "Transaction No.", "IC Partner Code", "Transaction Source", "Line No.", "Dimension Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

