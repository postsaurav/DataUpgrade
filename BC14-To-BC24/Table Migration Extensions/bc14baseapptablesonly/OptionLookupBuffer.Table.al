table 1670 "Option Lookup Buffer"
{
    Caption = 'Option Lookup Buffer';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Option Caption"; Text[30])
        {
            Caption = 'Option Values';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(3; "Lookup Type"; Option)
        {
            Caption = 'Lookup Type';
            DataClassification = SystemMetadata;
            Editable = false;
            OptionCaption = 'Sales,Purchases,Permissions';
            OptionMembers = Sales,Purchases,Permissions;
        }
    }

    keys
    {
        key(Key1; "Option Caption")
        {
            Clustered = true;
        }
        key(Key2; ID)
        {
        }
    }

    fieldgroups
    {
    }
}

