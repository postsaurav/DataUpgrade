table 8614 "Config. Package Record"
{
    Caption = 'Config. Package Record';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            NotBlank = true;
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            Editable = true;
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(4; Invalid; Boolean)
        {
            Caption = 'Invalid';
        }
        field(10; "Parent Record No."; Integer)
        {
            Caption = 'Parent Record No.';
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Package Code", "Table ID", Invalid)
        {
        }
    }

    fieldgroups
    {
    }
}

