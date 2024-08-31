table 5928 "Service Status Priority Setup"
{
    Caption = 'Service Status Priority Setup';

    fields
    {
        field(1; "Service Order Status"; Option)
        {
            Caption = 'Service Order Status';
            OptionCaption = 'Pending,In Process,Finished,On Hold';
            OptionMembers = Pending,"In Process",Finished,"On Hold";
        }
        field(2; Priority; Option)
        {
            Caption = 'Priority';
            OptionCaption = 'High,Medium High,Medium Low,Low';
            OptionMembers = High,"Medium High","Medium Low",Low;
        }
    }

    keys
    {
        key(Key1; "Service Order Status")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

