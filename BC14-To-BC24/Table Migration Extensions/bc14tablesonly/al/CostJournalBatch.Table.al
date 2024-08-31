table 1102 "Cost Journal Batch"
{
    Caption = 'Cost Journal Batch';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = false;
            TableRelation = "Cost Journal Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(9; "Bal. Cost Type No."; Code[20])
        {
            Caption = 'Bal. Cost Type No.';
            TableRelation = "Cost Type";
        }
        field(10; "Bal. Cost Center Code"; Code[20])
        {
            Caption = 'Bal. Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(11; "Bal. Cost Object Code"; Code[20])
        {
            Caption = 'Bal. Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(12; "Delete after Posting"; Boolean)
        {
            Caption = 'Delete after Posting';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

