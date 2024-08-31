table 10551 "BACS Register"
{
    Caption = 'BACS Register';

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From BACS Entry No."; Integer)
        {
            Caption = 'From BACS Entry No.';
            TableRelation = "BACS Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; "To BACS Entry No."; Integer)
        {
            Caption = 'To BACS Entry No.';
            TableRelation = "BACS Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(15; "BACS File"; BLOB)
        {
            Caption = 'BACS File';
        }
        field(20; "Ledger Entry Amount"; Decimal)
        {
            CalcFormula = Sum ("BACS Ledger Entry".Amount WHERE ("Register No." = FIELD ("No.")));
            Caption = 'Ledger Entry Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Reconciled; Boolean)
        {
            CalcFormula = - Exist ("BACS Ledger Entry" WHERE ("Register No." = FIELD ("No."),
                                                            "Statement Status" = FILTER (<> Closed)));
            Caption = 'Reconciled';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {
        }
        key(Key3; "Source Code", "Journal Batch Name", "Creation Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "From BACS Entry No.", "To BACS Entry No.", "Creation Date", "Source Code")
        {
        }
    }
}

