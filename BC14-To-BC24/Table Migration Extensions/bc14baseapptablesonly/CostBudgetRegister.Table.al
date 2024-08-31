table 1111 "Cost Budget Register"
{
    Caption = 'Cost Budget Register';

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; Source; Option)
        {
            Caption = 'Source';
            Editable = false;
            OptionCaption = 'Transfer from G/L Budget,Cost Journal,Allocation,Manual';
            OptionMembers = "Transfer from G/L Budget","Cost Journal",Allocation,Manual;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(4; "From Budget Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'From Budget Entry No.';
            Editable = false;
            TableRelation = "G/L Budget Entry";
        }
        field(5; "To Budget Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'To Budget Entry No.';
            Editable = false;
            TableRelation = "G/L Budget Entry";
        }
        field(6; "From Cost Budget Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'From Cost Budget Entry No.';
            Editable = false;
            TableRelation = "Cost Budget Entry";
        }
        field(7; "To Cost Budget Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'To Cost Budget Entry No.';
            Editable = false;
            TableRelation = "Cost Budget Entry";
        }
        field(8; "No. of Entries"; Integer)
        {
            Caption = 'No. of Entries';
            Editable = false;
        }
        field(15; Amount; Decimal)
        {
            BlankZero = true;
            Caption = 'Amount';
            Editable = false;
        }
        field(20; "Processed Date"; Date)
        {
            Caption = 'Processed Date';
            Editable = false;
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
        }
        field(23; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(25; Level; Integer)
        {
            BlankZero = true;
            Caption = 'Level';
            Editable = false;
        }
        field(31; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(32; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            Editable = false;
            TableRelation = "Cost Journal Template";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(33; "Cost Budget Name"; Code[10])
        {
            Caption = 'Cost Budget Name';
            Editable = false;
            TableRelation = "Cost Budget Name";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Source)
        {
        }
        key(Key3; "Cost Budget Name")
        {
        }
        key(Key4; "From Cost Budget Entry No.", "To Cost Budget Entry No.")
        {
        }
        key(Key5; Closed)
        {
        }
    }

    fieldgroups
    {
    }
}

