table 99000786 "Routing Version"
{
    Caption = 'Routing Version';

    fields
    {
        field(1; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            NotBlank = true;
            TableRelation = "Routing Header";
        }
        field(2; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(20; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'New,Certified,Under Development,Closed';
            OptionMembers = New,Certified,"Under Development",Closed;
        }
        field(21; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Serial,Parallel';
            OptionMembers = Serial,Parallel;
        }
        field(22; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Routing No.", "Version Code")
        {
            Clustered = true;
        }
        key(Key2; "Routing No.", "Starting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

