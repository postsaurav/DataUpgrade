table 1105 "Cost Register"
{
    Caption = 'Cost Register';

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
            OptionCaption = 'Transfer from G/L,Cost Journal,Allocation,Transfer from Budget';
            OptionMembers = "Transfer from G/L","Cost Journal",Allocation,"Transfer from Budget";
        }
        field(3; Text; Text[30])
        {
            Caption = 'Text';
            Editable = false;
        }
        field(4; "From G/L Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'From G/L Entry No.';
            Editable = false;
            TableRelation = "G/L Entry";
        }
        field(5; "To G/L Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'To G/L Entry No.';
            Editable = false;
            TableRelation = "G/L Entry";
        }
        field(6; "From Cost Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'From Cost Entry No.';
            Editable = false;
            TableRelation = "Cost Entry";
        }
        field(7; "To Cost Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'To Cost Entry No.';
            Editable = false;
            TableRelation = "Cost Entry";
        }
        field(8; "No. of Entries"; Integer)
        {
            Caption = 'No. of Entries';
            Editable = false;
        }
        field(15; "Debit Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Debit Amount';
            Editable = false;
        }
        field(16; "Credit Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Credit Amount';
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
        field(26; "Posting Time"; Time)
        {
            Caption = 'Posting Time';
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
        key(Key3; Closed)
        {
        }
    }

    fieldgroups
    {
    }
}

