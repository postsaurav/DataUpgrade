table 1265 "Data Exch. Field Mapping Buf."
{
    Caption = 'Data Exch. Field Mapping Buf.';

    fields
    {
        field(1; "Data Exchange Def Code"; Code[20])
        {
            Caption = 'Data Exchange Def Code';
            DataClassification = SystemMetadata;
        }
        field(2; "Data Exchange Line Def Code"; Code[20])
        {
            Caption = 'Data Exchange Line Def Code';
            DataClassification = SystemMetadata;
        }
        field(3; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = SystemMetadata;
        }
        field(4; "Column No."; Integer)
        {
            Caption = 'Column No.';
            DataClassification = SystemMetadata;
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Field,Table';
            OptionMembers = "Field","Table";
        }
        field(10; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            DataClassification = SystemMetadata;
        }
        field(11; "Default Value"; Text[250])
        {
            Caption = 'Default Value';
            DataClassification = SystemMetadata;
        }
        field(13; Source; Text[250])
        {
            Caption = 'Source';
            DataClassification = SystemMetadata;
        }
        field(20; Caption; Text[250])
        {
            Caption = 'Caption';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(22; Depth; Integer)
        {
            Caption = 'Depth';
            DataClassification = SystemMetadata;
        }
        field(23; "Transformation Rule"; Code[20])
        {
            Caption = 'Transformation Rule';
            DataClassification = SystemMetadata;
            TableRelation = "Transformation Rule";
        }
    }

    keys
    {
        key(Key1; "Data Exchange Def Code", "Data Exchange Line Def Code", "Field ID", "Table ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

