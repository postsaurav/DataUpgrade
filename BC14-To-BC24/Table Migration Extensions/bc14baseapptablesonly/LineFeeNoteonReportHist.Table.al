table 1053 "Line Fee Note on Report Hist."
{
    Caption = 'Line Fee Note on Report Hist.';
    Permissions = TableData "Line Fee Note on Report Hist." = rimd;

    fields
    {
        field(1; "Cust. Ledger Entry No"; Integer)
        {
            Caption = 'Cust. Ledger Entry No';
            Editable = false;
            TableRelation = "Cust. Ledger Entry"."Entry No." WHERE ("Entry No." = FIELD ("Cust. Ledger Entry No"));
        }
        field(2; "Due Date"; Date)
        {
            Caption = 'Due Date';
            Editable = false;
        }
        field(3; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            Editable = false;
            NotBlank = true;
            TableRelation = Language;
        }
        field(4; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
        }
        field(5; "Reminder Level No"; Integer)
        {
            Caption = 'Reminder Level No';
        }
        field(6; ReportText; Text[200])
        {
            Caption = 'ReportText';
            Editable = false;
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Cust. Ledger Entry No", "Due Date", "Language Code", "Reminder Terms Code", "Reminder Level No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

