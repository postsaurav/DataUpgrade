table 5941 "Service Item Component"
{
    Caption = 'Service Item Component';

    fields
    {
        field(1; "Parent Service Item No."; Code[20])
        {
            Caption = 'Parent Service Item No.';
            TableRelation = "Service Item";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Service Item,Item';
            OptionMembers = "Service Item",Item;
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST ("Service Item")) "Service Item"
            ELSE
            IF (Type = CONST (Item)) Item;
        }
        field(7; "Date Installed"; Date)
        {
            Caption = 'Date Installed';
        }
        field(8; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = IF (Type = CONST (Item)) "Item Variant".Code WHERE ("Item No." = FIELD ("No."));
        }
        field(11; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(15; "Service Order No."; Code[20])
        {
            Caption = 'Service Order No.';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(16; "From Line No."; Integer)
        {
            Caption = 'From Line No.';
        }
        field(17; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
    }

    keys
    {
        key(Key1; Active, "Parent Service Item No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Active, "Parent Service Item No.", "From Line No.")
        {
        }
        key(Key3; Type, "No.", Active)
        {
        }
        key(Key4; Active, "Parent Service Item No.", Type, "No.")
        {
        }
        key(Key5; "Parent Service Item No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

