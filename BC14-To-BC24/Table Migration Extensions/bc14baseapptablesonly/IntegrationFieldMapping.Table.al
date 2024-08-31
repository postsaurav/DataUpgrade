table 5336 "Integration Field Mapping"
{
    Caption = 'Integration Field Mapping';

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(2; "Integration Table Mapping Name"; Code[20])
        {
            Caption = 'Integration Table Mapping Name';
            TableRelation = "Integration Table Mapping".Name;
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(4; "Integration Table Field No."; Integer)
        {
            Caption = 'Integration Table Field No.';
        }
        field(6; Direction; Option)
        {
            Caption = 'Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
            OptionMembers = Bidirectional,ToIntegrationTable,FromIntegrationTable;
        }
        field(7; "Constant Value"; Text[100])
        {
            Caption = 'Constant Value';
        }
        field(8; "Validate Field"; Boolean)
        {
            Caption = 'Validate Field';
        }
        field(9; "Validate Integration Table Fld"; Boolean)
        {
            Caption = 'Validate Integration Table Fld';
        }
        field(10; "Clear Value on Failed Sync"; Boolean)
        {
            Caption = 'Clear Value on Failed Sync';
        }
        field(11; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Enabled,Disabled';
            OptionMembers = Enabled,Disabled;
        }
        field(12; "Not Null"; Boolean)
        {
            Caption = 'Not Null';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

