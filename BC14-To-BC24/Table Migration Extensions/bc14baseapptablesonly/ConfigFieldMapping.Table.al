table 8628 "Config. Field Mapping"
{
    Caption = 'Config. Field Mapping';
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
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            NotBlank = true;
        }
        field(4; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
        }
        field(5; "Old Value"; Text[250])
        {
            Caption = 'Old Value';
        }
        field(6; "New Value"; Text[250])
        {
            Caption = 'New Value';
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID", "Field ID", "Old Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

