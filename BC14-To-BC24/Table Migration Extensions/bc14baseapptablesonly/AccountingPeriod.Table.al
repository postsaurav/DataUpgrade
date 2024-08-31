table 50 "Accounting Period"
{
    Caption = 'Accounting Period';

    fields
    {
        field(1; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            NotBlank = true;
        }
        field(2; Name; Text[10])
        {
            Caption = 'Name';
        }
        field(3; "New Fiscal Year"; Boolean)
        {
            Caption = 'New Fiscal Year';
        }
        field(4; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
        field(5; "Date Locked"; Boolean)
        {
            Caption = 'Date Locked';
            Editable = false;
        }
        field(5804; "Average Cost Calc. Type"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Average Cost Calc. Type';
            Editable = false;
            OptionCaption = ' ,Item,Item & Location & Variant';
            OptionMembers = " ",Item,"Item & Location & Variant";
        }
        field(5805; "Average Cost Period"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Average Cost Period';
            Editable = false;
            OptionCaption = ' ,Day,Week,Month,Quarter,Year,Accounting Period';
            OptionMembers = " ",Day,Week,Month,Quarter,Year,"Accounting Period";
        }
    }

    keys
    {
        key(Key1; "Starting Date")
        {
            Clustered = true;
        }
        key(Key2; "New Fiscal Year", "Date Locked")
        {
        }
        key(Key3; Closed)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Starting Date", Name, "New Fiscal Year", Closed)
        {
        }
    }
}

