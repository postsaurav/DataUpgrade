table 5927 "Repair Status"
{
    Caption = 'Repair Status';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Service Order Status"; Option)
        {
            Caption = 'Service Order Status';
            OptionCaption = 'Pending,In Process,Finished,On Hold';
            OptionMembers = Pending,"In Process",Finished,"On Hold";
        }
        field(4; Priority; Option)
        {
            Caption = 'Priority';
            Editable = false;
            OptionCaption = 'High,Medium High,Medium Low,Low';
            OptionMembers = High,"Medium High","Medium Low",Low;
        }
        field(5; Initial; Boolean)
        {
            Caption = 'Initial';
        }
        field(6; "Partly Serviced"; Boolean)
        {
            Caption = 'Partly Serviced';
        }
        field(7; "In Process"; Boolean)
        {
            Caption = 'In Process';
        }
        field(8; Finished; Boolean)
        {
            Caption = 'Finished';
        }
        field(9; Referred; Boolean)
        {
            Caption = 'Referred';
        }
        field(10; "Spare Part Ordered"; Boolean)
        {
            Caption = 'Spare Part Ordered';
        }
        field(11; "Spare Part Received"; Boolean)
        {
            Caption = 'Spare Part Received';
        }
        field(12; "Waiting for Customer"; Boolean)
        {
            Caption = 'Waiting for Customer';
        }
        field(13; "Quote Finished"; Boolean)
        {
            Caption = 'Quote Finished';
        }
        field(20; "Posting Allowed"; Boolean)
        {
            Caption = 'Posting Allowed';
        }
        field(21; "Pending Status Allowed"; Boolean)
        {
            Caption = 'Pending Status Allowed';
        }
        field(22; "In Process Status Allowed"; Boolean)
        {
            Caption = 'In Process Status Allowed';
        }
        field(23; "Finished Status Allowed"; Boolean)
        {
            Caption = 'Finished Status Allowed';
        }
        field(24; "On Hold Status Allowed"; Boolean)
        {
            Caption = 'On Hold Status Allowed';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Priority)
        {
        }
        key(Key3; Description)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, "Service Order Status")
        {
        }
    }
}

