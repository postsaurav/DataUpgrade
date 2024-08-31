table 2100 "Sales Document Icon"
{
    Caption = 'Sales Document Icon';
    DataPerCompany = false;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Quote,Draft Invoice,Unpaid Invoice,Canceled Invoice,Paid Invoice,Overdue Invoice';
            OptionMembers = Quote,"Draft Invoice","Unpaid Invoice","Canceled Invoice","Paid Invoice","Overdue Invoice";
        }
        field(2; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(3; "Media Resources Ref"; Code[50])
        {
            Caption = 'Media Resources Ref';
        }
    }

    keys
    {
        key(Key1; Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

