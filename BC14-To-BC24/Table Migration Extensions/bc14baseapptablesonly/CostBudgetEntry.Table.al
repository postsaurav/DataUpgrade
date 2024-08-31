table 1109 "Cost Budget Entry"
{
    Caption = 'Cost Budget Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(2; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            TableRelation = "Cost Budget Name";
        }
        field(3; "Cost Type No."; Code[20])
        {
            Caption = 'Cost Type No.';
            TableRelation = "Cost Type";
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            ClosingDates = true;
        }
        field(5; "Cost Center Code"; Code[20])
        {
            Caption = 'Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(6; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(20; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(31; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(32; Allocated; Boolean)
        {
            Caption = 'Allocated';
        }
        field(33; "Allocated with Journal No."; Integer)
        {
            Caption = 'Allocated with Journal No.';
        }
        field(40; "Last Modified By User"; Code[50])
        {
            Caption = 'Last Modified By User';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(42; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(50; "Allocation Description"; Text[80])
        {
            Caption = 'Allocation Description';
        }
        field(51; "Allocation ID"; Code[10])
        {
            Caption = 'Allocation ID';
            TableRelation = "Cost Allocation Source";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Budget Name", "Cost Type No.", Date)
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Budget Name", "Cost Type No.", "Cost Center Code", "Cost Object Code", Date)
        {
            SumIndexFields = Amount;
        }
        key(Key4; "Budget Name", "Cost Center Code", "Cost Type No.", Allocated, Date)
        {
            SumIndexFields = Amount;
        }
        key(Key5; "Budget Name", "Cost Object Code", "Cost Type No.", Allocated, Date)
        {
            SumIndexFields = Amount;
        }
        key(Key6; "Budget Name", "Allocation ID", Date)
        {
        }
    }

    fieldgroups
    {
    }
}

