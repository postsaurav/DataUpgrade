table 1471 "Product Video Category"
{
    Caption = 'Product Video Category';

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; Category; Option)
        {
            Caption = 'Category';
            OptionCaption = ' ,Getting Started,,Finance & Bookkeeping,Sales,Reporting & BI,Inventory Management,Project Management,Workflows,Services & Extensions,Setup,Warehouse Management';
            OptionMembers = " ","Getting Started",,"Finance & Bookkeeping",Sales,"Reporting & BI","Inventory Management","Project Management",Workflows,"Services & Extensions",Setup,"Warehouse Management";
        }
        field(3; "Assisted Setup ID"; Integer)
        {
            Caption = 'Assisted Setup ID';
            TableRelation = "Assisted Setup"."Page ID";
        }
        field(4; "Alternate Title"; Text[250])
        {
            Caption = 'Alternate Title';
        }
    }

    keys
    {
        key(Key1; "Assisted Setup ID", Category)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

